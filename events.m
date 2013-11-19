function [value,isterminal,direction] = events(t,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% value(i) is the value of the function.
% isterminal(i) = 1, if the integration is to terminate at a zero of this event function and 0 otherwise.
% direction(i) = 0 if all zeros are to be computed (the default), +1 if only the zeros where the event function increases, and -1 if only the zeros where the event function decreases.

global dash mash Vstar

value=zeros(2,1);
isterminal=zeros(2,1);
direction=zeros(2,1);

% V = Vstar

if abs((y(5)-Vstar)/Vstar)== 0.1
    value(1) = y(5)-Vstar;     % detect diamater difference = 0
    isterminal(1) = 0;   % stop the integration
    direction(1) = 0;   % either direction
end

% % Diameter = dash
% value(2) = y(2)-dash;     % detect diamater difference = 0
% isterminal(2) = 1;   % stop the integration
% direction(2) = 0;   % either direction

% Mass = mash
value(2) = y(1)-mash;     % detect diamater difference = 0
isterminal(2) = 1;   % stop the integration
direction(2) = 0;   % either direction

end

