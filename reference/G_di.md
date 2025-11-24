# Diffuse irradiance on Mars inclined surface

Calculates the diffuse solar irradiance (scattered by atmospheric dust)
incident on an inclined surface on Mars. Accounts for the view factor of
the sky from the tilted surface.

## Usage

``` r
G_di(
  Ls,
  phi,
  longitude,
  Ts,
  z = Z(Ls = Ls, phi = phi, Ts = Ts),
  tau,
  al = albedo(latitude = phi, longitude = longitude, tau = tau),
  beta
)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- longitude:

  Planetary longitude \[deg\]

- Ts:

  Solar time \[h\]

- z:

  Sun zenith angle \[deg\]. If not provided, calculated from Ls, phi,
  and Ts

- tau:

  Atmospheric optical depth (dimensionless)

- al:

  Surface albedo (dimensionless, 0-1). If not provided, calculated from
  latitude, longitude, and tau

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

## Value

Diffuse irradiance on inclined surface \[W/m²\]
