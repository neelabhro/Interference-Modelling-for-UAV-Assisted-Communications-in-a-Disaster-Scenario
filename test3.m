% Calculates and plots SINR-based probability of k-coverage via simulation 
% of model and integration method outlined [1]
% 
%
% Author: H.P. Keeler, Inria Paris/ENS, 2013
%
% References
% [1] H.P. Keeler, B. Błaszczyszyn and M. Karray,
% 'SINR-based k-coverage probability in cellular networks with arbitrary
% shadowing', accepted at ISIT, 2013 



clear all;
close all;
clc;

lambda=0.2887/2; %base station density

%K and betaConst values correspond to Walfisch-Ikegami model for a urban
%environment
betaConst=4.77; %path-loss exponent  
K=1000;

%log normal parameters
sigmDb=10;
sigma=sigmDb/10*log(10);
ESTwoBeta=exp(sigma^2*(2-betaConst)/betaConst^2);

%model constant - incorporates model parameters
a=lambda*pi*ESTwoBeta/K^2; %equation (6) in [1]

%noise parameters
N=10^(-109/10)/1000;
P=10^(62.2/10)/1000;
W=N/P;

%SINR threshold values 
tMinDb=-10;tMaxDb=25;
tValuesDb=(tMinDb:tMaxDb)'; %values in dB
tValues=10.^(tValuesDb/10);
tNumb=length(tValues);

%coverage number
k=1;
%analytic/integration section
numbMC=10^3;
PCov=funProbCov(tValues,betaConst,W*a^(-betaConst/2),numbMC,k);

%Simulation section
simNumb=10^4; %number of simulations
diskRadius=20; %radius of simulation disk region (has to be larger when fading is incorporated)
PCovSim=funSimLogNormProbCov(tValues,betaConst,K,lambda,sigma,W,diskRadius,simNumb,k);

%plotting section

Pn=1-PCov;
PnSim=1-PCovSim;

%create suitable label
if W==0
    legendLabel='SIR';
else 
    legendLabel='SINR';
end

% figure; 
plot(tValuesDb,PnSim,'linewidth',3,'color',[.5 .4 .7]);grid;
%legend(['Simulation ', legendLabel],['Integration', legendLabel],'Location','NorthWest')
xlabel('T (dB)'); ylabel('1-P_c(T)')
hold on;






%%





% Calculates and plots SINR-based probability of k-coverage via simulation 
% of model and integration method outlined [1]
% 
%
% Author: H.P. Keeler, Inria Paris/ENS, 2013
%
% References
% [1] H.P. Keeler, B. Błaszczyszyn and M. Karray,
% 'SINR-based k-coverage probability in cellular networks with arbitrary
% shadowing', accepted at ISIT, 2013 



clear all; clc;

lambda=0.2887/2; %base station density

%K and betaConst values correspond to Walfisch-Ikegami model for a urban
%environment
betaConst=4.77; %path-loss exponent  
K=1000;

%log normal parameters
sigmDb=10;
sigma=sigmDb/10*log(10);
ESTwoBeta=exp(sigma^2*(2-betaConst)/betaConst^2);

%model constant - incorporates model parameters
a=lambda*pi*ESTwoBeta/K^2; %equation (6) in [1]

%noise parameters
N=10^(-109/10)/1000;
P=10^(62.2/10)/1000;
W=N/P;

%SINR threshold values 
tMinDb=-10;tMaxDb=25;
tValuesDb=(tMinDb:tMaxDb)'; %values in dB
tValues=10.^(tValuesDb/10);
tNumb=length(tValues);

%coverage number
k=2;
%analytic/integration section
numbMC=10^3;
PCov=funProbCov(tValues,betaConst,W*a^(-betaConst/2),numbMC,k);

%Simulation section
simNumb=10^4; %number of simulations
diskRadius=20; %radius of simulation disk region (has to be larger when fading is incorporated)
PCovSim=funSimLogNormProbCov(tValues,betaConst,K,lambda,sigma,W,diskRadius,simNumb,k);

%plotting section

Pn=1-PCov;
PnSim=1-PCovSim;

%create suitable label
if W==0
    legendLabel='SIR';
else 
    legendLabel='SINR';
end

% figure; 
plot(tValuesDb,PnSim,'linewidth',3,'color',[1 0 0]);grid;
%legend(['Simulation ', legendLabel],['Integration', legendLabel],'Location','NorthWest')
xlabel('T (dB)'); ylabel('1-P_c(T)')
hold on;



%%




% Calculates and plots SINR-based probability of k-coverage via simulation 
% of model and integration method outlined [1]
% 
%
% Author: H.P. Keeler, Inria Paris/ENS, 2013
%
% References
% [1] H.P. Keeler, B. Błaszczyszyn and M. Karray,
% 'SINR-based k-coverage probability in cellular networks with arbitrary
% shadowing', accepted at ISIT, 2013 



clear all; clc;

lambda=0.2887/2; %base station density

%K and betaConst values correspond to Walfisch-Ikegami model for a urban
%environment
betaConst=4.77; %path-loss exponent  
K=1000;

%log normal parameters
sigmDb=10;
sigma=sigmDb/10*log(10);
ESTwoBeta=exp(sigma^2*(2-betaConst)/betaConst^2);

%model constant - incorporates model parameters
a=lambda*pi*ESTwoBeta/K^2; %equation (6) in [1]

%noise parameters
N=10^(-109/10)/1000;
P=10^(62.2/10)/1000;
W=N/P;

%SINR threshold values 
tMinDb=-10;tMaxDb=25;
tValuesDb=(tMinDb:tMaxDb)'; %values in dB
tValues=10.^(tValuesDb/10);
tNumb=length(tValues);

%coverage number
k=3;
%analytic/integration section
numbMC=10^3;
PCov=funProbCov(tValues,betaConst,W*a^(-betaConst/2),numbMC,k);

%Simulation section
simNumb=10^4; %number of simulations
diskRadius=20; %radius of simulation disk region (has to be larger when fading is incorporated)
PCovSim=funSimLogNormProbCov(tValues,betaConst,K,lambda,sigma,W,diskRadius,simNumb,k);

%plotting section

Pn=1-PCov;
PnSim=1-PCovSim;

%create suitable label
if W==0
    legendLabel='SIR';
else 
    legendLabel='SINR';
end

% figure; 
plot(tValuesDb,PnSim,'linewidth',3,'color',[.5 1 0]);grid;
%legend(['Simulation ', legendLabel],['Integration', legendLabel],'Location','NorthWest')
xlabel('T (dB)'); ylabel('1-P_c(T)')
xlabel('T (Threshold SINR in dB)','fontweight','bold','fontsize',10);
ylabel('1-P_c(T) (1-Coverage probability)','fontweight','bold','fontsize',10)
legend('k=1','k=2','k=3','fontweight','bold','fontsize',10);
title('k-Coverage Probability','fontweight','bold','fontsize',20);