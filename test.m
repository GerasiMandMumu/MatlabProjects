clear
syms x k Pi
f_x = 2*x + 1;
f_x = expand(f_x);
%a_0 = (1/Pi) * int(f_x, x, -Pi, Pi);
%a_k = (1/Pi) * int(f_x*cos(Pi*k*x/Pi), x, -Pi, Pi);
b_k = (1/Pi)* int(f_x*sin(Pi*k*x/Pi),x, -Pi, Pi);

for k=1:50
    %a(k)=eval((1/Pi) * int(f_x*cos(Pi*k*x/Pi), x, -Pi, Pi));
    b(k)=eval((1/Pi)* int(f_x*sin(Pi*k*x/Pi),x, -Pi, Pi));
end
 
a(1)
b(1)