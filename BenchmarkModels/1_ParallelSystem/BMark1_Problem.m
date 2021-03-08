function failInd = BMark1_Problem(rndX)
%   Example 5; A parallel system (pg217)
%   Pf = 2.087e-4 (using FORM)
%
%   Evaluate limit state function for Benchmark problem 1
%   System with 5 standard-normal random variables linked into a
%   system,
%
%   rndX = value in the sample space
%   failInd = 1,0 defining whether or not the system fails
%
%   Ref:
%   Engelund - A benchmark study on importance sampling techniques
%   in structural reliability - 1993
%
%   DW - 26/02/21 - Created
%%  Main
ind = [1:4]';
beta = 2.5+0.25*cos(pi.*ind./length(ind));

%   System 'link' matrix
%   gamma = 1 when i=j & j=i+1; else gamma = 0
gamma = eye(5)+circshift(eye(5),1); 
gamma(:,end) = [];

%   system g-value
g = beta-gamma'*rndX';

%   Determine if limit state  violated (g less than 0)
if le(max(g), 0)
    failInd = 1;
else 
    failInd = 0;
end


end