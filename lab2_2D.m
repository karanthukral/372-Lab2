% Lab 2 Part 2 Model Estimation 2-D Case

clear all
close all

load('lab2_2.mat')

[muA, sigA] = Utils2D.learntGaussParams(al);
[muB, sigB] = Utils2D.learntGaussParams(bl);
[muC, sigC] = Utils2D.learntGaussParams(cl);

datapoints = [at; bt; ct];
means = [muA; muB; muC];
variances = [sigA; sigB; sigC];
figure
scatter (al(:,1), al(:,2), 150, 'r','.');
hold on
scatter (bl(:,1), bl(:,2), 150, 'b','.');
hold on
scatter (cl(:,1), cl(:,2), 150, 'black','.');
hold on
gridML = Utils2D.grid(means, datapoints, variances);