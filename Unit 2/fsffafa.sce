clear
clc

s = poly(0, 's');
t = 0:0.001:5;

sys_G = 25 / (s^2 + 4*s + 25);
sys = syslin('c', sys_G);

sim_result = csim('step', t, sys);

time_20_os = find(sim_result <= 0.98); // Waktu ketika overshoot 20%
settling_time = time_20_os($) * 0.001 // Settling time

time_90 = find(sim_result >= 0.9); // Waktu ketika >= 90% dari target
time_10 = find(sim_result >= 0.1); // Waktu ketika >= 10% dari target

rise_time = (time_90(1) - time_10(1)) * 0.001 // Rise time

max_val = max(sim_result);
perct = abs(1 - max_val) * 100;

printf('\nOvershoot     : %.3f%%', perct)
printf('\nRise time     : %.3f', rise_time)
printf('\nSettling time : %.3f \n\n', settling_time)
