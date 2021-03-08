function failInd = BMark2_Problem(rndX)
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
%
%%  Main
%   Inputs
x1 = rndX(:,1); %   Hinge capacity
x2 = rndX(:,2);
x3 = rndX(:,3);
x4 = rndX(:,4);
x5 = rndX(:,5);
x6 = rndX(:,6); %   Horizontal load
x7 = rndX(:,7); %   Vertical load

%   3 modes of failure for simple portal frame (mechanism method)
ga = x1+2*x3+2*x4+x5 -5*x6-5*x7;        %   Combined
gb = x1+x2+x4+x5 -5*x6;                	%   Sway
gc = x2+2*x3+x4 -5*x7;                 	%   Beam


%   From Patelli 'performanceFunctionSimpleStructuralFrame.m', not correct?
% ga=x1+2*x3+2*x4+x5-5*x6-5*x7;
% gb=x1+2*x2+x4+x5-5*x6;
% gc=x2+2*x3+x4-5*x6;

output = min([ga gb gc]);

if lt(output, 0)
    failInd = 1;
else
    failInd = 0;
end

end
