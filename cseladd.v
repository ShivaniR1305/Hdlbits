module top_module(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);
    reg cout;
    wire [15:0]sum_high1;
    wire [15:0]sum_high2;
    add16 uut1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(cout));
    add16 uut2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.sum(sum_high1),.cout());
    add16 uut3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.sum(sum_high2),.cout());
    always @(*) begin
        if(cout==0) sum[31:16]=sum_high1;
        else sum[31:16]=sum_high2;
    end
    
    

endmodule
