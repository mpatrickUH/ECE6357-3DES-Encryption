function [key48] = DES_keyTransform(key_L, key_R)
%Convert the L and R 28 bit keys into a 56 bit key, compress it to 48 bits
%using a permutation vector.
%   Used for the following main: DES.m 
%   Used in functions: 
%   Calls functions: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input:    key_L = the shifted left half of the 56 bit key
%           key_R = the shifted right half of the 56 bit key
% output:   key48 = the 56 bit key
%-------------------------------------------------------------------------
% used:     PC2 = predetermined array defining the permutation of key56
%           key56 = combination of L and R 28 bit keys
%-------------------------------------------------------------------------
% PC2 taken from table 3.12 p69 in Parr's "Understanding Cryptography"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PC2 =   [14 17 11 24  1  5  3 28 ...
         15  6 21 10 23 19 12  4 ...
         26  8 16  7 27 20 13  2 ...
         41 52 31 37 47 55 30 40 ...
         51 45 33 48 44 49 39 56 ...
         34 53 46 42 50 36 29 32];

% Combine the left and right 28 bit key segments into one array
key56 = [key_L key_R];

% use PC2 to get the compressed permutation of the 56 bit key
for i = 1:48
    key48(i) = key56(PC2(i));
end



end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%