function [ orderParameter ] = CalculateOrderParam(state,pattern)

N=length(state);
orderParameter=1/N*state'*pattern;

end

