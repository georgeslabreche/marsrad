# Diffuse daily insolation on Mars inclined surface

Calculates the diffuse solar energy (scattered by atmospheric dust)
received over a full Martian day on an inclined surface. Obtained by
integrating diffuse irradiance from sunrise to sunset.

## Usage

``` r
H_di(
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

Diffuse daily insolation on inclined surface \[Wh/m²-day\]
