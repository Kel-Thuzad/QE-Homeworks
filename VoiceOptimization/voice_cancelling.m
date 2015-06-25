close all;
clear all;
clc;

load('filter2.mat');
[a,fd] = audioread('Dieinbattle.wav');
leftchannel = a(:,1);
rightchannel = a(:,2);

leftchannel = FloatFilter(leftchannel,coef);
rightchannel = FloatFilter(rightchannel,coef);

t = [leftchannel,rightchannel];
audiowrite('Dieinbattle_fit.wav',t,fd);
