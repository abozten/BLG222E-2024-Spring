module register_16bit (
    input [2:0] FunSel,
    input E,
    input [15:0] I,
    output reg [15:0] Q
);

    always @(*) begin
        case ({E, FunSel})
            4'b0_xxx: Q <= Q; // Retain value
            4'b1_000: Q <= Q - 1; // Decrement
            4'b1_001: Q <= Q + 1; // Increment
            4'b1_010: Q <= I; // Load
            4'b1_011: Q <= 0; // Clear
            4'b1_100: Q <= {8'b0, I[7:0]}; // Write Low, Clear High
            4'b1_101: Q <= {Q[15:8], I[7:0]}; // Only Write Low
            4'b1_110: Q <= {I[7:0], Q[7:0]}; // Only Write High
            4'b1_111: Q <= {{8{I[7]}}, I[7:0]}; // Sign Extend and Write Low
            default: Q <= Q; // Retain value
        endcase
    end

endmodule