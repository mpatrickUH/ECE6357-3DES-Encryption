function [fPermutation] = DES_finalPermutation(block_L32, block_R32)
% This function implements the final permuation stage of DES encryption. 
%-------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TLS,TMC: take in the right and left halves of the block output by the
% Feistel network, combines them with the right on the left and the left on
% right, then puts the resulting message through the final bit shifting
% to give the output ciphertext. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fp64 = [40 8 48 16 56 24 64 32 ...
        39 7 47 15 55 23 63 31 ...
        38 6 46 14 54 22 62 30 ...
        37 5 45 13 53 21 61 29 ...
        36 4 44 12 52 20 60 28 ...
        35 3 43 11 51 19 59 27 ...
        34 2 42 10 50 18 58 26 ...
        33 1 41  9 49 17 57 25]; 

block = [block_R32 block_L32];
    
for i = 1:64
    fPermutation(i) = block(fp64(i));
end


end
%-------------------------------------------------------------------------
%   Used for the following .m main: DES.m 
%   Used in functions:
%   Calls functions: 
%-------------------------------------------------------------------------
% input:    block_R32 = right side 32 bits output by Fiestel network
%           block_L32 = left side 32 bits output by Fiestel network
% output:   fPermutation = the scrambled text
%-------------------------------------------------------------------------
% used:     fp64 = 64-bit vector that defines the final permutation
%           permutation = initial pt with bits scrambled according to ip64
%-------------------------------------------------------------------------
% ip64 uses fig 3.9 on page 62 in Parr's "Understanding Cryptography"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
