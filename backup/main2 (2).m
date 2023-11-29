
[Y, fs] = audioread('Sample 01.wav');
% Y is the audio data, fs is the sampling rate

t = linspace(0, length(Y)/fs, length(Y));
figure; plot(t, Y);
xlabel("Time"); ylabel("Amplitude");
title("Original Audio Signal in Time Domain");

% Apply FFT

N = length(Y);
f = linspace(0, fs, N);
X = fft(Y, N);
figure; plot(f(1:N/2), abs(X(1:N/2)));
xlabel("Frequency"); ylabel("Amplitude");
title("Original Audio Signal in Frequency Domain");

% Find Fundamental Frequency
[maxValue, indexOfMaxValue] = max(X);
fundermetal_frequency = f(indexOfMaxValue);


% Zeroing Out Noise

X(1:10) = 0;
for i = 1:length(X)
  if abs(X(i)) < 30
    X(i) = 0;
  end
end

figure; plot(f(1:N/2), abs(X(1:N/2)));
xlabel("Frequency"); ylabel("Amplitude");
title("Modified Audio Signal in Frequency Domain (Zeroing Out Noise)");

% Apply IFFT

y_prime = ifft(X);
t = linspace(0, length(y_prime)/fs, length(y_prime));
figure; plot(t, y_prime);
xlabel("Time"); ylabel("Amplitude");
title("Modified Audio Signal in Time Domain (Zeroing Out Noise)");
audiowrite('clean Sample 01.wav', abs(y_prime), fs);

