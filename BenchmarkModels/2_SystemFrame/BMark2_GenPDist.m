function pd = BMark2_GenPDist
%   A simple portal frame
%   Pf = 2.0e-2 (using ??)
%
%   Evaluate limit state function for Benchmark problem 1
%   System with 5 standard-normal random variables linked into a
%   system,
% 
%   Ref:
%   Engelund - A benchmark study on importance sampling techniques
%   in structural reliability - 1993
%%  Main
%   Hinge capacity = lognormal
sigmaLN = log((6/60)^2+1);
muLN = log(60)-0.5*sigmaLN^2;

for i = 1:6
    pd{i} = makedist('Lognormal', 'mu', muLN, 'sigma', sigmaLN);
end

%   Load = gumbel 
%   6=horizontal, 7=vertical
pd{6} = makedist('GeneralizedExtremeValue', 'mu', 20, 'sigma', 6, 'k', 0);
pd{7} = makedist('GeneralizedExtremeValue', 'mu', 25, 'sigma', 7.5, 'k', 0);


end