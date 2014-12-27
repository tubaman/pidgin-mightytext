CC = gcc
CFLAGS = -g -O2 `pkg-config --cflags json-glib-1.0 purple`
LDFLAGS = `pkg-config --libs json-glib-1.0`

NAME = libmightytext
SRC = $(NAME).c
OBJ = $(NAME).o
LIB = $(NAME).so

default: lib

lib: $(LIB)

$(OBJ): $(SRC)
	$(CC) -c -fPIC $(CFLAGS) -o $@ $^

$(LIB): $(OBJ)
	$(CC) -shared $(LDFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) $(LIB) $(OBJ)
