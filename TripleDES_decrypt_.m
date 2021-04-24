%Stand-alone decryption to test the timing
% This function implements the decryption stage of DES. 
%-------------------------------------------------------------------------
% Initial Permutation to transform the key into 56 bit vs 64, creating all 
% shifted keys needed for the 16 rounds of encrption at the same time. Also
% to do the permutation on the pt and output it as R/L blocks of 32 bits each
%-------------------------------------------------------------------------
clear all;clc;
load('TripleDES_ciphertext_out.mat');

%Decrypt
[plain1] = DES_decrypt(cipher2,key3);
[cipher3] = DES_encrypt(plain1,key2);
[plain_recover] = DES_decrypt(cipher3,key1);

%Now show all those lovely encrypted and decrypted messages!
disp(append('Input plaintext:     ',string(binaryVectorToHex(pt_in))))
disp(append('First ciphertext:    ',string(binaryVectorToHex(cipher_en))))
disp(append('New key plaintext:   ',string(binaryVectorToHex(plain_en))))
disp(append('Final ciphertext:    ',string(binaryVectorToHex(cipher2))))

disp('---------    ')

disp(append('Final ciphertext:    ',string(binaryVectorToHex(cipher2))))
disp(append('New key plaintext:   ',string(binaryVectorToHex(plain1))))
disp(append('First ciphertext:    ',string(binaryVectorToHex(cipher3))))
disp(append('Recovered plaintext: ',string(binaryVectorToHex(plain_recover))))
 
disp('---------    ')
disp(append('key 1:   ',string(binaryVectorToHex(key1))))
disp(append('key 2:   ',string(binaryVectorToHex(key2))))
disp(append('key 3:   ',string(binaryVectorToHex(key3))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%