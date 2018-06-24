% Program to generate the "wall" cells of the partitions of type "empty"
% INPUT:
%   - "row/1" one value for each possibile row value
%   - "col/1" one value for each possibile column value
%   - "min_row/1" the minimum value of all the possible rows (could be computed from row/1)
%   - "min_col/1" the minimum value of all the possible colums (could be computed from col/1)
%   - "max_row/1" the maximum value of all the possible rows (could be computed from row/1)
%   - "max_col/1" the maximum value of all the possible colums (could be computed from col/1)
%   - "cell/3" the values already present in the partition (should be only the perimetral values)
% OUTPUT:
%   - "cell/3" the values already present in the partition plus the new values computed by this program, in the form of "cell(Row,Column,Content)"

cell(X,Y,"wall") :- row(X), col(Y), min_row(MnR), max_row(MxR), min_col(MnC), max_col(MxC), X > MnR, X < MxR, Y > MnC, Y < MxC.

% Needed by clingo
#show cell/3.
