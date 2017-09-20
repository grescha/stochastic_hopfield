function [ weightMatrix ] = GenerateWeightsMatrix(patterns)

nbrOfNodes=length(patterns(:,1) );
nbrOfPatterns=length(patterns(1,:) );

weightMatrix=zeros(nbrOfNodes,nbrOfNodes);

for mu=1:nbrOfPatterns
  weightMatrix=weightMatrix+patterns(:,mu)*patterns(:,mu)';
end
weightMatrix=1/nbrOfNodes*weightMatrix;


end

