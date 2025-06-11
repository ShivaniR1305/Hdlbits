module full_adder(input a,b,c,output sum,carry);
        assign sum=a^b^c;
        assign carry=a&b|b&c|c&a;
    endmodule
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    wire [99:0]cout1;
	generate
        for(i=0;i<100;i++) begin: fa_loop
        if (i==0) full_adder dut(.a(a[i]),.b(b[i]),.c(cin),.sum(sum[i]),.carry(cout1[i]));
            else full_adder dut(.a(a[i]),.b(b[i]),.c(cout1[i-1]),.sum(sum[i]),.carry(cout1[i]));
            assign cout[i]=cout1[i];
    end
    endgenerate

endmodule
