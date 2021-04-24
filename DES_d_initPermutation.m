function [block_L32, block_R32] = DES_d_initPermutation(pt)
% This function implements the initial permuation stage of DES encryption. 
%   Used for the following .m main: DES.m 
%   Used in functions:
%   Calls functions: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input:    pt = plain text
%           key = encryption key
% output:   block_L32 = left half of the scrambled text
%           block_R32 = right half of the scrambled text
%-------------------------------------------------------------------------
% used:     ip64 = 64-bit vector that defines the initial permutation
%           permutation = initial pt with bits scrambled according to ip64
%-------------------------------------------------------------------------
% ip64 uses fig 3.8 on page 62 in Parr's "Understanding Cryptography"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TLS,TMC: define the permutation vector then create the for loop to run
% the plaintext message through it to shift its bits around. Then split the
% shifted bits into a left and right half of 32 bits each to return as
% values to the calling function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ip64 = [ 58 50 42 34 26 18 10 2 ...
         60 52 44 36 28 20 12 4 ...
         62 54 46 38 30 22 14 6 ...
         64 56 48 40 32 24 16 8 ...
         57 49 41 33 25 17  9 1 ...
         59 51 43 35 27 19 11 3 ...
         61 53 45 37 29 51 13 5 ...
         63 55 47 39 31 23 15 7]; 

for k = 1:64
    permutation(k) = pt(ip64(k));
end

block_L32 = permutation(1:32); 
block_R32 = permutation(33:64);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%