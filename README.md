[![R-CMD-check](https://github.com/georgeslabreche/mars/workflows/R-CMD-check/badge.svg)](https://github.com/georgeslabreche/mars/actions)

# Mars Solar Radiation

## Overview

An R package to calculate solar irradiance (instantaneous power) and insolation (energy over time) on the Martian surface for both horizontal and inclined surfaces. This package is essential in designing solar power systems for Mars missions and mission planning. Based on NASA Technical Memorandums 102299, 103623, 105216, 106321, and 106700, i.e. the canonical Mars solar radiation papers.

## Citation

If you use this package in your research or publication, please cite the paper it was developed for:

**Labrèche, Georges and Cordes, Florian.** "[Using a Rover's Active Suspension System as a 2-Axis Solar Tracker Mechanism](https://www.hou.usra.edu/meetings/isairas2020fullpapers/pdf/5035.pdf)." *15th International Symposium on Artificial Intelligence, Robotics and Automation in Space (i-SAIRAS '20)*, October 2020.

### BibTeX

```bibtex
@inproceedings{labreche2020rover,
  title={Using a Rover's Active Suspension System as a 2-Axis Solar Tracker Mechanism},
  author={Labr{\`e}che, Georges and Cordes, Florian},
  booktitle={15th International Symposium on Artificial Intelligence, Robotics and Automation in Space (i-SAIRAS '20)},
  month={October},
  year={2020},
  url={https://www.hou.usra.edu/meetings/isairas2020fullpapers/pdf/5035.pdf}
}
```

## Key Features

- Calculate solar radiation on horizontal and inclined surfaces
- Account for Martian atmospheric conditions including dust opacity
- Support for various surface orientations and slope angles
- Handle polar day/night conditions
- Compute optimal tilt angles for photovoltaic arrays
- Calculate sunrise/sunset times on Mars

## What's Included

The package implements equations for:

- **Global irradiance** - total solar radiation (direct + diffuse + reflected)
- **Direct beam radiation** - sunlight arriving directly from the sun
- **Diffuse radiation** - light scattered by atmospheric dust
- **Albedo reflection** - ground-reflected radiation
- **Insolation** - integrated solar energy over time
- **Utility functions** - sunrise/sunset, optimal angles, polar day/night detection

For a complete list of all functions with descriptions, see [FUNCTIONS.md](docs/FUNCTIONS.md).

## Parameters

Calculate and plot solar radiation on Mars as a function of the following parameters:
- Areocentric Longitude (Ls)
- Planetary Latitude (phi)
- Solar Time (omega)
- Atmospheric Opacity (tau)
- Albedo (al)
- Slope Angle (beta)
- Slope Orientation (gamma)

## Getting Started

### Installation

Install the package from GitHub using devtools:

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install the mars package
devtools::install_github("georgeslabreche/mars")
```

### Basic Usage

```r
library(mars)

# Calculate global irradiance on a horizontal surface
# Example: Mars surface at Viking Lander 1 site during northern summer
Ls <- 120           # Areocentric longitude (degrees)
phi <- 22.3         # Latitude (degrees) - VL1 location
longitude <- 0      # Longitude (degrees)
Ts <- 12            # Solar time (hours) - noon
tau <- 0.4          # Atmospheric optical depth
al <- 0.1           # Albedo

# Global irradiance on horizontal surface (W/m²)
Gh <- G_h(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts, tau = tau, al = al)
print(paste("Global irradiance:", round(Gh, 2), "W/m²"))

# Daily insolation on horizontal surface (Wh/m²-day)
Hh <- H_h(Ls = Ls, phi = phi, tau = tau, al = al)
print(paste("Daily insolation:", round(Hh, 2), "Wh/m²-day"))

# Calculate for an inclined surface (e.g., tilted solar panel)
beta <- 30          # Tilt angle (degrees)
gamma_c <- 0        # Surface azimuth angle (degrees, 0 = facing equator)

# Global irradiance on inclined surface (W/m²)
Gi <- G_i(Ls = Ls, phi = phi, longitude = longitude, Ts = Ts,
          tau = tau, al = al, beta = beta, gamma_c = gamma_c)
print(paste("Inclined surface irradiance:", round(Gi, 2), "W/m²"))

# Find optimal tilt angle for maximum daily insolation
optimal <- optimal_angle(Ls = Ls, phi = phi, tau = tau, al = al)
print(paste("Optimal tilt angle:", round(optimal, 2), "degrees"))

# Calculate sunrise and sunset times
sunrise_time <- sunrise(Ls = Ls, phi = phi)
sunset_time <- sunset(Ls = Ls, phi = phi)
print(paste("Sunrise:", round(sunrise_time, 2), "hours"))
print(paste("Sunset:", round(sunset_time, 2), "hours"))
```

## Environment Variables

The package can be configured via environment variables to control calculation methods and behavior:

### NET_FLUX_FUNCTION_TYPE

Controls which implementation of the normalized net flux function to use. Affects all radiation calculations.

**Options:**

- `"polynomial"` (default) - Analytical polynomial expression
  - Mean error: ~0.7%
  - Maximum error: ~7% at zenith angles 80-85° and optical depth > 5
  - Works with any albedo value
  - Recommended for most use cases
- `"lookup_v1"` - Lookup table from NASA TM-102299 (Appelbaum & Flood, 1989)
  - Albedo fixed at 0.1
  - Exact values from original tables
- `"lookup_v2"` - Lookup table from NASA TM-103623 (Appelbaum & Flood, 1990)
  - Supports albedo 0.1 and 0.4
  - Exact values from updated tables

**Usage:**
```r
# Use polynomial implementation (default)
Sys.setenv(NET_FLUX_FUNCTION_TYPE = "polynomial")

# Use lookup table v2
Sys.setenv(NET_FLUX_FUNCTION_TYPE = "lookup_v2")
```

### NET_FLUX_FUNCTION_SHOW_WARNINGS

Controls whether to display warnings about potential calculation errors.

**Options:**

- `TRUE` (default) - Show warnings when polynomial calculations may have notable error margin
- `FALSE` - Suppress warnings

Warnings are shown when:

- Optical depth tau > 5
- Zenith angle z >= 80°

**Usage:**

```r
# Show warnings (default)
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = TRUE)

# Suppress warnings
Sys.setenv(NET_FLUX_FUNCTION_SHOW_WARNINGS = FALSE)
```

## Development

### Running Tests

To run the package tests during development:
```r
# Install devtools if you haven't already
install.packages("devtools")

# Option 1: Run tests only (faster for quick testing)
devtools::test()

# Option 2: Run a full package check (includes tests, documentation, examples)
devtools::check()
```

**`devtools::test()`** is recommended for quick iteration during development - it loads your package and runs all tests without requiring installation.

**`devtools::check()`** performs a comprehensive package check including tests, documentation, examples, and package structure validation - use this before submitting to CRAN or creating releases.

### Generating Documentation

#### Generating man/ Files

The `man/` directory contains R documentation files (.Rd) generated from roxygen2 comments in the source code. To regenerate these files after modifying function documentation:

```r
# Install roxygen2
install.packages("roxygen2")

# Generate documentation
roxygen2::roxygenize()
```

This updates all `.Rd` files in the `man/` directory based on the `#'` roxygen2 comments in R source files.

#### Generating PDF Reference Manual

The package reference manual is a comprehensive PDF containing documentation for all exported functions.

For Apple Silicon Macs (M1/M2/M3):
```bash
# Build the Docker image (first time only, from repository root)
docker build --platform linux/amd64 -t mars-docs -f Dockerfile-docs .

# Generate the PDF
docker run --rm --platform linux/amd64 -v $(pwd)/docs:/output mars-docs
```

For Intel Macs and Linux:
```bash
# Build the Docker image (first time only, from repository root)
docker build -t mars-docs -f Dockerfile-docs .

# Generate the PDF
docker run --rm -v $(pwd)/docs:/output mars-docs
```

The PDF will be created at `docs/mars-manual.pdf`.

## References

Based on the following excellent work:

- [Appelbaum, Joseph & Flood, Dennis. (1989). Solar Radiation on Mars. NASA TM-102299.](https://ntrs.nasa.gov/citations/19890018252) Detailed information on solar radiation characteristics on Mars are necessary for effective design of future planned solar energy systems operating on the surface of Mars. In this paper we present a procedure and solar radiation related data from which the diurnally, hourly and daily variation of the global, direct beam and diffuse insolation on Mars are calculated. The radiation data are based on measured optical depth of the Martian atmosphere derived from images taken of the sun with a special diode on the Viking cameras; and computation based on multiple wavelength and multiple scattering of the solar radiation.

- [Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars: Update 1990. NASA TM-103623.](https://ntrs.nasa.gov/citations/19910005804) Detailed information on solar radiation characteristics on Mars are necessary for effective design of future planned solar energy systems operating on the surface of Mars. The authors present a procedure and solar radiation related data from which the diurnally and daily variation of the global, direct beam and diffuse insolation on Mars are calculated. The radiation data are based on measured optical depth of the Martian atmosphere derived from images taken of the Sun with a special diode on the Viking Lander cameras and computation based on multiple wavelength and multiple scattering of the solar radiation. This work is an update to NASA-TM-102299 and includes a refinement of the solar radiation model.

- [Appelbaum, Joseph & Flood, Dennis. (1991). Solar radiation on Mars: Update 1991. NASA TM-105216.](https://ntrs.nasa.gov/citations/19910023732) Detailed information on solar radiation characteristics on Mars are necessary for effective design of future planned solar energy systems operating on the surface of Mars. In this paper we present a procedure and solar radiation related data from which the daily variation of the global, direct beam, and diffuse insolation on Mars are calculated. Given the optical depth of the Mars atmosphere, the global radiation is calculated from the normalized net flux function based on multiple wavelength and multiple scattering of the solar radiation. The direct beam was derived from the optical depth using Beer's law, and the diffuse component was obtained from the difference of the global and the direct beam radiation. The optical depths of the Mars atmosphere were derived from images taken of the Sun with a special diode on the cameras used on the two Viking Landers.

- [Appelbaum, Joseph & Sherman, Irving & Landis, Geoffrey. (1993). Solar radiation on Mars: Stationary photovoltaic array. NASA TM-106321.](https://ntrs.nasa.gov/citations/19940010257) Solar energy is likely to be an important power source for surface-based operation on Mars. Photovoltaic cells offer many advantages. In this article we have presented analytical expressions and solar radiation data for stationary flat surfaces (horizontal and inclined) as a function of latitude, season and atmospheric dust load (optical depth). The diffuse component of the solar radiation on Mars can be significant, thus greatly affecting the optimal inclination angle of the photovoltaic surface.

- [Appelbaum, Joseph & Flood, Dennis & Norambuena, Marcos. (1994). Solar radiation on Mars: Tracking photovoltaic array. NASA TM-106700.](https://ntrs.nasa.gov/citations/19950004977) A photovoltaic power source for surface-based operation on Mars can offer many advantages. Detailed information on solar radiation characteristics on Mars and the insolation on various types of collector surfaces are necessary for effective design of future planned photovoltaic systems. In this article we have presented analytical expressions for solar radiation calculation and solar radiation data for single axis (of various types) and two axis tracking surfaces and compared the insulation to horizontal and inclined surfaces. For clear skies (low atmospheric dust load) tracking surfaces resulted in higher insolation than stationary surfaces, whereas for highly dusty atmospheres, the difference is small. The insolation on the different types of stationary and tracking surfaces depend on latitude, season and optical depth of the atmosphere, and the duration of system operation. These insolations have to be compared for each mission.
