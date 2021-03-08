%%  Benchmark problem 1
%   Example 5; A parallel system (pg217)
%   Pf = 2.087e-4 (using FORM)
%
%   Evaluate limit state function for Benchmark problem 1
%   System with 5 standard-normal random variables linked into a
%   system,
% 
%   Ref:
%   Engelund - A benchmark study on importance sampling techniques
%   in structural reliability - 1993
%
%   DW - 26/02/21 - Created
%%  1) Define inputs
%   Uniform random number
nMCSample = 250000;
rndUni = rand(nMCSample,5);

%   Probability distributions
pd = BMark1_GenPDist;

%   Convert sample to correct distribution
for i = 1:size(rndUni,2)
    rndX(:,i) = icdf(pd{i}, rndUni(:,i));
end


%%  2) Simulate answer
%   MC check
for i = 1:size(rndX,1)
    failInd(i) = BMark1_Problem(rndX(i,:));
end

pf = mean(failInd);
