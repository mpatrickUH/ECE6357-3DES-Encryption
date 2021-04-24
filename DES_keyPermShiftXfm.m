function [key48] = DES_keyPermShiftXfm(key64)
% Initial permutation and compression of the key to 56 bits along with
% creating the shifted keys to be used for the 16 rounds of encryption.
%-------------------------------------------------------------------------
% input:    key64 = the 64 bit key
% output:   key56 = the 56 bit permutation of the 64 bit key
%-------------------------------------------------------------------------
% used:     PC1 = predetermined array defining the permutation of key64
%-------------------------------------------------------------------------
% PC1 taken from table 3.11 p67 in Parr's "Understanding Cryptography"
%-------------------------------------------------------------------------
% input:    key56 = the 56 bit key
%           DESRnd = the current round of DES blocks
% output:   key_L = the shifted left half of the 56 bit key
%           key_R = the shifted right half of the 56 bit key
%-------------------------------------------------------------------------
% Shift array taken from p67 in Parr's 'Understanding Cryptography'
%-------------------------------------------------------------------------
PC1 =   [57 49 41 33 25 17  9  1 58 50 42 34 26 18 ...
         10  2 59 51 43 35 27 19 11  3 60 52 44 36 ...
         63 55 47 39 31 23 15  7 62 54 46 38 30 22 ...
         14  6 61 53 45 37 29 21 13  5 28 20 12  4];
     
PC2 =   [14 17 11 24  1  5  3 28 15  6 21 10 23 19 12  4 ...
         26  8 16  7 27 20 13  2 41 52 31 37 47 55 30 40 ... 
         51 45 33 48 44 49 39 56 34 53 46 42 50 36 29 32];    

% do the permuatation and compression based on PC1
for i = 1:56
    key56(i) = key64(PC1(i));
end

%split the array into left and right halves
key_L = key56(1:28);
key_R = key56(29:56);

%Now create the shifted keys for all 16 rounds of encryption
shft_array = [1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];
shft_amt = 0;

for i = 1:16
    shft_amt = shft_amt - shft_array(i);
    key_sL(i,:) = circshift(key_L, shft_amt);
    key_sR(i,:) = circshift(key_R, shft_amt);
% Combine the left and right 28 bit key segments into one array
    key_(i,:) = [key_sL(i,:) key_sR(i,:)];
% use PC2 to get the compressed permutation of the 56 bit key
    for j = 1:48
        key48(i,j) = key_(i,PC2(j));
    end
end

save('DESencrypt_key.mat','key48');
writematrix(key48,'DESencrypt_key.xlsx');

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


