T = 0.1;
f = 1/T;

A1 = 1.077;
A5 = 0;
A7 = 0;
A9 = 0;
A11 = 0;
DC = 0;

t = 0:T/100:2*T;

V1 = A1 * sin(2 * pi * f * t);
V5 = A5 * sin(2 * pi * 5 * f * t);
V7 = A7 * sin(2 * pi * 7 * f * t);
V9 = A9 * sin(2 * pi * 9 * f * t);
V11 = A11 * sin(2 * pi * 11 * f * t);

VT = V1 + V5 + V7 + V9 + V11 + DC;

plot(t, VT);
title('Señal Reconstruida a partir de Armónicos Teóricos');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

