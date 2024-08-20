/*

! vlog *.v

! vsim Alu -c -do "run -all"
! vsim Alu -do "run -all"
! vsim Alu_tb -c -do "run -all"

later to be the fucking multiplexer and main tester which calls all other modules
its module calls the other modules I suppose
*/
// # 'include "add_sub.v"


module Alu_tb;

    wire [2:0] A;
    wire [2:0] B;
    wire [1:0] choice;
    wire [4:0] C;
    wire zero;
    wire sign;
    wire div_by_zero;

    Alu UUT (
     .A(A),
     .B(B),
     .S(choice),
     .R(C),
     .SF(sign),
     .ZF(zero),
     .DZF(div_by_zero)
);
    integer k;
    integer l;
    integer m;
        initial begin
            for (k = 0; k <= 2'b11; k = k + 1) begin
                for (l = -3; l <= 3; l = l + 1 ) begin
                    for (m = -3; m<= 3; m = m + 1 ) begin
                        $display("A = %b", A);
                        $display("B = %b", B);
                        $display("C = %b", C);
                        case (choice)
                            2'b00: $display("ABOVE WAS ADDITION");
                            2'b01: $display("ABOVE WAS SUBTRACTION"); 
                            2'b10: $display("ABOVE WAS MULTIPLICATION");
                            2'b11: $display("ABOVE WAS REMAINDER");
                            default:; 
                        endcase
                    end
                end
            end
        end
endmodule
