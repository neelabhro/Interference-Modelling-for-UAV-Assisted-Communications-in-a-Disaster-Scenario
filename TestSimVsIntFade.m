% Calculates and plots SINR-based probability of k-coverage via simulation 
% of model and integration method outlined [1]
% also calculates and plots 1-coverage with Rayleigh fading (mean 1) as outlined in [1]
%
% Author: H.P. Keeler, Inria Paris/ENS, 2013
%
% References:
% [1] H.P. Keeler, B. Błaszczyszyn and M. Karray,
% 'SINR-based coverage probability in cellular networks with arbitrary 
% shadowing', ISIT, 2013
%
% NOTE: If you use this code in published work, please cite paper[1] by
% Keeler, Blaszczyszyn and Karray, as listed above.

%clear all; close all; clc;

lambda=.2887; %base station density
%K and betaConst values correspond to Walfisch-Ikegami model for a urban
%environment
betaConst=2.6; % GHz Band %path-loss exponent  
K=1000;

%log normal parameters
sigmDb=10;
sigma=sigmDb/10*log(10);
ESTwoBeta=exp(sigma^2*(2-betaConst)/betaConst^2);

%model constant - incorporates model parameters
a=lambda*pi*ESTwoBeta/K^2; %equation (6) in [1]


%noise paramters
N=10^(-109/10)/1000;
% C. You and R. Zhang, "3D Trajectory Optimization in Rician Fading for UAV-Enabled Data Harvesting,"
%in IEEE Transactions on Wireless Communications,2019
P=10^(-50.2/10)/1000;
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
diskRadius=40; %radius of simulation disk region (has to be larger when fading is incorporated)
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

%figure; 
%plot(tValuesDb,PnSim,'o',tValuesDb,Pn);grid;
%legend(['Simulation ', legendLabel],['Integration', legendLabel],'Location','NorthWest')

%%%% with fading section
PCovFade=funProbCovFade(tValues,betaConst,W*a^(-betaConst/2)); %integration section
PCovSimFade=funSimLogNormProbCovFade(tValues,betaConst,K,lambda,sigma,W,diskRadius,simNumb); %simulation section

PnFade=1-PCovFade;
PnSimFade=1-PCovSimFade;
 
% figure; 
% plot(tValuesDb,PnFade,'x',tValuesDb,PnSimFade);grid;
% legend(['Simulation ', legendLabel,' with fading'],['Integration', legendLabel,' with fading'],'Location','NorthWest')

%plots all graphs on same figure
figure; 
plot(tValuesDb,PnSim,'o',tValuesDb,Pn,tValuesDb,PnFade,'x',tValuesDb,PnSimFade);grid;
legend(['Simulation ', legendLabel],['Integration', legendLabel],['Simulation ', legendLabel,' with fading'],['Integration', legendLabel,' with fading'],'Location','NorthWest')
xlabel('T (dB)'); ylabel('1-P_c(T)')

