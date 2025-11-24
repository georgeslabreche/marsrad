# Albedo-reflected irradiance on Mars inclined surface

Calculates the solar irradiance reflected from the Martian surface
(ground-reflected radiation) incident on an inclined surface. Accounts
for the view factor of the ground from the tilted surface.

## Usage

``` r
G_ali(
  Ls,
  phi,
  longitude,
  Ts,
  z = Z(Ls = Ls, Ts = Ts, phi = phi),
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

Albedo-reflected irradiance on inclined surface \[W/m²\]
