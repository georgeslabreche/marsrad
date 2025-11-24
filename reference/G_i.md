# Global irradiance on Mars inclined surface

Calculates the total solar irradiance (direct beam + diffuse +
albedo-reflected) incident on an inclined surface on Mars. Implements
Equation 3 from Appelbaum, Flood & Norambuena (1994).

## Usage

``` r
G_i(
  Ls,
  phi,
  longitude,
  Ts,
  z = Z(Ls = Ls, phi = phi, Ts = Ts),
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

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Global irradiance on inclined surface \[W/m²\]
