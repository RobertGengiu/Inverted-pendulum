clear all, close all, clc

m = 1;                 % masa bilei
M = 10;                % masa cartului
L = 2;                 % lungimea firului
g = -9.81;             % acceleratia gravitationala
d = 1;                
time = 0: 0.1: 300; % intervalul de timp in care are loc simularea 
y0 = [0; 0; pi; 0.5]; % conditia initiala [x dx/dt theta dtheta/dt] 

%integram sistemul de ecuatii diferentiale
[t,y] = ode45(@(t,y)cart(y,m,M,L,g,d,0),time,y0);

%Afisare
for i = 1 : length(time)

    draw(y(i, :), m, M, L);
end    