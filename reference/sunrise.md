# Sunrise time on Mars

Calculates the sunrise time for a horizontal or inclined surface on
Mars. Returns NA during polar night/day periods.

## Usage

``` r
sunrise(Ls, phi, beta = NULL, gamma_c = NULL, unit = 1)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- beta:

  Surface tilt angle \[deg\]. Optional, for inclined surfaces

- gamma_c:

  Surface azimuth angle \[deg\]. Optional, for inclined surfaces. Zero
  facing equator, east negative, west positive (-180 to +180)

- unit:

  Output unit: 1 for radians, 2 for degrees, 3 for solar hours (default:
  1)

## Value

Sunrise time \[rad\], \[deg\], or \[h\] depending on unit parameter, or
NA during polar night/day
