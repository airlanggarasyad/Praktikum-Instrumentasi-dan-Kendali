clear
clc

// Inisiasi variabel laplace dan nilai gain
s = poly(0, 's')
gain = 4095/360; 

// Model
P = syslin('c', gain / (10 * s^2 + 0.1 * s));
f = linspace(0.01, 1, 1000)

// Frequency response
fres = repfreq(P, f);

// Find all value that less than 0.707
ibw = find(abs(fres) < 0.707);

// Print bandwidth frequency
disp(f(ibw(1)))

// Plot frequency response
H = syslin ('c', 1 / (1 + 0.8 * s));
gainplot(H)
