# Biclique Counting under Edge Local Differential Privacy

This repository contains the implementation of algorithms for counting (p,q)-bicliques in bipartite graphs under edge local differential privacy (edge LDP).

## Files

- `bigraph.cpp` / `bigraph.h` - Bipartite graph data structure and utilities
- `biclique.cpp` / `biclique.h` - Core biclique counting algorithms (MRCN, MRCN+, MRCN++)
- `utility.cpp` / `utility.h` - Utility functions for data processing
- `one-round-sampling.cpp` - One-round sampling algorithm implementation
- `makefile` - Build configuration
- `include/` - Header files for dependencies

## Dependencies

- C++17 compiler (g++)
- OpenMP
- SQLite3
- Standard C++ libraries

## Compilation

```bash
make biclique
```

This will create the main executable `biclique`.

## Usage

The main executable supports various command-line options for running different algorithms:

```bash
./biclique [options]
```

### Algorithm Options
- `--naive` - Run naive algorithm
- `--oner` - Run OneR algorithm  
- `--adv` - Run MRCN algorithm
- `--advplus` - Run MRCN+ algorithm
- `--advplusplus` - Run MRCN++ algorithm

### Privacy Parameters
- `--eps0` - Privacy budget for degree estimation (default: 0.2)
- `--eps1` - Privacy budget for noisy graph construction (default: 0.4)  
- `--eps2` - Privacy budget for common neighbor estimation (default: 0.4)

### Graph Parameters
- `--p` - Number of upper vertices in biclique (default: 2)
- `--q` - Number of lower vertices in biclique (default: 2)
- `--input` - Input graph file path

### Example Commands

```bash
# Run MRCN++ algorithm on a graph file
./biclique --advplusplus --p 2 --q 3 --eps0 0.2 --eps1 0.4 --eps2 0.4 --input graph.txt

# Run OneR algorithm with different privacy budget
./biclique --oner --p 2 --q 2 --eps1 0.6 --input graph.txt

# Run naive baseline
./biclique --naive --p 2 --q 3 --eps1 0.6 --input graph.txt
```

## Input Format

The input graph should be in edge list format:
```
u1 v1
u2 v2
...
```
Where each line represents an edge between upper vertex `ui` and lower vertex `vi`.

## Output

The program outputs:
- Estimated (p,q)-biclique count
- Mean relative error (if ground truth is available)
- Running time
- Privacy budget allocation

## Testing

To run tests with ground truth comparison:

```bash
make testp3
./test_p3_batch_with_ground_truth
```

## Cleanup

```bash
make clean
```
