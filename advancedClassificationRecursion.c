
//
// Created by imri on 18/01/24.
//
/*
 * This file implements the isArmstrong function and the isPalindrome function using recursion.
 */
#include "NumClass.h"

int powRec(int base, int power);
int numDigitsRec(int);
int isArmstrongHelper(int num, int sum, int numDigits);
int reverse(int num);

int isArmstrong(int num) {
    return isArmstrongHelper(num,num, numDigitsRec(num));
}
int isArmstrongHelper(int num, int sum, int numDigits) {
    if (num == 0) return (sum == 0);
    return isArmstrongHelper(num/10,sum- powRec(num%10,numDigits),numDigits);
}

int isPalindrome(int num) {
    return num == reverse(num);
}


int powRec(int base,int power) {
    if(power == 0)
        return 1;
    return base*powRec(base,power-1);
}

int numDigitsRec(int num) {
    if (num < 10)
        return 1;
    return 1 + numDigitsRec(num/10);
}
int reverse(int num){
    int digits = numDigitsRec(num);
    if(num==0) return 0;
    return (num%10)*powRec(10,digits-1) + reverse(num/10);
}