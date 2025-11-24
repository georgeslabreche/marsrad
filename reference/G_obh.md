# Beam irradiance on horizontal surface at top of Mars atmosphere

Calculates the solar beam irradiance on a horizontal surface at the top
of the Martian atmosphere (before atmospheric attenuation). Implements
Equation 5 from Appelbaum & Flood (1990).

## Usage

``` r
G_obh(Ls, phi = NULL, Ts = NULL, z = Z(Ls = Ls, phi = phi, Ts = Ts))
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]. Can be NULL if z is provided

- Ts:

  Solar time \[h\]. Can be NULL if z is provided

- z:

  Sun zenith angle \[deg\]. If not provided, calculated from Ls, phi,
  and Ts

## Value

Beam irradiance at top of atmosphere \[W/m²\]
