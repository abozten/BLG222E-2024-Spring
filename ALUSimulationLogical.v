`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU Computer Engineering Department
// Engineer: Kadir Ozlem
// Project Name: BLG222E Project 1 Simulation
//////////////////////////////////////////////////////////////////////////////////

module ALUSimulationLogical();
    reg[15:0] A, B;
    reg[4:0] FunSel;
    reg WF;
    wire[15:0] ALUOut;
    wire[3:0] FlagsOut;
    integer test_no;
    wire Z, C, N, O;
    CrystalOscillator clk();
    ArithmeticLogicUnit ALU( .A(A), .B(B), .FunSel(FunSel), .WF(WF), 
                            .Clock(clk.clock), .ALUOut(ALUOut), .FlagsOut(FlagsOut));
        
    FileOperation F();
    
    assign {Z,C,N,O} = FlagsOut;
    
    initial begin
        F.SimulationName ="ArithmeticLogicUnit";
        F.InitializeSimulation(0);
        clk.clock = 0;
        


test_no = 1; // A AND B (16-bit)
              A = 16'he168;
              B =16'hbca5;
              ALU.FlagsOut = 4'b1000;
              FunSel =5'b10111;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'ha020, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");

test_no = 2; // A AND B (8-bit)
              A = 8'h69;
              B =8'he1;
              ALU.FlagsOut = 4'b1101;
              FunSel =5'b00111;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'h61, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

 test_no = 3; // A OR B (16-bit)
              A = 16'haa6d;
              B =16'hac34;
              ALU.FlagsOut = 4'b1010;
              FunSel =5'b11000;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'hae7d, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");

test_no = 4; // A OR B (8-bit)
              A = 8'haa;
              B =8'hcd;
              ALU.FlagsOut = 4'b1101;
              FunSel =5'b01000;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hef, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

test_no = 5; // A XOR B (16-bit)
              A = 16'habcd;
              B =16'h0f12;
              ALU.FlagsOut = 4'b1001;
              FunSel =5'b11001;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'ha4df, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

test_no = 6; // A XOR B (8-bit)
              A = 8'haa;
              B =8'h11;
              ALU.FlagsOut = 4'b1101;
              FunSel =5'b01001;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hbb, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");     

test_no = 7; // A NAND B (16-bit)
              A = 16'h1111;
              B =16'h8888;
              ALU.FlagsOut = 4'b1000;
              FunSel =5'b11010;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'hffff, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");                                  
        F.FinishSimulation();
    end
endmodule