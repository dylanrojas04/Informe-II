% Definir parámetros de la señal
T = 0.1;  % Periodo de la señal (en segundos)
f = 1/T;  % Frecuencia fundamental (en Hz)

% Amplitudes de los armónicos proporcionadas
A1 = 0.95;   % Armónico 1
A3 = -0.31;  % Armónico 3
A5 = 0.19;   % Armónico 5
A7 = -0.13;  % Armónico 7
A9 = 0.10;   % Armónico 9
A11 = -0.08; % Armónico 11

% Definir el tiempo
t = 0:T/100:2*T;  % 2 períodos de la señal con 100 muestras por período

% Reconstrucción de la señal de pulso con los armónicos impares y usando coseno
V1 = A1 * cos(2 * pi * f * t);           % Armónico 1
V3 = A3 * cos(2 * pi * 3 * f * t);       % Armónico 3
V5 = A5 * cos(2 * pi * 5 * f * t);       % Armónico 5
V7 = A7 * cos(2 * pi * 7 * f * t);       % Armónico 7
V9 = A9 * cos(2 * pi * 9 * f * t);       % Armónico 9
V11 = A11 * cos(2 * pi * 11 * f * t);    % Armónico 11

% Señal reconstruida sumando todos los armónicos
V_pulse = V1 + V3 + V5 + V7 + V9 + V11;

% Graficar la señal de pulso reconstruida en el dominio del tiempo
figure;
subplot(2,1,1);  % Subgráfico para la señal en el dominio del tiempo
plot(t, V_pulse);
title('Señal de Pulso Reconstruida (Duty Cycle 50%)');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Aplicar la FFT a la señal
N = length(V_pulse);  % Número de puntos en la señal
f_fft = fft(V_pulse);  % Calcular la FFT

% Calcular las frecuencias correspondientes
f_rec = (0:N-1)*(1/T)/N;  % Vector de frecuencias

% Magnitud de la FFT
mag_f_fft = abs(f_fft)/N;

% Graficar la FFT en el dominio de la frecuencia
subplot(2,1,2);  % Subgráfico para la FFT
f_half = floor(N/2); % Asegurarse de que N/2 sea un entero
plot(f_rec(1:f_half), mag_f_fft(1:f_half)); % Graficar solo las frecuencias positivas
title('Espectro de Frecuencia (FFT) de la Señal de Pulso');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;

