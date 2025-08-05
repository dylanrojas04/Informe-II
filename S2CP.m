% Definir parámetros de la señal
T = 0.1;  % Periodo de la señal (en segundos)
f = 1/T;  % Frecuencia fundamental (en Hz)

% Definir las amplitudes de los armónicos según la tabla proporcionada
A0 = 1.25; % Componente DC (armónico 0)
A1 = 1.9;   % Armónico 1
A3 = 0.63;  % Armónico 3
A5 = 0.38;  % Armónico 5
A7 = 0.27;  % Armónico 7
A9 = 0.21;  % Armónico 9
A11 = 0.17; % Armónico 11

% Definir el tiempo
t = 0:T/100:2*T;  % 2 períodos de la señal con 100 muestras por período

% Reconstrucción de la señal cuadrada con los armónicos impares y usando seno
V0 = A0 * ones(size(t));               % Componente DC (armónico 0)
V1 = A1 * sin(2 * pi * f * t);         % Armónico 1
V3 = A3 * sin(2 * pi * 3 * f * t);     % Armónico 3
V5 = A5 * sin(2 * pi * 5 * f * t);     % Armónico 5
V7 = A7 * sin(2 * pi * 7 * f * t);     % Armónico 7
V9 = A9 * sin(2 * pi * 9 * f * t);     % Armónico 9
V11 = A11 * sin(2 * pi * 11 * f * t);  % Armónico 11

% Señal reconstruida sumando todos los armónicos
V_square = V0 + V1 + V3 + V5 + V7 + V9 + V11;

% Graficar la señal cuadrada con el offset
figure;
plot(t, V_square);
title('Señal Cuadrada Reconstruida con Armónicos y Componente DC');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
