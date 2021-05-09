ECE6357-3DES-Encryption

All .mat files are message/keys used to test the code. It is set up to only takes hex message/keys. As far as I can tell it, is working correctly.

TripleDES.m - Used as a 1 shot to both encrypt/decrypt at the same time. Calls DES_encrypt.m & DES_decrypt.m

    TripleDES_encrypt.m - The encryption as a function called by DES.m
    TripleDES_decrypt.m - The decryption as a function called by DES.m

Stand alone versions used to find the time necessary for encryption/decryption. (Same as functions)

    TripleDES_encrypt_.m
    TripleDES_decrypt_.m

Support functions

    DES_d_initpermutation.m - decryption initial permutation
    DES_d_finalpermutation.m - decryption final permutation
    DES_fFxn.m - calculating the the f function to xor with the right side
    DES_finalPermutation.m - encryption final permutatoin
    DES_initPermutation.m - encryption initial permutation
    DES_keyPermShiftXfm.m - Permutation and compression of key, creating an array of all 6 keys
    DES.sBox.m - sBox transformation

Not Needed

    DES_keyTransform.m - Not used - was an initial effort that should have been deleted vs uploaded.
    TripleDES_orig.m - Not used, another initial effort that should have been deleted.
