# draco_benchmark

This repository provides scripts and tools to benchmark Draco point cloud compression and related workflows.

## Project Structure
- `datasets/`: Contains sample point cloud files in PLY format.
- `dev/scripts/`: Bash scripts for running encoding and complete experiments.
- `docker_ws/`: Dockerfile and build scripts for Draco environment.
- `notebooks/`: Jupyter notebooks for benchmarking and analysis.
- `run_draco.sh`: Script to run Draco encoding/decoding.
- `run_jupyter.sh`: Script to launch Jupyter Lab for interactive analysis.

## Basic Usage

### Building the Docker Image

Build the Docker image for Draco:
```bash
cd docker_ws
./build_draco.sh
```

### 1. Running Draco Benchmark Container

```bash
./run_draco.sh
```

### 2. Running Experiments

Navigate to `dev/scripts/` and use the provided scripts:

- `encode_experiment.sh <input_file.ply>`: Runs encoding experiments.
- `complete_experiment.sh <input_file.ply>`: Runs the full experiment pipeline.

Replace `<input_file.ply>` with your point cloud file.


## Requirements
- Bash shell (Linux recommended)
- Docker (for containerized workflows)
- Python (for Jupyter notebooks)

## Notes
- Place your own PLY files in the `datasets/` directory for testing.
- Results and logs are saved in the respective subfolders under `notebooks/`.

For more details, refer to comments in the scripts and notebooks.
