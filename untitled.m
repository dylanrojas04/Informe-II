% Script para análisis de señal (FFT) y reconstrucción (IFFT)
% con una señal de pulso sintética con un 80% de ciclo de trabajo.

% 1. Parámetros de la señal
f_pulso = 1000;        % Frecuencia del pulso (Hz)
A = 1.5;               % Amplitud pico (±1.5 V)
duty_cycle = 80;       % Porcentaje
fs = 100000;           % Frecuencia de muestreo (Hz)
duracion = 0.05;       % Duración de la señal (s)
t = 0 : 1/fs : duracion - 1/fs;  % Vector de tiempo

% 2. Generar señal de pulso manual (sin 'square')
T_pulso = 1/f_pulso;  % Periodo del pulso
% Señal: +A durante el duty_cycle%, -A durante el resto
y = 2*(mod(t, T_pulso) < (duty_cycle/100)*T_pulso) - 1;
y = A * y;  % Ajustar amplitud

% 3. Calcular FFT
L = length(y);
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;

% 4. Graficar FFT
figure;
plot(f/1000, 20*log10(P1));
title('Espectro de Frecuencia de la Señal de Pulso (80% Duty Cycle)');
xlabel('Frecuencia (kHz)');
ylabel('Amplitud (dB)');
grid on;
xlim([0 15]);
hold on;

for n = 1:10
    armonico_f = n * f_pulso;
    if mod(n, 5) == 0
        xline(armonico_f/1000, '--k', sprintf('Nulo en %.1f kHz', armonico_f/1000));
    else
        xline(armonico_f/1000, '--r', sprintf('%dº Armónico (%.1f kHz)', n, armonico_f/1000));
    end
end
hold off;

% 5. Reconstrucción con IFFT
y_reconstruida = ifft(Y);

% 6. Graficar señal reconstruida
figure;
plot(t, real(y_reconstruida), 'r', 'LineWidth', 1.5);
title('Señal de Pulso Reconstruida por IFFT');
xlabel('Tiempo (s)');
ylabel('Amplitud (V)');
grid on;
xlim([0 3*(1/f_pulso)]);
