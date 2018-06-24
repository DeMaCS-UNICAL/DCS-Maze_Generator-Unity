% Program to assign the objects to the partitions
% INPUT:
%   - "assignment/2" type value assigned to a partition
%   - "connected/2" exists the value "connected(P1,P2)" if the partition P1 is connected to the partition P2, i.e. there is a door that connects P1 and P2
%   - "num_partitions/1" the number of the partitions
%   - "maximum_locked_door_number/2" the maximum locked doors number
%   - "object_type/2" the object type
% OUTPUT:
%   - "object_assignment/2" the specification of the type of each partition, in the form of "object_assignment(P,Type)"

object_assignment(P,T) | not_object_assignment(P,T) :- object_type(T), assignment(P,T1), T1 != "empty".

% All object types assigned
assigned_type(T) :- object_assignment(_,T).

% It's infeasible to find an enemy in a corridor partition
:- object_assignment(P,"enemy"), assignment(P,"corridor"). 

% It's infeasible to find a type that isn't assigned
:- object_type(T), not assigned_type(T).

% It's infeasible to find a partition that has two different object type
:- object_assignment(P,T1), object_assignment(P,T2), T1 != T2.

% It's infeasible to find two different partitions with the same object type
:- object_assignment(P1,"key"), object_assignment(P2,"key"), P1 != P2.
:- object_assignment(P1,"avatar"), object_assignment(P2,"avatar"), P1 != P2.
:- object_assignment(P1,"goal"), object_assignment(P2,"goal"), P1 != P2.

% Projection the atoms to avoid functional terms
% TODO : Remove when EmbASP will support ground funcional terms
object_assignment5(Rmin,Cmin,Rmax,Cmax,T) :- object_assignment(p(Rmin,Cmin,Rmax,Cmax),T).

% Needed by clingo
#show object_assignment5/5.
