CC=gcc
AR=ar
MAIN=main.o
FLAGS= -Wall -g
HEADER = NumClass.h
BASIC = basicClassification.o
ADVANCEDLOOP = advancedClassificationLoop.o
ADVANCEDREC = advancedClassificationRecursion.o


all: mains loops recursives recursived loopd maindloop maindrec

clean:
	rm -f *.o *.a *.so mains maindloop maindrec

.PHONY: clean all mains loops recursives recursived loopd maindloop maindrec

loops: libclassloops.a

libclassloops.a: $(ADVANCEDLOOP) $(BASIC)
	$(AR) rcs $@ $^

recursives: libclassrec.a

libclassrec.a: $(ADVANCEDREC) $(BASIC) 
	$(AR) rcs $@ $^

recursived: libclassrec.so

libclassrec.so: $(ADVANCEDREC) $(BASIC) 
	$(CC) -shared -Wall -o $@ $^

loopd: libclassloops.so

libclassloops.so: $(ADVANCEDLOOP) $(BASIC)
	$(CC) -shared -Wall  -o $@ $^ 

mains: $(MAIN) libclassrec.a
	$(CC) $(FLAGS) -o $@ $< ./libclassrec.a

maindloop: $(MAIN) libclassloops.so
	$(CC) $(FLAGS) $< ./libclassloops.so -o $@

maindrec: $(MAIN) libclassrec.so
	$(CC) $(FLAGS) $< -o $@ $(MAIN) ./libclassrec.so 

$(ADVANCEDREC): $(ADVANCEDREC:.o=.c) $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -fPIC

$(ADVANCEDLOOP): $(ADVANCEDLOOP:.o=.c) $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -fPIC

$(BASIC): $(BASIC:.o=.c) $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -fPIC

$(MAIN): $(MAIN:.o=.c) $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@