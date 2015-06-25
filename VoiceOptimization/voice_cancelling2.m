close all;
clear all;
clc;

load('filter2.mat');
[a,fd] = audioread('Dieinbattle.wav');
n=16;
leftchannel =round(a(:,1)*2^n);
rightchannel = round(a(:,2)*2^n);


leftchannel = FixFilter(leftchannel,round(coef*2^n),n);
rightchannel = FixFilter(rightchannel,round(coef*2^n),n);

left =leftchannel/(2^n);
right = rightchannel/(2^n);

t = [left,right];
audiowrite('Dieinbattle_fit2.wav',t,fd);
