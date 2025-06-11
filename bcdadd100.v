module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0]cout1;
      genvar i;
    generate
        for(i=0;i<100;i++) begin: bcd_faloop
            if(i==0) begin
                bcd_fadd dut(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(cout1[0]));
            end
            else begin
                bcd_fadd dut(.a(a[i*4+3:i*4]),.b(b[i*4+3:i*4]),.cin(cout1[i-1]),.sum(sum[i*4+3:i*4]),.cout(cout1[i]));
            end
        end
    endgenerate
    assign cout=cout1[99];
endmodule
