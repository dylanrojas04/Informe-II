% Definir parámetros de la señal
T = 0.1;  % Periodo de la señal (en segundos)
f = 1/T;  % Frecuencia fundamental (en Hz)

% Amplitudes de los armónicos proporcionadas
A0 = 0.3;   % Armónico 0 (componente DC)
A1 = 0.56;  % Armónico 1
A2 = 0.45;  % Armónico 2
A3 = 0.3;   % Armónico 3
A4 = 0.14;  % Armónico 4
A5 = 0;     % Armónico 5
A6 = -0.093;% Armónico 6
A7 = -0.12; % Armónico 7
A8 = -0.11; % Armónico 8
A9 = -0.062;% Armónico 9

% Definir el tiempo
t = 0:T/100:2*T;  % 2 períodos de la señal con 100 muestras por período

% Reconstrucción de la señal de pulso con los armónicos y usando coseno
V0 = A0;                   % Armónico 0 (componente DC)
V1 = A1 * cos(2 * pi * f * t);           % Armónico 1
V2 = A2 * cos(2 * pi * 2 * f * t);       % Armónico 2
V3 = A3 * cos(2 * pi * 3 * f * t);       % Armónico 3
V4 = A4 * cos(2 * pi * 4 * f * t);       % Armónico 4
V5 = A5 * cos(2 * pi * 5 * f * t);       % Armónico 5
V6 = A6 * cos(2 * pi * 6 * f * t);       % Armónico 6
V7 = A7 * cos(2 * pi * 7 * f * t);       % Armónico 7
V8 = A8 * cos(2 * pi * 8 * f * t);       % Armónico 8
V9 = A9 * cos(2 * pi * 9 * f * t);       % Armónico 9

% Señal reconstruida sumando todos los armónicos
V_pulse_20 = V0 + V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9;

% Graficar la señal de pulso reconstruida con duty cycle del 20%
figure;
subplot(2,1,1);  % Subgráfico para la señal en el dominio del tiempo
plot(t, V_pulse_20);
title('Señal de Pulso Reconstruida con Duty Cycle 20%');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% Aplicar la FFT a la señal
N = length(V_pulse_20);  % Número de puntos en la señal
f_fft = fft(V_pulse_20);  % Calcular la FFT

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


