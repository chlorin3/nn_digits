clear all
close all
clc

%% digits from 0 to 9, each represented in a matrix
C0 = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];%0
C1 = [0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1];%1
C2 = [1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1];%2
C3 = [1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1];%3
C4 = [1 0 0 0 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1];%4
C5 = [1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1];%5
C6 = [1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];%6
C7 = [1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1; 0 0 0 0 1];%7
C8 = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1];%8
C9 = [1 1 1 1 1; 1 0 0 0 1; 1 0 0 0 1; 1 1 1 1 1; 0 0 0 0 1; 0 0 0 0 1; 1 1 1 1 1];%9

%% each matrix reshaped into a vector
C0 = reshape(C0',[],1);C1 = reshape(C1',[],1);C2 = reshape(C2',[],1);
C3 = reshape(C3',[],1);C4 = reshape(C4',[],1);C5 = reshape(C5',[],1);
C6 = reshape(C6',[],1);C7 = reshape(C7',[],1);C8 = reshape(C8',[],1);
C9 = reshape(C9',[],1);
% C0 = C0(:);C1 = C1(:);C2 = C2(:);C3 = C3(:);C4 = C4(:);C5 = C5(:);C6 = C6(:);C7 = C7(:);C8 = C8(:);C9 = C9(:);
X = [C0 C1 C2 C3 C4 C5 C6 C7 C8 C9];

%% creating digits for a test (modifying previously prepared digits or creating new ones with slightly different pixel values)
T0 = 0.76.*C0; 
T1 = 0.99.*C1;
T2 = 0.81.*C2;
T5 = [1 1 1 1 1; 1 0 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 0 0 0 1 1; 0 0 0 1 1; 1 1 1 1 1];
T5 = reshape(T5',[],1);
T7 = [0.92 0.93 0.97 0.74 0.6; 0 0.001 0 0 0.99; 0 0 0 0 1; 0 0 0 0 0.894; 0 0 0 0 0.91; 0.05 0 0 0 1; 0 0 0 0 0.97];
T7 = reshape(T7',[],1);
T4 = [1 0 0.005 0.01 0.92; 0.99 0 0.02 0 1; 1 0 0 0 1; 1 0.81 0.98 0.98 1; 0 0 0 0 1; 0 0 0 0 0.95; 0.13 0 0.021 0 0.98];
T4 = reshape(T4',[],1);
T3 = [1 1 1 1 1; 0 0 0.23 0.74 1; 0 0 0 0.69 1; 1 0.9 0.9 0.9 0.87; 0 0 0 0.8 1; 0 0 0 0.9 0.99; 1 1 1 1 1];
T3 = reshape(T3',[],1);
T6 = [0.88 0.85 0.8 0.9 0.54; 1 0.87 0 0 0; 1 0 0 0 0; 1 1 1 1 1; 1 0.94 0.2 0 1; 1 0.89 0 0 1; 0.99 0.98 0.42 1 0.89];
T6 = reshape(T6',[],1);
T8 = [1 1 1 1 1; 1 0.89 0 0.23 1; 1 0.51 0 0.12 1; 0.9 0.99 0.99 0.9 0.9; 1 0.04 0.1 0.2 1; 1 0.8 0 0 1; 0.9 1 0.56 0.89 0.98];
T8 = reshape(T8',[],1);
T9 = [1 1 0.9 0.98 0.97; 0.95 0.002 0.15 0.1 1; 1 0.2 0 0.32 0.87; 0.87 1 1 0.99 0.91; 0 0 0 0 0.97; 0 0 0 0.99 0.1; 1 0.64 0.9 0.2 0.76];
T9 = reshape(T9',[],1);
P8 = 0.91*T8;
P4 = 0.79*T4;

Xtest = [P4 T7 T0 T1 T2 T5 T7 T4 T3 T6 T8 T9 P8 P4];
% Y - each column represents a digit. The output for C1 is a vector 10x1
% where first element is equal to 1. For C2 a vector 10x1 -> second element
% equal to 1 and so on
%    0 1 2 3 4 5 6 7 8 9
Y = [0 1 0 0 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 1 0;
     0 0 0 0 0 0 0 0 0 1;
     1 0 0 0 0 0 0 0 0 0];
%%
net = newff([0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;...
             0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;...
             0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;...
             0 1;0 1;0 1;0 1;0 1],[35 10],{'logsig' 'logsig'}, 'trainlm');   % tworzenie nowej sieci
%logsig logsig lub compet? lub logsig softmax lub satlin i

net = init(net);
net = train(net,X,Y);
SymU = sim(net,X);
Sym = sim(net,Xtest); 
[w, k] = size(Sym)
for i = 1:k %for each column look for the max value
        [M,I] = max(Sym(:,i)); %M - max value, I - index of the max value which corresponds to recognized digit, except for 0
        if (I == 10) %tenth row indicates digit 0
            liczba(i) = 0;
        else
        liczba(i) = I;
        end
end

%% print recognized numbers
disp('Rozpoznane liczby to: ') 
disp(liczba)