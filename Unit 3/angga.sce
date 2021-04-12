clc

s = poly(0, 's');
P = syslin('c', 1/((68*s^2+1.3*s)*(s+3)));
C = syslin('c', 20000 * (s + 0.01)/(s + 100));

// tanpa compensator
scf(1)
L = C * P;
evans(L);
sgrid();

xs2png(1,'tanpa_comp.png');

C = syslin('c', 20000 * (s + 0.01)/(s + 100)^2);

// dengan compensator
scf(2)
L = C * P;
evans(L);
sgrid();

xs2png(2,'dengan_comp.png');
