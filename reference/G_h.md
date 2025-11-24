# Global irradiance on Mars horizontal surface

Calculates the total solar irradiance (direct beam + diffuse + albedo)
incident on a horizontal surface on Mars. Implements Equation 17 from
Appelbaum & Flood (1990).

## Usage

``` r
G_h(
  Ls,
  phi,
  longitude,
  Ts = NULL,
  z = Z(Ls = Ls, phi = phi, Ts = Ts),
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

## Value

Global irradiance \[W/m²\]
