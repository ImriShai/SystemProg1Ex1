//
// Created by imri on 18/01/24.
//
/*
 * This file implements the isPrime function and the isStrong function
 */
#include "NumClass.h"


int factorial(int num);

int isPrime(int num) {
    int i;
    if (num == 1||num==2) {
        return TRUE;
    }
    if (num%2==0) {
        return FALSE;
    }
    for (i = 3; i*i <= num; i+=2) {
        if (num % i == 0) {
            return FALSE;
        }
    }
    return TRUE;
}
int isStrong(int num) {
    int sum = 0;
    int temp = num;
    while (temp > 0) {
        sum += factorial(temp % 10);
        temp /= 10;
    }
    return sum == num;
}

int factorial(int num) {
    int ans = 1;
    for(int i = 2; i<=num; i++) {
        ans *= i;
    }
    return ans;
}
