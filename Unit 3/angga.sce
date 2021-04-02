clc

scf(0) // figure(n)
plot(out.time, out.values, out_1.time, out_1.values, out_2.time, out_2.values, out_3.time, out_3.values, 'LineWidth', 2);
xgrid()
xlabel('time (sec)'); 
ylabel('angle');
legend('Gain=1','Gain=0.1','Gain=0.01','Gain=0.001');

xs2png(0,'step_response.png');

s = poly(0, 's');
P = syslin('c', 1/((68*s^2+1.3*s)*(s+3)));
C = syslin('c', 20000 * (s+0.013)/(s+20));

Tyr = P * C / (1 + P*C)
Tyr

scf(1)
plzr(Tyr)

xs2png(1,'pole_zero+_plot.png');

scf(2)
L = C * P;
evans(L);
sgrid();

xs2png(2,'rootlocus.png');

// Poles
pole = roots(Tyr.den)

// Zeros
zero = roots(Tyr.num)

[kmax, s] = kpure(L)
