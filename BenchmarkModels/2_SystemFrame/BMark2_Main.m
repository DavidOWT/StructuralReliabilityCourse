%%  Benchmark problem 2
%   A simple portal frame with plastic hinges
%   Pf = 2.0e-2 (using ??)
%
%   Evaluate limit state function for Benchmark problem 1
%   System with 5 standard-normal random variables linked into a
%   system,
% 
%   Ref:
%   Schueller, - On efficient computational schemes to calculate
%   structural failure probabilities - 1989
%
%   DW - 26/02/21 - Created
%%  1) Define inputs
%   Uniform random number
nMCSample = 250000;
rndUni = rand(nMCSample,7);

%   Probability distributions
pd = BMark2_GenPDist;

%   Convert sample to correct distribution
for i = 1:size(rndUni,2)
    rndX(:,i) = icdf(pd{i}, rndUni(:,i));
end


%%  2) Simulate answer
%   MC check
for i = 1:size(rndX,1)
    failInd(i) = BMark2_Problem(rndX(i,:));
end

pf = mean(failInd);
