# Optimal tilt angle for maximum daily insolation

Calculates the optimal surface tilt angle (beta) that maximizes daily
solar energy collection for a given location and season on Mars. The
surface is assumed to face the equator. Based on Equations 40 and 43
from Appelbaum (1993).

## Usage

``` r
optimal_angle(Ls, phi, unit = 1)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- unit:

  Output unit: 1 for radians, 2 for degrees (default: 1)

## Value

Optimal tilt angle \[rad\] or \[deg\] depending on unit parameter
