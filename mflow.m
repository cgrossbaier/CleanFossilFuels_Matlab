function [ mflow ] = mflow ( v, d, T)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

global R v1 B1 Tact ;

densAir = 101325 * 0.03 ./ (R * T);

mflow = v1 * pi * d^2 * densAir * YO2 * B1 * exp(-Tact/T);

end

