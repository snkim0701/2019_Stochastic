

%% First home assignment 
%generate the normal X (mean,variance);
clear all; clf; clc
size = 1000;

rng(1) % random number generator seed.
x1 =randn(size,1);  % gaussian , mean =0, sig = 1, size of colum vector

rng(0.01)
x2 =sqrt(2)*randn(size,1); % gaussian , mean =0, sig = 2, size of colum vector

% check the independency
r = cov(x1,x2)

%   calculate the probability 
pd_x1 = makedist('normal', 'mu',0,'sigma',1)  % make PDF 
p_x1 = cdf(pd_x1,0.5)                                          % calculate of Prob{x<= 0.5}


pd_x2 = makedist('normal','mu', 0,'sigma', sqrt(2))   %make PDF
p_x2 = cdf(pd_x2,0.5)                                                    % calculate of Prob( y <= 0.5)

% multivariate gaussian RV's
C =[1 0;2 1];
P = C*r*C'

mu = [ 0 0];
P = mvncdf([0 0], [ 0.5  0.5],mu,P)  + 0.5 ; 

% in my matlab no mvncdf...
% but another PC, i got it  0.5260

%% Ch. 3 example 3.8 
%  uniform RV in [0 2]
clear all 
clf; clc
size=1000;
x =2.* rand(size,1);
figure(1)
histogram(x)
title('uniform  X in [0 2]')
% uniform RV in [ -1/2 1/2]
y= rand(size,1)-1/2 ;
figure(2)
histogram(y)
title('uniform  Y in [-1/2 1/2]')
% sum of two RVs z = x+y
figure(3)
z = x+y;
histogram(z);grid on
title('sum of X+ Y')
