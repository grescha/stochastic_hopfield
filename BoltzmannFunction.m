function [ y ] = BoltzmannFunction( x,beta )

y=1/(1+exp(-2*beta*x));

end

