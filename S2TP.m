% Definir parámetros de la señal
T = 0.1;  % Periodo de la señal (en segundos)
f = 1/T;  % Frecuencia fundamental (en Hz)

% Definir las amplitudes de los armónicos según la nueva tabla proporcionada
A0 = 1.49;  % Componente de corriente continua (DC)
A1 = 1.21;   % Amplitud fundamental de la señal
A3 = 0.13;   % Armónico 3
A5 = 0.048;  % Armónico 5
A7 = 0.024;  % Armónico 7
A9 = 0.015;  % Armónico 9
A11 = 0.01;  % Armónico 11

% Definir el tiempo
t = 0:T/100:2*T;  % 2 períodos de la señal con 100 muestras por período

% Reconstrucción de la señal triangular con los armónicos impares y usando coseno
V0 = A0 * ones(size(t));               % Componente DC (armónico 0)
V1 = A1 * cos(2 * pi * f * t);         % Armónico 1
V3 = A3 * cos(2 * pi * 3 * f * t);     % Armónico 3
V5 = A5 * cos(2 * pi * 5 * f * t);     % Armónico 5
V7 = A7 * cos(2 * pi * 7 * f * t);     % Armónico 7
V9 = A9 * cos(2 * pi * 9 * f * t);     % Armónico 9
V11 = A11 * cos(2 * pi * 11 * f * t);  % Armónico 11

% Señal reconstruida sumando todos los armónicos
VT = V0 + V1 + V3 + V5 + V7 + V9 + V11;

% Graficar la señal reconstruida
figure;
plot(t, VT);
title('Señal Reconstruida a partir de Armónicos Teoricos');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
