ROOT_PATH = $$PWD

CC = g++

FLAGS = -Wall -Werror -g -O3
FLAGS += `pkg-config opencv --cflags`

LIBS = `pkg-config opencv --libs`

SRCS = $(ROOT_PATH)/main.cpp $(ROOT_PATH)/pdi.cpp 

PROG = pdi_exe

OBJ = main.o pdi.o

pdi:
	$(CC) $(FLAGS) $(SRCS) -c $(LIBS)

main:
	$(CC) $(FLAGS) $(SRCS) -c $(LIBS)

all: main.o pdi.o
	$(CC) $(FLAGS) $(OBJ) -o $(PROG) $(LIBS)

clean:
	rm $(PROG)
	rm *.o