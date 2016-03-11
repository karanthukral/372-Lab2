classdef Estimator
    %ESTIMATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods(Static)
        function [mu, sigma] = estimateGauss(data)
            N = length(data);
            mu = (1/N)*sum(data);
            sigma = 0;
            for i=1:N
                sigma = sigma + (data(i) - mu)^2;
            end
            sigma = (1/N)*sigma;
        end
        
        function lambda = estimateExp(data)
            lambda = length(data)/sum(data);
        end
        
        function [minimum, maximum] = estimateUniform(data)
            minimum = min(data);
            maximum = max(data);
        end
        
        function [parzen1, parzen2] = estimate1DNonParametric(std_1, std_2, data)
            K = 0.1
            N = length(data);
            h = K/sqrt(N);
            h = 1; % Previous value of h too large
            parzen1 = [];
            parzen2 = [];

            for j=1:N
                sumVal1 = 0;
                sumVal2 = 0;
                for i=1:N
                    sumVal1 = sumVal1 + ((1/h)*(1/(std_1*sqrt(2*pi)))*exp(-0.5*((j/10 - data(i))/std_1)^2));
                    sumVal2 = sumVal2 + ((1/h)*(1/(std_2*sqrt(2*pi)))*exp(-0.5*((j/10 - data(i))/std_2)^2));
                end
                parzen1(j) = (1/N)*sumVal1;
                parzen2(j) = (1/N)*sumVal2;
            end
        end
    end
    
end

