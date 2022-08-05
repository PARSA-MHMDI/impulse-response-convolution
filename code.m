%% Soal 3
x = [2, -2, 7, -3, 2, 4, -6, 1];
h = [5, 2, 4, -6, 5, 1, -8, 0, 7, 2, 9];         

subplot(4,1,1);
stem(1:8, x, "filled","black")
xlim([0,9])
ylim([-7,8])
title("x[n] graph")

subplot(4,1,2);
stem(1:length(h),h,"filled","black")
xlim([0,12])
ylim([-9,10])
title("h[n] graph")

conv_signal = conv(h,x);
subplot(4,1,3);
stem(1:length(conv_signal),conv_signal,"filled","black")
title("Convolution with conve function")

myconv_signal = myconv(h,x);
subplot(4,1,4);
stem(1:length(myconv_signal),myconv_signal,"filled","black")
title("Convolution with myconve function")

%this code show the result of conv and myconv are same or not
    ... if they are similar shows true 
    ... and if they are not shows false
Pool = {'FALSE', 'TRUE'};
Pool((myconv_signal == conv_signal) + 1)        

% This code is solution of question number 4 signal assignment
%% Soal 4_1
clear;
clc;

% load data form audio 
[x,fs] = audioread('orginal.wav');
sprintf("The sampling frequnency is: %i\n",fs)

% Play loaded audio
sound(x,fs);

% Save x as x.wav
audiowrite("x.wav",x,fs)

% plot graph of audio

time_domain = linspace(0,length(x)/fs,length(x));

subplot(2,1,1);
plot(time_domain,x(:,1),"black")
title("Left bound audio")

subplot(2,1,2);
plot(time_domain,x(:,2),"black")
title("Right bound audio")

%% Soal 4_3
clear;
clc;

%   Code below loads and plots the orginal audio
[x,fs] = audioread('x.wav');
time_domain = linspace(0,length(x)/fs,length(x)); % this code is for make x axis time domain
subplot(3,1,1);
plot(time_domain,x);           
 
signal_1d = ((x(:,1)+x(:,2))/2); %Convert 2D audio to 1D
delay_time = 1*fs; % Delay time in question is 1 second

% In code below I made impulse vector referring to question
h=zeros(length(x),1);   
h(1)=1;         
h(delay_time)=0.81;
subplot(3,1,2);     
plot(time_domain,h);          

%Convolution
y=conv(signal_1d,h);   
subplot(3,1,3);
time_domain_z = linspace(0,length(y)/fs,length(y));
plot(time_domain_z,y);           
sound(y,44100);

%Save echo audio
audiowrite("y.wav",y,fs)

%%  Soal 4_4
clear;
clc;

%   Code below loads and plots the orginal audio
[x,fs] = audioread('x.wav');
time_domain = linspace(0,length(x)/fs,length(x)); % this code is for make x axis time domain
signal_1d = ((x(:,1)+x(:,2))/2);

h=zeros(length(x),1);   
h(1)=1;

range_time = 2:10;
range_value = linspace(0.1,2, 10);
c = 1;
for i = 1:length(range_time)
    for j = 1:length(range_value)
        delay_time = i*fs;
        h(delay_time)=j;

        y=conv(signal_1d,h);

        h=zeros(length(x),1);
        h(1)=1;

        name = "test/" +string(c)+ "_test.wav";
        audiowrite(name,y,fs)

        c = c + 1;
    end
end

