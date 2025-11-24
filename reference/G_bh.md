# Direct beam irradiance on Mars horizontal surface

Calculates the direct beam solar irradiance incident on a horizontal
surface on Mars. Accounts for the angle of incidence on the horizontal
plane. Implements Equation 18 from Appelbaum & Flood (1990).

## Usage

``` r
G_bh(Ls, phi, Ts, z = Z(Ls = Ls, phi = phi, Ts = Ts), tau)
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

## Value

Direct beam irradiance on horizontal surface \[W/m²\]
