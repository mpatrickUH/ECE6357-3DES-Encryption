%Stand-alone encryption to test the timing
% This function implements the encryption stage of DES. 
%-------------------------------------------------------------------------
% Initial Permutation to transform the key into 56 bit vs 64, creating all 
% shifted keys needed for the 16 rounds of encrption at the same time. Also
% to do the permutation on the pt and output it as R/L blocks of 32 bits each
%-------------------------------------------------------------------------
% input:    pt = plain text
%           key = encryption key
% output:   ct = cipher text
% used:     e = encrypt
%           d = decrypt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;

%LIST OF THE DATA SETS USED IN DEVELOPING AND TESTING THIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%These data sets are based on the DES data sets previously listed with an
%extra couple of keys added. These were made up as I didn't easily find
%samples to pull from.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('TripleDES_Test_01.mat')
% load('TripleDES_Test_02.mat')
% load('TripleDES_Test_03.mat')
% load('TripleDES_Test_AE_a.mat')
% load('TripleDES_Test_AE_b.mat')

%Format the key and plaintext message into binary for the DES encryption.
%DES is a bitwise operation.
key1 = reshape(dec2bin(key,64).'-'0',1,64);
key2 = reshape(dec2bin(key2,64).'-'0',1,64);
% key3 = reshape(dec2bin(key3,64).'-'0',1,64);
key3 = key1;                            %for doing 2 key configuration of 3DES
pt = reshape(dec2bin(pt,64).'-'0',1,64);

%Save the original input plain text to compare with the calculated version
%at the end.
pt_in = pt; 


%Encrypt the data
[cipher] = DES_encrypt(pt,key1);
[plain] = DES_decrypt(cipher,key2);
[cipher2] = DES_encrypt(plain,key3);

%Save the data to feed into the decryption version, including original
%values to be used for comparisons at the end
pt_in = pt; 
cipher_en = cipher;
plain_en = plain;


save('TripleDES_ciphertext_out','cipher2','key1','key2','key3','pt_in','cipher_en','plain_en');


%Output the initial plaintext, ciphertext, and key used to the screen in
%hex in a string format for cut/paste into reports.
disp(append('Input plaintext:     ',string(binaryVectorToHex(pt))))
disp(append('First ciphertext:    ',string(binaryVectorToHex(cipher))))
disp(append('New key plaintext:   ',string(binaryVectorToHex(plain))))
disp(append('Final ciphertext:    ',string(binaryVectorToHex(cipher2))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
