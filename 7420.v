module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire w1,w2;
    and(w1,p1a,p1b,p1c,p1d);
    and(w2,p2a,p2b,p2c,p2d);
    not(p1y,w1);
    not(p2y,w2);


endmodule
