#include <stdio.h>
#include "NumClass.h"


int main() {
    int start,end;
    scanf(" %d",&start);
    scanf(" %d",&end);

    if (end < start) {
        int temp = end;
        end = start;
        start = temp;
    }
    printf("The Armstrong numbers are:");

    for (int i = start; i<=end; i++) {
        if (isArmstrong(i))
            printf(" %d",i);
    }
    printf("\nThe Palindromes are:");
    for (int i = start; i<=end; i++){
        if (isPalindrome(i))
            printf(" %d",i);
    }
    printf("\nThe Prime numbers are:");
    for (int i = start; i<=end; i++){
        if (isPrime(i))
            printf(" %d",i);
    }
    printf("\nThe Strong numbers are:");
    for (int i = start; i<=end; i++){
        if (isStrong(i))
            printf(" %d",i);
    }
    printf("\n");

    return 0;
}
