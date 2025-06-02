## 📄 PubFinder Report to CSV Converter (R Script)

This script converts a structured text report (like those from **PubFinder**) into a clean, flat CSV file by extracting all fields that follow a `key: value` format.

### 🔧 What It Does

* Reads a `.txt` file containing publication entries.
* Finds all key-value pairs (e.g., `PubTitle: Some Title`).
* Groups them by record (using dashed line separators).
* Outputs a CSV with columns like `PubTitle`, `Year`, `Authors`, etc.

---

### 📁 Input File

Example input:
`2025_05_22__REAL_SEARCH_Results_PubFinder.txt`

Structure of each publication:

```
  ------------------------------
  PubTitle: Science Utilizing...
  Year: 2021
  Authors: ['A Author', 'B Author']
  URL: https://...
  Datasource: Scholarly (GS)
  Search String: NASA...
  Search Result Date: 2025_05_22__18_23_34
  ------------------------------
```

---

### 🧪 Requirements

* R 4.x+
* The following R packages:

  * `stringr`
  * `dplyr`
  * `readr`

Install with:

```r
install.packages(c("stringr", "dplyr", "readr"))
```

---

### ▶️ How to Run

1. Save the R script as `pubfinder_to_csv.R`.
2. Place your `.txt` file in the same folder.
3. In R or RStudio, run:

```r
source("pubfinder_to_csv.R")
```

4. Output will be saved as:
   `cleaned_search_results.csv`

---

### 📤 Output

A flat CSV with one row per publication and clean columns:

| PubTitle | Year | Authors | URL | Datasource | Search String | Search Result Date |
| -------- | ---- | ------- | --- | ---------- | ------------- | ------------------ |

---

### 📌 Notes

* Handles missing fields automatically.
* `Authors` and other list-like values are kept as stringified lists (you can split them in Excel or post-process in R/Python).


