clear all;clc;
% This script is the implementation of the DES encryption standards. 
% It uses the following in its implementation:
%-------------------------------------------------------------------------
% Variables:
%           plaintext = the generated plain text message to be encrypted
%           key = they encryption key
%           cipher = the returned cipher text
%           plain = the decrypted plain text
%-------------------------------------------------------------------------
% functions used:
%            
%-------------------------------------------------------------------------
% Acronym: TLS,TMC = Too Little Sleep, Too Much Caffine 
%    TLS,TMC = I know this is obvious but just in case you are in a brain
%    fog, this explains what I'm doing in this part.
%-------------------------------------------------------------------------

%LIST OF THE DATA SETS USED IN DEVELOPING AND TESTING THIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%These data sets are based on the DES data sets previously listed with an
%extra couple of keys added. These were made up as I didn't easily find
%samples to pull from.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load('TripleDES_Test_01.mat')
% load('TripleDES_Test_02.mat')
load('TripleDES_Test_03.mat')
% load('TripleDES_Test_AE_a.mat')
% load('TripleDES_Test_AE_b.mat')

%Format the key and plaintext message into binary for the DES encryption.
%DES is a bitwise operation.
key1 = reshape(dec2bin(key,64).'-'0',1,64);
key2 = reshape(dec2bin(key2,64).'-'0',1,64);
key3 = reshape(dec2bin(key3,64).'-'0',1,64);
pt = reshape(dec2bin(pt,64).'-'0',1,64);


%Encrypt
[cipher] = DES_encrypt(pt,key1);
[plain] = DES_decrypt(cipher,key2);
[cipher2] = DES_encrypt(plain,key3);

%Decrypt
[plain1] = DES_decrypt(cipher2,key3);
[cipher3] = DES_encrypt(plain1,key2);
[plain_recover] = DES_decrypt(cipher3,key1);


disp(append('Input plaintext:     ',string(binaryVectorToHex(pt))))
disp(append('First ciphertext:    ',string(binaryVectorToHex(cipher))))
disp(append('New key plaintext:   ',string(binaryVectorToHex(plain))))
disp(append('Final ciphertext:    ',string(binaryVectorToHex(cipher2))))

disp('---------    ')

disp(append('Final ciphertext:    ',string(binaryVectorToHex(cipher2))))
disp(append('New key plaintext:   ',string(binaryVectorToHex(plain1))))
disp(append('First ciphertext:    ',string(binaryVectorToHex(cipher3))))
disp(append('Recovered plaintext: ',string(binaryVectorToHex(plain_recover))))

% char(bin2dec(reshape(char(plain+'0'), 8,[]).'))'

% for i = 1:16
%     j = 17 -i;
% en(i,:) = bin_in_hex_out(encpt_process(i,:))
% de(i,:) = bin_in_hex_out(dcpt_process(j,:))
% 
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 6357 Cybersecurity, University of Houston 
% Spring 2021, class project
% Created by: K.M.Patrick Krueger
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
