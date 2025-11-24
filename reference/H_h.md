# Global daily insolation on Mars horizontal surface

Calculates the total solar energy received over a full Martian day on a
horizontal surface. Obtained by integrating global hourly insolation
from sunrise to sunset.

## Usage

``` r
H_h(
  Ls,
  phi,
  longitude,
  tau,
  al = albedo(latitude = phi, longitude = longitude, tau = tau)
)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- longitude:

  Planetary longitude \[deg\]

- tau:

  Atmospheric optical depth (dimensionless)

- al:

  Surface albedo (dimensionless, 0-1). If not provided, calculated from
  latitude, longitude, and tau

## Value

Global daily insolation \[Wh/m²-day\]
