function [ updatedState ] = AsynchronousUpdate(state,weightsMatrix,beta)

nbrOfNodes = length(state);
updatedState = state;
nodeToUpdate = randi(nbrOfNodes);
weightsVector = weightsMatrix(:,nodeToUpdate);
b = weightsVector'*state;
probVal = BoltzmannFunction(b,beta);
randomNbr = rand;
if(randomNbr < probVal)  
  updatedState(nodeToUpdate) = 1;
else
  updatedState(nodeToUpdate) = -1;
end

end