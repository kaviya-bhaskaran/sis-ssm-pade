# Reproducibility demonstrations for nonlinear network reduction

This repository contains selected Erdős–Rényi (ER) network reproducibility demonstrations associated with the accepted Physical Review E article "Nonlinear Model Reduction of Complex Networks via Spectral Submanifolds." It does not reproduce every figure or every analysis in the article.

## Files included

- `GLV_demo.mlx` — Generalized Lotka–Volterra dynamics on an ER network.
- `GRN_demo.mlx` — Gene regulatory dynamics on an ER network.
- `LWD_demo.mlx` — Logistic–diffusive dynamics on an ER network.
- `SIS_demo.mlx` — SIS dynamics, SSM-based reduction, full and reduced simulations, error metrics, and generation of `SIS_er.mat`.
- `SIS_er.mat` — SIS data and Taylor coefficients consumed by the Python notebook.
- `Taylor_to_pade_SIS_ER.ipynb` — Python demonstration using the Taylor coefficients in `SIS_er.mat` and SciPy's Padé approximation.
- `plot_analytical_domain.m` — Analytical-domain plotting helper used by the GLV and GRN Live Scripts.
- `CITATION.cff` — Proposed citation metadata for the software and related article.
- `LICENSE` — GNU General Public License version 3.
- `README.md` — Repository scope, requirements, and instructions.

The supplied `SIS_er.mat` contains:

- `A`: 200×200 ER adjacency matrix.
- `W0`, `R0`: 1×20 struct arrays with Taylor coefficients (`coeffs`, `ind`).
- `beta`, `mu`, `q0`: scalar parameters.
- `tRef`: 1001×1 reference time grid.
- `zRef`: 1001×200 reference trajectories.
- `z0_full`: 200×1 initial state.

## Requirements

### Python notebook

The notebook metadata records Python 3.9.6. Compatibility with other Python versions has not been established by the archived files.

The notebook directly imports:

- `numpy`
- `scipy`
- `sympy`
- `matplotlib`

Jupyter with an IPython kernel is required to run the notebook interactively. Exact package versions were not recorded in the notebook and are therefore not claimed here.

### MATLAB Live Scripts

The four `.mlx` files were saved with MATLAB R2025a. Compatibility with earlier MATLAB releases has not been tested.

The Live Scripts require:

- SSMTool. The exact version, tag, or commit used to create the saved outputs is not recorded in the repository.
- Tensor Toolbox, because the scripts call `sptensor`. The exact Tensor Toolbox version used is not recorded.

Install those dependencies and add them to the MATLAB path before running the Live Scripts. For example:

```matlab
addpath(genpath('<path-to-SSMTool>'));
addpath(genpath('<path-to-Tensor-Toolbox>'));
```

## How to run

### Generate the SIS data with MATLAB

1. Open MATLAB and set the current folder to the repository root.
2. Ensure SSMTool and Tensor Toolbox are available on the MATLAB path.
3. Open `SIS_demo.mlx` and select **Run All**.

**Important:** `SIS_demo.mlx` generates and saves `SIS_er.mat`. Running the Live Script regenerates and overwrites the repository's existing `SIS_er.mat`.

### Consume the SIS data with Python

1. Keep `Taylor_to_pade_SIS_ER.ipynb` and `SIS_er.mat` in the repository root.
2. Start Jupyter and open `Taylor_to_pade_SIS_ER.ipynb`.
3. Run the cells from top to bottom.

The notebook consumes `SIS_er.mat`; it does not generate that file.

### Other MATLAB demonstrations

Open `GLV_demo.mlx`, `GRN_demo.mlx`, or `LWD_demo.mlx` from the repository root and select **Run All** after the MATLAB dependencies have been configured.

## Citation

Please cite the associated article:

Kaviya Bhaskaran, Shobhit Jain, and Mingwu Li, "Nonlinear Model Reduction of Complex Networks via Spectral Submanifolds," *Physical Review E* (2026), https://doi.org/10.1103/gp7d-fsk5.

No repository DOI is listed because a Zenodo DOI has not yet been minted.

## License

This repository is distributed under the GNU General Public License version 3. See `LICENSE` for the complete license text.
