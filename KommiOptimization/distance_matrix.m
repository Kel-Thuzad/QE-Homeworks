close all;
clear all;
clc;

x = [ 10.56 8.59 7.76 8.62  9.04 9.65 10.34 10.13 10.26 10.23 10.35 10.48 10.24 9.33]; 
y = [ 71.63 71.14 72.23 70.21 69.74 68.58 68.73 67.92 67.78 67.57 67.34 66.84 66.66 66.25];

for i = 1:length(x)
    for j = 1:length(y)
        distances(i,j) = sqrt((x(i) - x(j))^2 + (y(i) - y(j))^2);
    end
end

