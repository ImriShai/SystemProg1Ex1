CC=gcc
AR=ar
MAIN=main.o
FLAGS= -Wall -g
HEADER = NumClass.h


all: mains loops recursives recursived loopd maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec

.PHONY: clean all mains loops recursives recursived loopd maindloop maindrec

loops: libclassloops.a

libclassloops.a: advancedClassificationLoop.o basicClassification.o $(HEADER)
	$(AR) -rcs $@ $^

recursives: libclassrec.a

libclassrec.a: advancedClassificationRecursion.o basicClassification.o $(HEADER)
	$(AR) -rcs $@ $^

recursived: libclassrec.so

libclassrec.so: advancedClassificationRecursion.o basicClassification.o $(HEADER)
	$(CC) -shared -o $@ $^

loopd: libclassloops.so

libclassloops.so: advancedClassificationLoop.o basicClassification.o $(HEADER)
	$(CC) -shared -o $@ $^

mains: $(MAIN) libclassrec.a
	$(CC) $(FLAGS) -o $@ $^

maindloop: $(MAIN) libclassloops.so
	$(CC) $(FLAGS) -o $@ $(MAIN) ./libclassloops.so

maindrec: $(MAIN) libclassrec.so
	$(CC) $(FLAGS) -o $@ $(MAIN) ./libclassrec.so