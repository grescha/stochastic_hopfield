clear all
close all
clc

nbrOfNeurons=200;
nbrOfPatterns=40;
nbrOfRuns=20;
beta=2;
simulationTime=80000;

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
  m1cum = cumsum(m1Vector)./(1:simulationTime)';
  plot(1:simulationTime,m1cum,'color',rand(1,3), 'LineWidth', 1.2)
end

title('Order parameter $m_{1}$ for 20 independent simulations', ...
  'Interpreter', 'latex', 'FontSize', 20)
xlabel('Iteration', 'FontSize', 24)
ylabel('$m_{1}$', 'Interpreter', 'latex', 'FontSize', 24)
axis([0, simulationTime, 0, 1.05])
xTick = get(gca, 'XTick');
set(gca, 'FontSize', 16);

