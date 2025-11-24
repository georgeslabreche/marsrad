# Global daily insolation on Mars inclined surface

Calculates the total solar energy received over a full Martian day on an
inclined surface. Obtained by integrating global hourly insolation from
sunrise to sunset. Based on Appelbaum, Flood & Norambuena (1994).

## Usage

``` r
H_i(
  Ls,
  phi,
  longitude,
  tau,
  al = albedo(latitude = phi, longitude = longitude, tau = tau),
  beta,
  gamma_c
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

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Global daily insolation on inclined surface \[Wh/m²-day\]
