t = (-10 :.05 :10); % pay attention to scale and limits
x_1 = 2*exp(-t); % elementwise multiply with .*
x_2 = sin(t);
y   = x_1.*x_2;e

subplot(3,1,1),plot(t,x_1), ylabel('Amplitude'), xlabel('Time (secs)'), title('Signal x_1 in Time Domain');
subplot(3,1,2),plot(t,x_2), ylabel('Amplitude'), xlabel('Time (secs)'), title('Signal x_2 in Time Domain');
subplot(3,1,3),plot(t,y)  , ylabel('Amplitude'), xlabel('Time (secs)'), title('Signal   y in Time Domain');


[X,Y] = meshgrid(-2:.2:2);                                
Z = X .* exp(-X.^2 - Y.^2);
    