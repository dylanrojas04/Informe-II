% Definir parámetros de la señal
T = 0.1; % Periodo de la señal (en segundos)
f = 1/T; % Frecuencia fundamental (en Hz)

% Amplitudes de los armónicos proporcionados
A1 = 1.077; % Amplitud del armónico 1
A5 = 0;     % Amplitud del armónico 5
A7 = 0;     % Amplitud del armónico 7
A9 = 0;     % Amplitud del armónico 9
A11 = 0;    % Amplitud del armónico 11

% Componente de corriente continua (DC)
DC = 1.027;

% Definir el tiempo
t = 0:T/100:2*T; % 2 períodos de la señal con 100 muestras por período

% Reconstrucción de la señal a partir de los armónicos
V1 = A1 * sin(2 * pi * f * t);      % Primer armónico (fundamental)
V5 = A5 * sin(2 * pi * 5 * f * t);  % Quinto armónico
V7 = A7 * sin(2 * pi * 7 * f * t);  % Séptimo armónico
V9 = A9 * sin(2 * pi * 9 * f * t);  % Noveno armónico
V11 = A11 * sin(2 * pi * 11 * f * t);% Undécimo armónico

% Señal reconstruida sumando todos los armónicos y el componente DC
VT = V1  + V5 + V7 + V9 + V11 + DC;

% Graficar la señal reconstruida
figure;
plot(t, VT);
title('Señal Reconstruida a partir de Armónicos Teóricos');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;
