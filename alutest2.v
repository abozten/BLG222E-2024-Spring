`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU Computer Engineering Department
// Engineer: Kadir Ozlem
// Project Name: BLG222E Project 1 Simulation
//////////////////////////////////////////////////////////////////////////////////

module ALUSimulation3();
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
        


test_no = 1; //A (16-bit)
              A = 16'h1111;
              B =16'h8888;
              ALU.FlagsOut = 4'b1010;
              FunSel =5'b10000;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'h1111, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,0, test_no, "O");


test_no = 2; //A (16-bit)
              A = 16'h0000;
              B =16'h8888;
              ALU.FlagsOut = 4'b0011;
              FunSel =5'b10000;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'h0000, test_no, "ALUOut");
              F.CheckValues(Z,1, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

test_no = 3; //A (8-bit)
              A = 8'hbc;
              B =8'h00;
              ALU.FlagsOut = 4'b1000;
              FunSel =5'b00000;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hbc, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");             

test_no = 4; //B (16-bit)
              A = 16'h1111;
              B =16'h1111;
              ALU.FlagsOut = 4'b1010;
              FunSel =5'b10001;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'h1111, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,0, test_no, "O");


test_no = 5; //B (16-bit)
              A = 16'h0000;
              B =16'h0000;
              ALU.FlagsOut = 4'b0011;
              FunSel =5'b10001;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'h0000, test_no, "ALUOut");
              F.CheckValues(Z,1, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

test_no = 6; //B (8-bit)
              A = 8'hbc;
              B =8'hbc;
              ALU.FlagsOut = 4'b1000;
              FunSel =5'b00001;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hbc, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O"); 

test_no = 7; //NOT A (8-bit)
              A = 8'h11;
              B =8'hbc;
              ALU.FlagsOut = 4'b1100;
              FunSel =5'b00010;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hee, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");
test_no = 8; //NOT B (8-bit)
              A = 8'hbc;
              B =8'h11;
              ALU.FlagsOut = 4'b1000;
              FunSel =5'b00011;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hee, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");         

         

test_no = 9; //NOT A (16-bit)
              A = 16'h1111;
              B =16'h0000;
              ALU.FlagsOut = 4'b0011;
              FunSel =5'b10010;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'heeee, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");

test_no = 10; //NOT B (16-bit)
              A = 16'h0000;
              B =16'h1111;
              ALU.FlagsOut = 4'b0011;
              FunSel =5'b10011;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'heeee, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");    

test_no = 11; //A + B (8-bit)
              A = 8'haa;
              B =8'hcc;
              ALU.FlagsOut = 4'b1100;
              FunSel =5'b00100;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'h76, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");         

         

test_no = 12; //ASR A (16-bit)
              A = 16'h1111;
              B =16'h0000;
              ALU.FlagsOut = 4'b0011;
              FunSel =5'b11101;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut,16'h0888, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,1, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,1, test_no, "O");
                      
test_no = 13; //A + B + Carry (8-bit)
              A = 8'haa;
              B =8'h11;
              ALU.FlagsOut = 4'b1100;
              FunSel =5'b00101;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'hbc, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,1, test_no, "N");
              F.CheckValues(O,0, test_no, "O");

test_no = 14; //LSR A (8-bit)
              A = 8'haa;
              B =8'h11;
              ALU.FlagsOut = 4'b1101;
              FunSel =5'b01100;
              WF =1;
              #5
              clk.Clock();
              F.CheckValues(ALUOut[7:0],16'h55, test_no, "ALUOut");
              F.CheckValues(Z,0, test_no, "Z");
              F.CheckValues(C,0, test_no, "C");
              F.CheckValues(N,0, test_no, "N");
              F.CheckValues(O,1, test_no, "O");
        F.FinishSimulation();
    end
endmodule
