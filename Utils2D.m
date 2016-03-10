classdef Utils2D
    %UTILS2D Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods(Static)
        function [mu, sigma] = learntGaussParams(data)
            N = length(data);
            mu = (1/N)*sum(data);
            sigma = [0 0; 0 0];
            for k=1:N
                sigma = sigma + (data(k,:) - mu)'*(data(k,:) - mu);
            end
            sigma = (1/N).*sigma;
        end
        
        function grid = grid(means, datapoints, variances) 
                maxY = max(datapoints(:, 2));
                maxX = max(datapoints(:, 1));
                minX = min(datapoints(:, 1));
                minY = min(datapoints(:, 2));
                xVals = [minX:(maxX - minX)/100:maxX];
                yVals = [minY:(maxY - minY)/100:maxY];
                
                grid = zeros(length(xVals),length(yVals));
                
                for k=1:length(xVals)
                    for j=1:length(yVals)
                            grid(k,j) = Utils2D.mlClassifier(means, [xVals(k), yVals(j)], variances); 
                    end
                end
                contour(xVals, yVals, grid, 3, 'b');
        end
        
        function class = mlClassifier(means, point, variances)
            class = -1;
            mu = [];
            sig = [];
            count = 0;
            for k=1:3
                mu{k} = [means(k, 1) means(k, 2)];
                sig{k} = [variances(k+count,1) variances(k+count,2); variances(k+count+1, 1) variances(k+count+1, 2)];
                count = count + 1;
            end

            muA = cell2mat(mu(1)); 
            muB = cell2mat(mu(2)); 
            muC = cell2mat(mu(3));
            sigA = cell2mat(sig(1)); 
            sigB = cell2mat(sig(2)); 
            sigC = cell2mat(sig(3));

            guassA = 1/(sqrt(2*pi)^2*sqrt(det(sigA)))*exp(-0.5*(point - muA)*inv(sigA)*(point-muA)');
            guassB = 1/(sqrt(2*pi)^2*sqrt(det(sigB)))*exp(-0.5*(point - muB)*inv(sigB)*(point-muB)');
            guassC = 1/(sqrt(2*pi)^2*sqrt(det(sigC)))*exp(-0.5*(point - muC)*inv(sigC)*(point-muC)');

            [~,class] = max([guassA guassB guassC]);
        end
        
        function class = nonParaClassifier(point, al, bl, cl, sigma)
            aSum = 0;
            bSum = 0;
            cSum = 0;

            for a = 1:length(al)
                aMu = [al(a, 1) al(a, 2)];
                aSum = aSum + (1/length(al)) * (1/(sqrt(2*pi)^2*sqrt(det(sigma))))*exp(-0.5*(point - aMu)*inv(sigma)*(point-aMu)');
            end

            for b = 1:length(bl)
                bMu = [bl(b, 1) bl(b, 2)];
                bSum = bSum + (1/length(bl)) * (1/(sqrt(2*pi)^2*sqrt(det(sigma))))*exp(-0.5*(point - bMu)*inv(sigma)*(point-bMu)');
            end

            for c = 1:length(cl)
                cMu = [cl(c, 1) cl(c, 2)];
                cSum = cSum + (1/length(cl)) * (1/(sqrt(2*pi)^2*sqrt(det(sigma))))*exp(-0.5*(point - cMu)*inv(sigma)*(point-cMu)');
            end

            [~, class] = max([aSum bSum cSum]);
        end        
    end
end

