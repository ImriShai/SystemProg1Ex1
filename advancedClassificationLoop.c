//
// Created by imri on 18/01/24.
//
/*
 * This file implements the isArmstrong function and the isPalindrome function using loops
 */
#include "NumClass.h"

int power(int base, int power);
int numDigits(int);

int isArmstrong(int num) {
    int length = numDigits(num);
    int temp = num;
    int sum = 0;
    while(temp>0){
        sum += power(temp%10, length);
        temp =temp/10;
    }

    return sum == num;
}

int isPalindrome(int num) {
    int reversed = 0;
    int temp = num;
    while(temp>0){
        reversed = reversed*10 + temp%10;
        temp = temp/10;
    }
    return reversed == num;

}

int power(int base, int power) {
    int ans = base;
    for (int i = 1; i < power; i++) {
        ans = ans * base;
    }
    return ans;
}

int numDigits(int num) {
    int length = 1;
    while(num>=10){
        length++;
        num = num/10;
    }
    return length;
}