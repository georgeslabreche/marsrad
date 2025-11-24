# Direct beam irradiance on Mars inclined surface

Calculates the direct beam solar irradiance incident on an inclined
surface on Mars. Accounts for the sun's angle of incidence on the tilted
and oriented surface. Based on Appelbaum, Flood & Norambuena (1994).

## Usage

``` r
G_bi(Ls, phi, Ts, z = Z(Ls = Ls, phi = phi, Ts = Ts), tau, beta, gamma_c)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- Ts:

  Solar time \[h\]

- z:

  Sun zenith angle \[deg\]. If not provided, calculated from Ls, phi,
  and Ts

- tau:

  Atmospheric optical depth (dimensionless)

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Direct beam irradiance on inclined surface \[W/m²\]
