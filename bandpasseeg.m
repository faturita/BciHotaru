function X = bandpasseeg(signal, channelRange, Fs)
% Band pass filter
[b,a] = butter(4,9/(Fs/2));

%x1 = 10*sin(2*pi*10*t) + signal ;

gr = grpdelay(b,a,Fs);   % plot group delay
D = mean(gr); % filter delay in samples
D = floor(D);

X = zeros(size(signal,1),size(channelRange,1));

for channel=channelRange

   %freqz(b,a)
   x1 = signal(:,channel);
   %data.X(:,channel) = filter(b,a,x1);
   
   x1  = filter(b,a,[x1; zeros(D,1)]);% Append D zeros to the input data
   X(:,channel)  = x1(D+1:end); % Shift data to compensate for delay
   
   
end

end