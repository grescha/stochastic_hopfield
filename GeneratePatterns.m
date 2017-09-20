function [ patterns ] = GeneratePatterns( nbrOfPatterns,patternSize )
%{
Creates matrix of random pattterns, a pattern correspon to a columnvector.
%}

patterns=zeros(patternSize,nbrOfPatterns);

for i=1:nbrOfPatterns
  patterns(:,i)=sign(rand(patternSize,1)-0.5);
end

end

