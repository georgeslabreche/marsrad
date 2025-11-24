# Check if surface is receiving solar irradiance

Determines whether a surface at a given location and time is receiving
solar irradiance. Accounts for polar night/day conditions,
sunrise/sunset times, and sun position below horizon.

## Usage

``` r
is_irradiated(Ls, phi, Ts, z = Z(Ls, Ts, phi), beta = NULL, gamma_c = NULL)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- Ts:

  Solar time \[h\]

- z:

  Sun zenith angle \[deg\]. If not provided, calculated from Ls, phi,
  and Ts

- beta:

  Surface tilt/slope angle from horizontal \[deg\]. Optional, for
  inclined surfaces

- gamma_c:

  Surface azimuth angle \[deg\]. Optional, for inclined surfaces

## Value

TRUE if surface is receiving irradiance, FALSE otherwise
