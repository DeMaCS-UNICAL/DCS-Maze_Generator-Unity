% Program to compute one horizontal/vertical port and the 2 walls from the door (horizontally/vertically) straight to the border of the partition
% INPUT:
%   - "row/1" one value for each possibile row value
%   - "col/1" one value for each possibile column value
%   - "max_row/1" the maximum value of all the possible rows (could be computed from row/1)
%   - "max_col/1" the maximum value of all the possible colums (could be computed from col/1)
%   - "min_distance_wall/1" the minimum number of cells to be left from each perimetral cell
%   - "cell/3" the values already present in the partition (should be only the perimetral values)
%   - "orientation/1" if the door/wall should be horizontal or vertical
% OUTPUT:
%   - "cell/3" the values already present in the partition plus the new values computed by this program, in the form of "cell(Row,Column,Content)"
%   - "new_door/3" the position of the new horizontal door, in the form of "new_door(Row,Column,Type)"

% Avoid door on the border walls (not needed thanks to the next roles and since min_distance_wall is always >= 0)
% unavailable_cells(X,Y) :- row(X), col(Y), min_row(X).
% unavailable_cells(X,Y) :- row(X), col(Y), min_col(Y).
% unavailable_cells(X,Y) :- row(X), col(Y), max_row(X).
% unavailable_cells(X,Y) :- row(X), col(Y), max_col(Y).

% Avoid door on cells too close to the wall
unavailable_cells(X,Y) :- min_distance_wall(D), row(X), col(Y), min_row(H), X-H<=D.
unavailable_cells(X,Y) :- min_distance_wall(D), row(X), col(Y), min_col(W), Y-W<=D.
unavailable_cells(X,Y) :- min_distance_wall(D), row(X), col(Y), max_row(H), H-X<=D.
unavailable_cells(X,Y) :- min_distance_wall(D), row(X), col(Y), max_col(W), W-Y<=D.

% Avoid door that create a wall to another door (i.e. on the same row/col)
unavailable_cells(X,Y) :- cell(X,_,"vdoor"), col(Y), orientation(horizontal).
unavailable_cells(X,Y) :- cell(_,Y,"hdoor"), row(X), orientation(vertical).

% Identify the cells where we can insert a door
free_cells(X,Y) :- row(X), col(Y), not unavailable_cells(X,Y).

% Select the door type depending on the value of "orientation/1"
door_type("hdoor") :- orientation(horizontal).
door_type("vdoor") :- orientation(vertical).

% Choose the position of the new door
1={new_door(X,Y,Dtype) : free_cells(X,Y)}=1 :- door_type(Dtype).

% Derive the new value of the cell
cell(X,Y,Dtype) :- new_door(X,Y,_), door_type(Dtype).

% Build a wall from the door to the borders of the partition
cell(X,Y2,"wall") :- new_door(X,Y1,_), col(Y2), Y1!=Y2, orientation(horizontal), Y2<MAX, Y2>MIN, min_col(MIN), max_col(MAX).
cell(X2,Y,"wall") :- new_door(X1,Y,_), row(X2), X1!=X2, orientation(vertical), X2<MAX, X2>MIN, min_row(MIN), max_row(MAX).

% Needed by clingo
#show cell/3.
#show new_door/3.
