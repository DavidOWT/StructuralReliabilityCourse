function pd = BMark1_GenPDist
%   Generate probability distirbutions for Benchmark problem 1

for i = 1:5
   pd{i} = makedist('Normal', 'Mu', 0, 'Sigma', 1); 
end

end