# Mars Package Documentation

This directory contains generated documentation for the mars package.

## Reference Manual (PDF)

The package reference manual (`mars-manual.pdf`) is a comprehensive PDF containing documentation for all exported functions in the package.

### Generating the PDF

To regenerate the reference manual:

#### Prerequisites

You need a TeX distribution installed. On macOS:

```bash
# Install BasicTeX (smaller, recommended)
brew install --cask basictex

# OR install full MacTeX (larger but complete)
brew install --cask mactex
```

On Linux:
```bash
# Ubuntu/Debian
sudo apt-get install texlive-latex-base texlive-latex-extra

# Fedora
sudo dnf install texlive-scheme-basic
```

#### Generate the PDF

From the package root directory:

```bash
# Method 1: Using R CMD
R CMD Rd2pdf . --output=docs/mars-manual.pdf

# Method 2: Using devtools in R
R -e "devtools::build_manual(path = 'docs')"
```

The PDF will be created at `docs/mars-manual.pdf`.

### What's Included

The reference manual includes:
- Complete function documentation for all 51 exported functions
- Parameter descriptions with units
- Return value specifications
- Examples where provided
- References to NASA research papers

### CRAN Submission

Note: When submitting to CRAN, the PDF manual is generated automatically by CRAN's build system. You do not need to include this file in your CRAN submission.

## Other Documentation

- **Main README**: See the root `README.md` for installation instructions and usage examples
- **Inline Help**: Access function documentation in R using `?function_name` (e.g., `?G_h`)
- **Package Vignettes**: (None currently - consider adding for complex workflows)
