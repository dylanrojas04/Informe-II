# 🧪 Análisis y Reconstrucción de Señales Periódicas en MATLAB

Este repositorio contiene scripts de MATLAB desarrollados para el análisis espectral y la reconstrucción de diversas señales periódicas (cuadradas, triangulares, y de pulso) mediante la Transformada Rápida de Fourier (FFT) y su inversa (IFFT).

## 📌 Objetivo

Estudiar cómo una señal periódica puede representarse como la suma de sus armónicos (componentes senoidales y cosenoidales) y cómo se puede reconstruir dicha señal desde su espectro de frecuencia. Se incluyen también comparaciones entre la señal original y la reconstruida para calcular errores relativos y evaluar la fidelidad de la transformación.

## 🔧 Metodología

1. **Generación de señales sintéticas**:
   - Señales cuadradas (Duty Cycle: 50%, 80%, etc.)
   - Señales triangulares
   - Señales de pulso con Duty Cycle variable (20%, 30%, 80%, etc.)

2. **Análisis espectral**:
   - Cálculo de la FFT para obtener el espectro en frecuencia.
   - Visualización del módulo de la FFT (en dB) y localización de los armónicos principales.
   - Identificación de armónicos que aportan significativamente a la forma de la señal.
   - Observación de nulos en el espectro según el Duty Cycle.

3. **Reconstrucción con IFFT**:
   - Uso de `ifft()` para sintetizar la señal original desde el dominio de la frecuencia.
   - Comparación gráfica entre la señal original y la reconstruida.

4. **Cálculo del error**:
   - Se calcula el **porcentaje de error relativo** entre la señal original y la reconstruida para verificar la calidad de la reconstrucción.

## 📊 Resultados

- La señal reconstruida mediante IFFT conserva fielmente la forma original, siempre que el espectro utilizado contenga suficientes armónicos.
- Se identifican armónicos predominantes en cada tipo de señal.
- En señales de pulso, los nulos en la FFT ocurren en múltiplos específicos relacionados con el Duty Cycle.
- El porcentaje de error relativo tiende a ser muy bajo cuando se consideran los armónicos principales (por ejemplo, menores al 5%).

## 📁 Archivos incluidos

- `fft_ifft_señal_cuadrada.m`
- `fft_ifft_señal_triangulo.m`
- `fft_ifft_pulso_duty_80.m`
- `espectro_desde_csv.m`: Reconstrucción a partir de archivos `.csv` con datos espectrales.
- `README.md`: Este archivo.

## 🧰 Requisitos

- MATLAB R2020 o superior
- **Toolbox requerido**: Signal Processing Toolbox (para la función `square`)

## 📌 Notas

- Las señales pueden ser generadas o importadas desde archivos `.csv`.
- El análisis permite comprender el principio de superposición de Fourier y la importancia de los armónicos para la reconstrucción precisa de una señal.

## 📚 Créditos

Proyecto desarrollado como parte de un informe académico para el curso de Procesamiento de Señales, centrado en el análisis y síntesis de señales periódicas usando transformadas de Fourier.

---

