/* Objective function */
min: y12+y13+y24+y23+y34 ;
/* Variable bounds */
1 = x124 + x134 +x1234;
1 = x24 + x234;

5*x124 + 5*x1234 <= 10*p12;
5*x1234 + 5*x134 + 5*x234 <= 20*p34;
5*x134 <= 10*p13;
5*x1234 + 5*x234 <= 10*p23;
5*x24 + 5*x124 <= 10*p24;

y12 >= 1.5*p12;
y12 >= 4.5*p12-1;
y12 >= 15*p12-8;
y12 >= 50*p12-36;
y12 >= 200*p12-171;
y12 >= 4000*p12-3781;

y13 >= 1.5*p13;
y13 >= 4.5*p13-1;
y13 >= 15*p13-8;
y13 >= 50*p13-36;
y13 >= 200*p13-171;
y13 >= 4000*p13-3781;

y23 >= 1.5*p23;
y23 >= 4.5*p23-1;
y23 >= 15*p23-8;
y23 >= 50*p23-36;
y23 >= 200*p23-171;
y23 >= 4000*p23-3781;

y24 >= 1.5*p13;
y24 >= 4.5*p24-1;
y24 >= 15*p24-8;
y24 >= 50*p24-36;
y24 >= 200*p24-171;
y24 >= 4000*p24-3781;

y34 = 1.5*p34;
y34 >= 4.5*p34-1;
y34 >= 15*p34-8;
y34 >= 50*p34-36;
y34 >= 200*p34-171;
y34 >= 4000*p34-3781;

y12 >=0;
y13 >=0;
y24 >=0;
y23 >=0;
y34 >=0;
0 <= p12 <=1;
0 <= p13 <=1;
0 <= p23 <=1;
0 <= p24 <=1;
0 <= p34 <=1;

bin x134, x24, x234, x1234, x124;