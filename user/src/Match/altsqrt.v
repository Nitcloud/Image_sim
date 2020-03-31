`timescale 1 ps / 1 ps

module altsqrt (
    radical,  // Input port for the radical
    clk,      // Clock port
    ena,      // Clock enable port
    aclr,     // Asynchronous clear port
    q,        // Output port for returning the square root of the radical.
    remainder // Output port for returning the remainder of the square root.
);

// GLOBAL PARAMETER DECLARATION
    parameter q_port_width = 1; // The width of the q port
    parameter r_port_width = 1; // The width of the remainder port
    parameter width = 1;        // The width of the radical
    parameter pipeline = 0;     // The latency for the output

// INPUT PORT DECLARATION
    input [width - 1 : 0] radical;
    input clk;
    input ena;
    input aclr;

// OUTPUT PORT DECLARATION
    output [q_port_width - 1 : 0] q;
    output [r_port_width - 1 : 0] remainder;

// INTERNAL REGISTERS DECLARATION
    reg[q_port_width - 1 : 0] q_temp;
    reg[q_port_width - 1 : 0] q_pipeline[(pipeline +1) : 0];
    reg[r_port_width : 0]     r_temp;
    reg[r_port_width - 1 : 0] remainder_pipeline[(pipeline +1) : 0];
    reg[q_port_width - 1 : 0] q_value_temp;
    reg[r_port_width : 0]     q_value_comp;

// INTERNAL TRI DECLARATION
    tri1 clk;
    tri1 ena;
    tri0 aclr;

// LOCAL INTEGER DECLARATION
    integer value1;
    integer value2;
    integer index;
    integer q_index;
    integer i;
    integer i1;
    integer pipe_ptr;


// INITIAL CONSTRUCT BLOCK
    initial
    begin : INITIALIZE
        // Check for illegal mode
        if(width < 1)
        begin
            $display("width (%d) must be greater than 0.(ERROR)", width);
            $finish;
        end
        pipe_ptr = 0;
        
        for (i = 0; i < (pipeline + 1); i = i + 1)
        begin
            q_pipeline[i] <= 0;
            remainder_pipeline[i] <= 0;
        end
    end // INITIALIZE

// ALWAYS CONSTRUCT BLOCK

    // Perform square root calculation.
    // In general, below are the steps to calculate the square root and the
    // remainder.
    //
    // Start of with q = 0 and remainder= 0
    // For every iteration, do the same thing:
    // 1) Shift in the next 2 bits of the radical into the remainder
    //    Eg. if the radical is b"101100". For the first iteration,
    //      the remainder will be equal to b"10".
    // 2) Compare it to the 4* q + 1
    // 3) if the remainder is greater than or equal to 4*q + 1
    //        remainder = remainder - (4*q + 1)
    //        q = 2*q + 1
    //    otherwise
    //        q = 2*q
    always @(radical)
    begin : SQUARE_ROOT
        // Reset variables
        value1 = 0;
        value2 = 0;
        q_index = (width - 1) / 2;
        q_temp = {q_port_width{1'b0}};
        r_temp = {(r_port_width + 1){1'b0}};
        q_value_temp = {q_port_width{1'b0}};
        q_value_comp = {(r_port_width + 1){1'b0}};

        // If the number of the bits of the radical is an odd number,
        // Then for the first iteration, only the 1st bit will be shifted
        // into the remainder.
        // Eg. if the radical is b"11111", then the remainder is b"01".
        if((width % 2) == 1)
        begin
            index = width + 1;
            value1 = 0;
            value2 = (radical[index - 2] === 1'b1) ? 1'b1 : 1'b0;
        end
        else if (width > 1)
        begin
        // Otherwise, for the first iteration, the first two bits will be shifted
        // into the remainder.
        // Eg. if the radical is b"101111", then the remainder is b"10".
            index = width;
            value1 = (radical[index - 1] === 1'b1) ? 1'b1 : 1'b0;
            value2 = (radical[index - 2] === 1'b1) ? 1'b1 : 1'b0;
        end

        // For every iteration
        for(index = index - 2; index >= 0; index = index - 2)
        begin
            // Get the remainder value by shifting in the next 2 bits
            // of the radical into the remainder
            r_temp =  (r_temp<<2) + (2 * value1) + value2;
            q_value_comp = ((q_value_temp<<2)  + 1);

            // if remainder >= (4*q + 1)
            if (r_temp >= q_value_comp)
            begin
                // remainder = remainder - (4*q + 1)
                r_temp = r_temp - q_value_comp;
                // q = 2*q + 1
                q_value_temp = (q_value_temp<<1) + 1;
                // set the q[q_index] = 1
                q_temp[q_index] = 1'b1;
            end
            else  // if remainder < (4*q + 1)
            begin
                // q = 2*q
                q_value_temp = q_value_temp<<1;
                // set the q[q_index] = 0
                q_temp[q_index] = 1'b0;
            end

            // if not the last iteration, get the next 2 bits of the radical
            if(index >= 2)
            begin
                value1 = (radical[index - 1] === 1'b1)? 1: 0;
                value2 = (radical[index - 2] === 1'b1)? 1: 0;
            end

            // Reduce the current index of q by 1
            q_index = q_index - 1;

        end
    end

    // store the result to a pipeline(to create the latency)
    always @(posedge clk or posedge aclr)
    begin
        if (aclr) // clear the pipeline for result to 0
        begin
            for (i1 = 0; i1 < (pipeline + 1); i1 = i1 + 1)
            begin
                q_pipeline[i1] <= 0;
                remainder_pipeline[i1] <= 0;
            end
        end
        else if (ena == 1)
        begin          
            remainder_pipeline[pipe_ptr] <= r_temp[(r_port_width - 1) : 0];
            q_pipeline[pipe_ptr] <= q_temp;

            if (pipeline > 1)
                pipe_ptr <= (pipe_ptr + 1) % pipeline;
        end
    end

// CONTINOUS ASSIGNMENT
    assign q = (pipeline > 0) ? q_pipeline[pipe_ptr] : q_temp;
    assign remainder = (pipeline > 0) ? remainder_pipeline[pipe_ptr] : r_temp[(r_port_width - 1) : 0];
    
endmodule //altsqrt