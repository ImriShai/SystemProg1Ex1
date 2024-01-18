CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=
FLAGS= -Wall -g
.PHONEY: all, clean

all: mains loops recursives recursived loopd maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec # why only mains?

loops: advancedClassificationLoop.o basicClassification.o
	$(AR) -rcs libclassloops.a advancedClassificationLoop.o basicClassification.o

recursives: advancedClassificationRecursion.o basicClassification.o
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o basicClassification.o

recursived: advancedClassificationRecursion.o basicClassification.o
	$(CC) -shared -o libclassrec.so advancedClassificationRecursion.o basicClassification.o

loopd: advancedClassificationLoop.o basicClassification.o
	$(CC) -shared -o libclassloops.so advancedClassificationRecursion.o basicClassification.o

mains:

maindloop:

maindrec:


