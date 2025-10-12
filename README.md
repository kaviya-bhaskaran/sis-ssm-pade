# Reproducible Code — SIS on ER with SSM-Based Reduction (Spectral Submanifolds) and Taylor → Padé

This repository accompanies a PNAS submission and contains three files enabling reproducible demonstrations of SIS dynamics on Erdős–Rényi (ER) networks with **Spectral Submanifold (SSM)–based reduction** and Taylor → Padé approximation.

---

## 📂 Files included

- **`Taylor_to_pade_SIS_ER.ipynb`** (Python, Jupyter)  
  - Loads `SIS_er.mat`.  
  - Extracts **Taylor-series coefficients** (`W0`, `R0`) for reduced SIS dynamics.  
  - Constructs **Padé approximants** of the RHS.  
  - Compares Taylor truncations vs. Padé approximants.

- **`SIS_demo.mlx`** (MATLAB Live Script)  
  - Loads the same `SIS_er.mat`.  
  - Applies **Spectral Submanifold (SSMTool)–based reduction**.  
  - Simulates full vs. reduced SIS dynamics.  
  - Computes and plots **error metrics**.

- **`SIS_er.mat`** (MAT-file)  
  - `A`: 200×200 adjacency matrix (ER network).  
  - `W0`, `R0`: 1×20 struct arrays with Taylor coefficients (`coeffs`, `ind`).  
  - `beta`, `mu`, `q0`: scalar parameters.  
  - `tRef`: 1001×1 reference time grid.  
  - `zRef`: 1001×200 reference trajectories.  
  - `z0_full`: 200×1 initial state.
---

### 🌐 Extended Models
This repository also includes additional networked dynamical systems analyzed in the manuscript:

- **`GLV_er_ts.mlx`** – Generalized Lotka–Volterra dynamics on an ER network.  
- **`GRN_er_ts.mlx`** – Gene regulatory (activation–repression) dynamics.  
- **`LWD_er_ts.mlx`** – Logistic–diffusive oscillator network.

Each Live Script follows the same structure —  
**full simulation → SSM reduction → time-series visualization** —  
and can be adapted to other topologies (e.g., Scale-Free, Small-World) simply by replacing the adjacency matrix `A`.

## ⚙️ Requirements

### Python (for `Taylor_to_pade_SIS_ER.ipynb`)
- Python ≥ 3.10  
- Packages: `numpy`, `scipy`, `sympy`, `matplotlib`, `jupyter`

Install:
```bash
python -m pip install --upgrade pip
pip install numpy scipy sympy matplotlib jupyter
```

### MATLAB (for `SIS_demo.mlx`)
- MATLAB R2021b or newer (R2022b+ recommended).  
- **SSMTool 2.x** (Spectral Submanifolds Toolbox) must be installed and added to the MATLAB path.  

**Minimal setup example:**
```matlab
% Adjust <path-to-SSMTool> to where SSMTool is located
addpath(genpath('<path-to-SSMTool>'));
savepath;  % optional, persist path
```

---

## 📖 How to run

### Python notebook
1. Start Jupyter:
   ```bash
   jupyter notebook
   ```
2. Open `Taylor_to_pade_SIS_ER.ipynb`.  
3. Ensure `SIS_er.mat` is in the same folder.  
4. Run cells top-to-bottom.  

**Outputs:** coefficient prints and plots comparing Taylor vs. Padé RHS.

---

### MATLAB Live Script
1. Open MATLAB and set current folder to this repo.  
2. Ensure `SIS_er.mat` is in the same folder as `SIS_demo.mlx`.  
3. Open `SIS_demo.mlx`.  
4. Click **Run All**.  

**Outputs:** trajectory plots, error analysis plots, and printed error metrics.

---

## 🧭 Notes for readers/reviewers
- Both workflows rely on the same dataset for consistency.  
- Notebook = **Taylor → Padé demonstration**.  
- Live Script = **SSM-based reduction and error analysis**.  
- Parameters (`beta`, `mu`, `q0`) are shared via `SIS_er.mat`.  

---

## 📚 Citation

Please cite the PNAS article once available. If you reuse the reduction methodology, also cite **SSMTool**:

- Ponsioen, S., Jain, S., & Haller, G. (2018). *SSMtool: Automated computation of spectral submanifolds and reduced dynamics in nonlinear mechanical systems.* (Technical report / preprint).  
- Haller Group. *SSMTool 2.x: Computation of invariant manifolds in high-dimensional mechanics problems.* Zenodo. https://doi.org/10.5281/zenodo.4614202  

---

## 📜 License
Provided for academic reproducibility. A permissive license such as MIT or BSD-3-Clause is recommended (unless restricted by journal policy).
