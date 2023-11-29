pkg load signal

info = audioinfo ('Sample 01.wav')

[x,fs] = audioread("Sample 01.wav");
x = x(:,1);
dt = 1/fs;
t = 0:dt:(length(x)*dt)-dt;
plot(t,x); xlabel('Seconds'); ylabel('Amplitude');


N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/length(x):fs/2;
plot(freq,pow2db(psdx))
grid on
title("Periodogram Using FFT")
xlabel("Frequency (Hz)")
ylabel("Power/Frequency (dB/Hz)")

periodogram(x,rectwin(N),N,fs)

subplot(2,1,1),plot(t,x), ylabel('Amplitude'), xlabel('Time (secs)');
f1 = 0:(fs/samples):(Fs/2-(fs/samples));
[Pxx, f] = pwelch(y, gausswin(fs), fs/2, f1/4, fs);
subplot(2,1,2), plot(f,Pxx), ylabel('PSD'), xlabel('Frequency (Hz)');

y = medfilt1(x,10);
plot(t,x,t,y)
legend('Original','Filtered')
legend('boxoff')

y = smoothdata(x);
plot(x,x)
hold on
plot(x,y)
legend("Input Data","Smoothed Data")



