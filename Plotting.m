classdef Plotting
    %PLOTTING Summary of this class goes here
    %   Detailed explanation goes here
    
    methods(Static)
        function plotGauss(mu, sigma, color)
            x = (mu - 4 * sigma) : (sigma / 100) : (mu + 4 * sigma);
            pdf = normpdf(x, mu, sigma);
            plot(x, pdf, color);
        end
        
        function plotExp(lambda, color)
            x = 0:0.1:10;
            exp = exppdf(x,lambda);
            plot(x, exp, color)
        end
        
        function plotUniform(min, max, color)
            x = 0:0.1:10;
            uniform = unifpdf(x, min, max);
            plot(uniform, color);
        end
    end
    
end

