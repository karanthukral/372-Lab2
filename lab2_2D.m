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
legend('Non Parametric Boundary', 'Set A', 'Set B', 'Set C');

%2D Non Parametric Estimation Boundary

minX = min([min(al(1 ,:)) min(bl(1,:)) min(cl(1,:))]);
maxX = max([max(al(1 ,:)) max(bl(1,:)) max(cl(1,:))]);
minY = min([min(al(: ,1)) min(bl(:,1)) min(cl(:,1))]);
maxY = max([max(al(: ,1)) max(bl(:,1)) max(cl(:,1))]);

dx = 5;
x = minX:dx:maxX;
y = minY:dx:maxY;
boundary = zeros(length(x), length(y));

sigma = [20 0; 0 20];
for i = 1:length(x)
    for j = 1:length(y)
        point = [x(i) y(j)];
        boundary(i, j) = Utils2D.nonParaClassifier(point, al, bl, cl, sigma);
    end
end

figure
contour(x, y, boundary.', 2);
hold on
plot(al(:,1), al(:,2), 'b+');
hold on
plot(bl(:,1), bl(:,2), 'r+');
hold on
plot(cl(:,1), cl(:,2), 'g+');
title('2D Non Parametric Estimation Boundary');
legend('Non Parametric Boundary', 'Set A', 'Set B', 'Set C');