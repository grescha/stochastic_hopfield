clear all
close all
clc

nbrOfNeurons=200;
nbrOfPatterns=26;
nbrOfRuns=1;
beta=2;
simulationTime=80000;
%nbrOfBits=100000;
%nbrOfUnstable=0;
%k=0;
subplot(1,1,1)
axis([0 simulationTime 0 1.2])
hold on
for i=1:nbrOfRuns %for the different number of patterns
  patterns= GeneratePatterns( nbrOfPatterns,nbrOfNeurons );
  weightsMatrix=GenerateWeightsMatrix(patterns);
  pattern1=patterns(:,1);
  state=pattern1; %feed pattern 1
  
  m1Vector=zeros(simulationTime,1);
  for j=1:simulationTime
    m1=CalculateOrderParam(state,pattern1);
    m1Vector(j) = m1;
    state = AsynchronousUpdate(state,weightsMatrix,beta);
  end
plot(1:simulationTime,m1Vector,'color',rand(1,3))
end

