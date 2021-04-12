clear
clc

s = %s;
t = 0:0.01:1000;

G = 1 / (68*s^2 + 1.3*s); // Plant G

// Tanpa Kompensator
no_comp_sys = syslin('c', G / (1 + G));
no_comp = csim('step', t, no_comp_sys);

scf(1)
title('Tanpa Kompensator')
plot(t, no_comp, 'LineWidth', 2)
xlabel('Waktu (sekon)')
xgrid();

scf(2)
evans(G)

// Dengan Kompensator Lead
Gain = 3083.9;
C_lead = (s + 1.5) / (s + 15.864);

comp = Gain * G * C_lead

with_comp_sys = syslin('c', comp / (1 + comp));
with_comp = csim('step', t, with_comp_sys);

scf(3)
title('Dengan Kompensator Lead')
plot(t(1, 1:5000), with_comp(1, 1:5000), 'LineWidth', 2)
xlabel('Waktu (sekon)')
xgrid();

scf(4)
evans(C_lead)

// Dengan Kompensator Lag
C_lag = (s + 0.1) / (s + (3/70));

comp = C_lag * G

with_comp_sys = syslin('c', comp / (1 + comp));
with_comp = csim('step', t, with_comp_sys);

scf(5)
title('Dengan Kompensator Lag')
plot(t(1, 1:5000), with_comp(1, 1:5000), 'LineWidth', 2)
xlabel('Waktu (sekon)')
xgrid();

scf(6)
evans(C_lag)

// Dengan Kompensator Lead-Lag
C_lag = (s + 0.1) / (s + (3/70));

comp = C_lag * Gain * C_lead * G

with_comp_sys = syslin('c', comp / (1 + comp));
with_comp = csim('step', t, with_comp_sys);

scf(7)
title('Dengan Kompensator Lead-Lag')
plot(t(1, 1:5000), with_comp(1, 1:5000), 'LineWidth', 2)
xlabel('Waktu (sekon)')
xgrid();

scf(8)
evans(C_lag * Gain * C_lead)
