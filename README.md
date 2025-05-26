# Politecnico di Milano - Graph Optimmization - 2025
This repository contains the files and resources for an optimization project involving model formulation and solving graph-based problems using AMPL.

---

## 📁 Project Structure

```
graph-optimization-lab-project/
│
├── assignment_files/             # Provided input data for the assignment
│   ├── q1-instances/             
│   └── q4-instances/             
│
├── out/                          # Output folder for generated files
│   └── report.pdf                
│
├── report/                       
│   └── report.tex                
│
├── src/
│   ├── question_1
│   │    ├── q1-model.mod          
│   │    └── q1-run.run       
│   └── ...
│          
├── questions.pdf                 # Assignment prompt
└── README.md                     
```

---

## How to Run the Model

To run the AMPL model for Question 1:

1. Make sure AMPL is installed and accessible from the command line.
2. Launch AMPL in the `src/question_X/` directory:
   ```bash
   ampl qX-run.run
   ```
3. The script will read `qX-model.mod` and apply it to provided instances.

---

## Dependencies

- [AMPL](https://ampl.com/) — Modeling language for mathematical programming
- [LaTeX](https://www.latex-project.org/) — Used to generate the report

---


## License

This project is part of an academic assignment. Not intended for commercial use.
