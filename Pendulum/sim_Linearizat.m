clear all, close all, clc

m = 1;                 % masa bilei
M = 10;                % masa cartului
L = 2;                 % lungimea firului
g = -9.81;             % acceleratia gravitationala
d = 1; 

s = 1;                 % pendul sus (s=1) poate fi pus si jos (s=-1)

A = [0      1            0               0;
     0     -d/M        -m*g/M            0;     % Matricea de Stare
     0       0           0               1;    
     0   -s*d/(M*L)  -s*(m+M)*g/(M*L)    0];

B = [   0;                % Intrarea sistemului
       1/M;     
        0;
     s/(M*L)];
 
 R = 0.001;               % Costul controlului
 
 Q = [1 0  0   0;
      0 1  0   0;         % Matricea de cost
      0 0 10   0;
      0 0  0 100;]
 
 %det(ctrb(A,B))           % Verificam stabilitatea perechii (A,B) 
  
 %K = lqr(A,B,Q,R);       % Calculeaza Regulatorul Liniar-Quadratic
 
 eigs = [-1; -1.1; -1.2; -1.3;];
 K = place(A,B,eigs);   %   Metoda plasarii polilor
 
 
 yf_1 = [0; 0; pi; 0]  % Starea dorita in cazul 1
 yf_2 = [0; 0; -pi; 0] % Starea dorita in cazul 2

 %eig(A);
 
 C = eye(4);              % Iesirea sistemului
 system = ss(A,B,C,0);    % Creaza sistemul dx/dt=Ax(t)+Bu(t) si y(t)=Cx(t)
 
 time = 0: 0.0001 : 10;    % intervalul de timp
 
 if(s == -1)              % pendul jos (s=-1)   
     y0 = [0; 0; pi; 0]; % starea initiala [x dx/dt theta dtheta/dt] 
    [t,y] = ode45(@(t,y)((A-B*K)*(y-yf_2)),time,y0);
 end
 
 if ( s == 1)
     y0 = [5; 5; pi/3; 0];
     [t,y] = ode45(@(t,y)((A-B*K)*(y-yf_1)),time,y0);
 end
 


% Afisare Simulare
figure
for i = 1: 100: length(t)
    
    draw(y(i,:) ,m,M,L);
end

% Stabilizarea parametrilor de stare
figure
plot(t,y);
legend('x','dx/dt','\theta','d\theta/dt','Location','southwest');
 
 
