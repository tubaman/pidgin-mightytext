CC=gcc
LDFLAGS=
CFLAGS=-Wall `pkg-config --cflags json-glib-1.0 glib-2.0 purple`

NAME=libmightytext
SRC=$(NAME).c
OBJ=$(NAME).o
SONAME=$(NAME).so.1
LIB=$(SONAME).0.1

default: lib

lib: $(LIB)

$(OBJ): $(SRC) 
	$(CC) -c -fPIC $(CFLAGS) -o $@ $^

$(LIB): $(OBJ)
	$(CC) -shared -Wl,-soname,$(SONAME) $(LDFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) $(LIB) $(OBJ)
