/* 

! vlog *.v

! vsim add_sub_tb -c -do "run -all"

*/

module add_sub_tb;

    reg [2:0] A;
    reg [2:0] B;
    reg ctrl;
    wire [3:0] C;
    wire zero;
    wire sign;

    add_sub UUT (
    .A(A),
    .B(B),
    .C(C),
    .sign(sign),
    .zero(zero),
    .ctrl(ctrl)
);
    integer a = 0;
    integer b = 0;
    integer c = 0;
    integer i;
    integer j;
    integer file_writing_add;
    integer file_writing_sub;
    reg [3:0] temp;
    reg [3:0] temp2;
    initial begin
        file_writing_add = $fopen("./add.txt", "w");
        file_writing_sub = $fopen("./sub.txt", "w");
        for (c = 0; c <= 1; c = c + 1  ) begin
            ctrl = c[1:0];
            if (ctrl == 1'b1) begin
                for (a = -3; a <= 3; a = a + 1 ) begin
                    #100
                    case (a[2:0]) 
                    3'b101 : begin 
                        temp[0] = a[0];
                        temp[1] = ~a[1];
                        temp[2] = a[2];
                    end
                    3'b111 : begin 
                        temp[0] = a[0];
                        temp[1] = ~a[1];
                        temp[2] = a[2];
                    end
                    default: begin
                        temp = i[2:0];
                    end 
                    endcase
                    for (b = -3; b <= 3; b = b + 1 ) begin
                        #100
                        case (b[2:0]) 
                        3'b101 : begin 
                            temp2[0] = b[0];
                            temp2[1] = ~b[1];
                            temp2[2] = b[2];
                        end
                        3'b111 : begin 
                            temp2[0] = b[0];
                            temp2[1] = ~b[1];
                            temp2[2] = b[2];
                        end
                        default: begin
                            temp2 = b[2:0];
                        end 
                        endcase
                        A = temp[2:0];
                        B = temp2[2:0];
                        #100;
                        A = a[2:0];
                        B = b[2:0];
                        #100;
                        if (A[2] == 1'b0) begin
                            $fdisplay(file_writing_sub, "A = %b in Binary, %d in decimal", A , A[1:0]);
                        end
                        else begin
                            if (A[0] == 1'b1) begin
                                $fdisplay(file_writing_sub, "A = %b%b%b in Binary, -%d in decimal", A[2], ~A[1], A[0] , (~a[1:0]+ 1'b1));
                            end
                            else begin
                                $fdisplay(file_writing_sub, "A = %b in Binary, -%d in decimal", A[2:0] , A[1:0]);
                            end
                        end
                        if (B[2] == 1'b0) begin
                            $fdisplay(file_writing_sub, "B = %b in Binary, %d in decimal", B , B[1:0]);
                        end
                        else begin
                             if (B[0] == 1'b1) begin
                                $fdisplay(file_writing_sub, "B = %b%b%b in Binary, -%d in decimal", B[2], ~B[1], B[0] , (~b[1:0]+ 1'b1));
                            end
                            else begin
                                $fdisplay(file_writing_sub, "B = %b in Binary, -%d in decimal", B[2:0] , B[1:0]);
                            end
                        end
                        if (C[3] == 1'b0) begin
                            $fdisplay(file_writing_sub, "C = %b in Binary, %d in decimal", C , C[2:0]); 
                        end
                        else begin
                            $fdisplay(file_writing_sub, "C = %b in Binary, -%d in decimal", C , C[2:0]); 
                        end
                        $fdisplay(file_writing_sub, "Sign which should be C[3] last bit is %b  (1 -ve, 0 +ve)", sign);
                        $fdisplay(file_writing_sub, "Output being zero %b ", zero);
                        $fdisplay(file_writing_sub, "Division by zero 0 ");
                    end 
                end
            end
            else begin
                for (a = -3; a <= 3; a = a + 1 ) begin
                    #100
                    case (a[2:0]) 
                    3'b101 : begin 
                        temp[0] = a[0];
                        temp[1] = ~a[1];
                        temp[2] = a[2];
                    end
                    3'b111 : begin 
                        temp[0] = a[0];
                        temp[1] = ~a[1];
                        temp[2] = a[2];
                    end
                    default: begin
                        temp = a[2:0];
                    end 
                    endcase
                    for (b = -3; b <= 3 ; b = b + 1 ) begin
                        #100
                        case (b[2:0]) 
                        3'b101 : begin 
                            temp2[0] = b[0];
                            temp2[1] = ~b[1];
                            temp2[2] = b[2];
                        end
                        3'b111 : begin 
                            temp2[0] = b[0];
                            temp2[1] = ~b[1];
                            temp2[2] = b[2];
                        end
                        default: begin
                            temp2 = b[2:0];
                        end 
                        endcase
                        A = temp[2:0];
                        B = temp2[2:0];
                        #100;
                        #100;
                        if (A[2] == 1'b0) begin
                            $fdisplay(file_writing_add, "A = %b in Binary, %d in decimal", A , A[1:0]);
                        end
                        else begin
                            if (A[0] == 1'b1) begin
                                $fdisplay(file_writing_add, "A = %b in Binary, -%d in decimal", A , (~a[1:0]+ 1'b1));
                            end
                            else begin
                                $fdisplay(file_writing_add, "A = %b in Binary, -%d in decimal", A[2:0] , A[1:0]);
                            end
                        end
                        if (B[2] == 1'b0) begin
                            $fdisplay(file_writing_add, "B = %b in Binary, %d in decimal", B , B[1:0]);
                        end
                        else begin
                             if (B[0] == 1'b1) begin
                                $fdisplay(file_writing_add, "B = %b in Binary, -%d in decimal", B , (~b[1:0]+ 1'b1));
                            end
                            else begin
                                $fdisplay(file_writing_add, "B = %b in Binary, -%d in decimal", B[2:0] , B[1:0]);
                            end
                        end
                        if (C[3] == 1'b0) begin
                            $fdisplay(file_writing_add, "C = %b in Binary, %d in decimal", C , C[2:0]); 
                        end
                        else begin
                            $fdisplay(file_writing_add, "C = %b in Binary, -%d in decimal", C , C[2:0]); 
                        end
                        $fdisplay(file_writing_add, "Sign which should be C[3] last bit is %b  (1 -ve, 0 +ve)", sign);
                        $fdisplay(file_writing_add, "Output being zero %b ", zero);
                        $fdisplay(file_writing_add, "Division by zero 0 ");
                    end 
                end
            end
        end
        $fclose(file_writing_add);
        $fclose(file_writing_sub);
        $finish();
    end
endmodule