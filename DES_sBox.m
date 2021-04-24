function block_R = DES_sBox(block_R48)
% Needs Cleanup
% This function downsizes the data to 48 bits as part of DES encryption. 
%   Used for the following .m main: DES.m 
%   Used in functions:
%   Calls functions: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input:    block_R48 = the result of the expanded right side xored wtih
%                            the 48 bit key
% output:   block_R = The right side 32 bits of the text. 
%-------------------------------------------------------------------------
% used:     s( ) = the predefined sBox arrays
%           block_6x8 = a reshaped version of the 48 bit text
%           row = the row for the needed sBox value
%           column = the column for the needed sBox value
%           sBx = the sBox value
%           block_R32 = the 32 bit value that has now replace the 48 bit
%-------------------------------------------------------------------------
% s-boxes are taken from Table 3.3-9 p. 64-65 in Parr's "Understanding Cryptography"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TLS,TMC: Each of the eight 8 bit section of the encrypted text is
% replaced by the corresponding value from the sBox. So digit 1 gets a
% value from sBox 1, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S{1} = [14  4 13  1  2 15 11  8  3 10  6 12  5  9 0 7; ...
         0 15  7  4 14  2 13  1 10  6 12 11  9  5 3 8; ...
         4  1 14  8 13  6  2 11 15 12  9  7  3 10 5 0; ...
        15 12  8  2  4  9  1  7  5 11  3 14 10  0 6 13];

S{2} = [15  1  8 14  6 11  3  4  9 7  2 13 12  0  5 10; ...
         3 13  4  7 15  2  8 14 12 0  1 10  6  9 11  5; ...
         0 14  7 11 10  4 13  1  5 8 12  6  9  3  2 15; ...
        13  8 10  1  3 15  4  2 11 6  7 12  0  5 14  9];

S{3} = [10  0  9 14  6  3 15  5  1 13 12  7 11  4  2  8; ...
        13  7  0  9  3  4  6 10  2  8  5 14 12 11 15  1; ...
        13  6  4  9  8 15  3  0 11  1  2 12  5 10 14  7; ...
         1 10 13  0  6  9  8  7  4 15 14  3 11  5  2 12];

S{4} = [ 7 13 14  3  0  6  9 10  1  2  8  5 11 12  4 15; ...
        13  8 11  5  6 15  0  3  4  7  2 12  1 10 14  9; ...
        10  6  9  0 12 11  7 13 15  1  3 14  5  2  8  4; ...
         3 15  0  6 10  1 13  8  9  4  5 11 12  7  2 14];

S{5} = [ 2 12  4  1  7 10 11  6  8  5  3 15 13  0 14  9; ...
        14 11  2 12  4  7 13  1  5  0 15 10  3  9  8  6; ...
         4  2  1 11 10 13  7  8 15  9 12  5  6  3  0 14; ...
        11  8 12  7  1 14  2 13  6 15  0  9 10  4  5  3];

S{6} = [12  1 10 15  9  2  6  8  0 13  3  4 14  7  5 11; ...
        10 15  4  2  7 12  9  5  6  1 13 14  0 11  3  8; ...
         9 14 15  5  2  8 12  3  7  0  4 10  1 13 11  6; ...
         4  3  2 12  9  5 15 10 11 14  1  7  6  0  8 13];

S{7} = [ 4 11  2 14 15  0  8 13  3 12  9  7  5 10  6  1; ...
        13  0 11  7  4  9  1 10 14  3  5 12  2 15  8  6; ...
         1  4 11 13 12  3  7 14 10 15  6  8  0  5  9  2; ...
         6 11 13  8  1  4 10  7  9  5  0 15 14  2  3 12];

S{8} = [13  2  8  4  6 15 11  1 10  9  3 14  5  0 12  7; ...
         1 15 13  8 10  3  7  4 12  5  6 11  0 14  9  2; ...
         7 11  4  1  9 12 14  2  0  6 10 13 15  3  5  8; ...
         2  1 14  7  4 10  8 13 15 12  9  0  3  5  6 11];
   
     
%Now to do the s-box permutation.
block_6x8 = reshape(block_R48,6,8);
block_R32 = zeros(8,4);
%find the row and column numbers to find the desired s-box value
for i = 1:8
    sBox = S{i};
    row = bin2dec(num2str([block_6x8(1,i) block_6x8(6,i)]))+1;
    col = bin2dec(num2str(block_6x8(2:5,i)'))+1;
    sValue = dec2bin(sBox(row,col),4);
    for j = 1:4
        block_R32(i,j) =  str2num(sValue(j));
    end
end
block_R = reshape(block_R32',32,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston, Dr. Mian Pao 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
