% Lab 2 Part 1 Model Estimation 1-D Case

clear all
close all

load('lab2_1.mat')

% Class A Params
N_A = length(a);
realMu_A = 5;
realSigma_A = 1;

% Class B Params
N_B = length(b);
realLambda_B = 1;

% Class A Gauss Estimation
[mu_est, sigma_est] = Estimator.estimateGauss(a);
figure
Plotting.plotGauss(mu_est, sigma_est, 'r'); % Estimated
hold on
Plotting.plotGauss(realMu_A, realSigma_A, 'b'); % Actual
legend('Estimated', 'Actual');
 
% Class B Gauss Estimation
[mu_est, sigma_est] = Estimator.estimateGauss(b);
figure
Plotting.plotGauss(mu_est, sigma_est, 'r'); % Estimated
hold on
Plotting.plotExp(realLambda_B, 'b'); % Actual
legend('Estimated', 'Actual');
 
% Class A Exponential Estimation
lambda_est = Estimator.estimateExp(a);
figure
Plotting.plotExp(lambda_est, 'r'); % Estimated
hold on
Plotting.plotGauss(realMu_A, realSigma_A, 'b'); % Actual
legend('Estimated', 'Actual');
 
% Class B Exponential Estimation
lamdba_est = Estimator.estimateExp(b);
figure
Plotting.plotExp(lambda_est, 'r'); % Estimated
hold on
Plotting.plotExp(realLambda_B, 'b'); % Actual
legend('Estimated', 'Actual');
 
% Class A Uniform Estimation
[min, max] = Estimator.estimateUniform(a);
figure
Plotting.plotUniform(min, max, 'r') % Estimated
hold on
Plotting.plotGauss(realMu_A, realSigma_A, 'b'); % Actual
legend('Estimated', 'Actual');
 
% % Class B Uniform Estimation
[min, max] = Estimator.estimateUniform(b);
figure
Plotting.plotUniform(min, max, 'r') % Estimated
hold on
Plotting.plotExp(realLambda_B, 'b'); % Actual
legend('Estimated', 'Actual');

% Class A Non Parametric
[parzen1, parzen2] = Estimator.estimate1DNonParametric(0.1, 0.4, a);
xRange = 0:0.1:9.9;
figure
plot(xRange, parzen1, 'r');
hold on
Plotting.plotGauss(realMu_A, realSigma_A, 'b');
legend('Estimated', 'Actual');

figure
plot(xRange, parzen2, 'r');
hold on
Plotting.plotGauss(realMu_A, realSigma_A, 'b');
legend('Estimated', 'Actual');

% Class B Non Parametric
[parzen1, parzen2] = Estimator.estimate1DNonParametric(0.1, 0.4, b);
xRange = 0:0.1:9.9;
figure
plot(xRange, parzen1, 'r');
hold on
Plotting.plotExp(realLambda_B, 'b')
legend('Estimated', 'Actual');

figure
plot(xRange, parzen2, 'r');
hold on
Plotting.plotExp(realLambda_B, 'b')
legend('Estimated', 'Actual');