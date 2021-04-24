function block_Rf = DES_fFxn(block_R, key48)
%Create the f function: increase the R side to 48 bits, combine it with the 
% 48 bit key, replace the values with lookup s-box tables to reduce the R
% side back to 32 bits, then do the permutation P.
%-------------------------------------------------------------------------
% Increase the size of block_R from 32 bits to 48 so it can be XOR'ed with
%   the 48 bit encryption key.


E =[32  1  2  3  4  5 ...
     4  5  6  7  8  9 ...
     8  9 10 11 12 13 ...
    12 13 14 15 16 17 ...
    16 17 18 19 20 21 ... 
    20 21 22 23 24 25 ...
    24 25 26 27 28 29 ...
    28 29 30 31 32  1];

P = [16 7 20 21 29 12 28 17 ...
      1 15 23 26 5 18 31 10 ...
      2 8 24 14 32 27  3  9 ...
     19 13 30 6 22 11  4 25];


block_R48 = reshape([block_R([32,4:4:28])',(reshape(block_R,4,8))',block_R([5:4:29,1])']', 48, 1)';

% for i = 1:48
%     block_R48(i) = block_R(E(i));
% end
% block_R48 = bin2dec(block_R48); %Have to convert them both into decimal for bitxor
% key48 = bin2dec(key48);


block_R48 = bitxor(block_R48,key48);    
block_R48 = dec2bin(block_R48);   %Turn it back into binary to continue

% Do the s-box lookup on the 48 bit block to get back to 32 bits
block_R32 = DES_sBox(block_R48);

% The final permutation P before returning the updated R side to xor with L
%  side from previous round


    for i = 1:32
        block_Rf(i) = block_R32(P(i));
    end


end

%-------------------------------------------------------------------------
%   Used for the following main: DES.m 
%   Used in functions: 
%   Calls functions: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input:    block_R = the permutated right 32 bits of the plaintext
%           key48 = the 48 bit key to be used in the calculations.
% output:   block_R = the new right hand 32 bits of the message in the 
%               encryption process 
%-------------------------------------------------------------------------
% used:     
%           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
