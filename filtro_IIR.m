clc;
clear all;
close all;

filename = "sinal_1.wav";
[y, Fs] = audioread(filename);

% Especificações dos filtros
ordem = 1; % Ordem dos filtros
freq_corte1 = 500; % Frequência de corte do filtro de baixa frequência (Hz)
freq_corte2 = 1500; % Frequência de corte do filtro de média frequência (Hz)
freq_corte3 = 3000; % Frequência de corte do filtro de alta frequência (Hz)

% Projetar diferentes tipos de filtros IIR
[filtro_baixa_num, filtro_baixa_den] = butter(ordem, freq_corte1/(Fs/2), 'low');
[filtro_alta_num, filtro_alta_den] = butter(ordem, freq_corte3/(Fs/2), 'high');
[filtro_faixa_num, filtro_faixa_den] = butter(ordem, [freq_corte1/(Fs/2), freq_corte2/(Fs/2)], 'bandpass');

% Aplicar os filtros ao sinal
sinal_baixa = filter(filtro_baixa_num, filtro_baixa_den, y);
sinal_alta = filter(filtro_alta_num, filtro_alta_den, y);
sinal_faixa = filter(filtro_faixa_num, filtro_faixa_den, y);

% Plotar os sinais originais e filtrados
t = (0:length(y)-1) / Fs;

figure;

subplot(4,1,1);
plot(t, y);
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t, sinal_baixa);
title('Componente de Baixa Frequência');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t, sinal_alta);
title('Componente de Alta Frequência');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t, sinal_faixa);
title('Componente de Faixa de Frequência');
xlabel('Tempo (s)');
ylabel('Amplitude');

sgtitle('Sinais Original e Componentes Separadas com Filtros IIR');
