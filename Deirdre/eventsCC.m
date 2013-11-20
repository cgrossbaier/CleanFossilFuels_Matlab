function [value,isterminal,direction] = eventsCC(t,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% value(i) is the value of the function.
% isterminal(i) = 1, if the integration is to terminate at a zero of this event function and 0 otherwise.
% direction(i) = 0 if all zeros are to be computed (the default), +1 if only the zeros where the event function increases, and -1 if only the zeros where the event function decreases.

global mc ma Vstar

%value=zeros(2,1);
%isterminal=zeros(2,1);
%direction=zeros(2,1);


Vzero=1;

if (Vstar-y(4))/Vstar <= 0.01
     Vzero=0;
end

value = Vzero;     % detect Volatile difference = 0
isterminal = 1;   % stop the integration
direction = 0;   % either direction


% % Diameter = dash
% value(2) = y(2)-dash;     % detect diamater difference = 0
% isterminal(2) = 1;   % stop the integration
% direction(2) = 0;   % either direction

% % Mass = mash
% value(2) = y(1)-mash;     % detect diamater difference = 0
% isterminal(2) = 1;   % stop the integration
% direction(2) = 0;   % either direction



