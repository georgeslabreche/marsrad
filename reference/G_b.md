# Direct beam irradiance on Mars surface normal to solar rays

Calculates the direct beam solar irradiance on the Martian surface
normal to the solar rays (i.e., perpendicular to the sun's direction).
Uses Beer's law to account for atmospheric attenuation. Implements
Equation 14 from Appelbaum & Flood (1990).

## Usage

``` r
G_b(Ls, phi = NULL, Ts = NULL, z = Z(Ls = Ls, phi = phi, Ts = Ts), tau)
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

- tau:

  Atmospheric optical depth (dimensionless)

## Value

Direct beam irradiance normal to sun \[W/m²\]
