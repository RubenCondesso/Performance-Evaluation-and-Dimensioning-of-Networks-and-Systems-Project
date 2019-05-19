/* Objective function */
min: r;

/* Variable bounds */

x134+x124+x1234=1;
x24+x234 =1;

5*x124+5*x1234 <= 10*r;
5*x134 <= 10*r;
5*x1234 + 5*x234 <= 10*r;
5*x124 + 5*x24 <= 10*r;
5*x134 + 5*x1234 + 5*x234 <= 20*r;

0 <= r <= 1;

bin x124, x1234, x24, x134, x234;