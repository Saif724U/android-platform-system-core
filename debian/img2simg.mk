NAME = img2simg
SOURCES = img2simg.c
SOURCES := $(foreach source, $(SOURCES), libsparse/$(source))
CFLAGS += -Ilibsparse/include -fpermissive
LDFLAGS += -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
           -Wl,-rpath-link=. \
           -lz -L. -lsparse

build: $(SOURCES)
	$(CXX) $^ -o libsparse/$(NAME) $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) libsparse/$(NAME)
