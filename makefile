CC=g++
CPPFLAGS=-I.
CXXFLAGS=-std=c++17 -O3
LDFLAGS=-g -lsqlite3

# Optional OpenMP support
ifeq ($(shell which g++-11 2>/dev/null),)
    # Use regular g++ without OpenMP
    CXXFLAGS += -DNO_OPENMP
else
    # Use g++-11 with OpenMP if available
    CC=g++-11
    CXXFLAGS += -fopenmp
    LDFLAGS += -fopenmp
endif
DEPS = bigraph.h utility.h biclique.h
OBJ = bigraph.o utility.o biclique.o one-round-sampling.o

%.o: %.cpp $(DEPS)
	$(CC) $(CXXFLAGS) -c -o $@ $< $(CPPFLAGS)

biclique: $(OBJ)
	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS) 

testp3: test_p3_batch_with_ground_truth.cpp biclique.cpp bigraph.cpp utility.cpp
	$(CC) -std=c++17 -O3 -fopenmp -I. -o test_p3_batch_with_ground_truth test_p3_batch_with_ground_truth.cpp biclique.cpp bigraph.cpp utility.cpp -lsqlite3

clean:
	-rm -f biclique test_p3_batch_with_ground_truth *.o
