# Diffuse irradiance on Mars horizontal surface

Calculates the diffuse solar irradiance (scattered by atmospheric dust)
incident on a horizontal surface on Mars. Computed as the difference
between global and direct beam irradiance. Implements Equation 16 from
Appelbaum & Flood (1990).

## Usage

``` r
G_dh(
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

  Solar time \[h\]. Can be NULL for daily calculations

- z:

  Sun zenith angle \[deg\]. If not provided, calculated from Ls, phi,
  and Ts

- tau:

  Atmospheric optical depth (dimensionless)

- al:

  Surface albedo (dimensionless, 0-1). If not provided, calculated from
  latitude, longitude, and tau

## Value

Diffuse irradiance on horizontal surface \[W/m²\]
