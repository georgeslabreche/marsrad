# Beam daily insolation on Mars horizontal surface

Calculates the direct beam solar energy received over a full Martian day
on a horizontal surface. Obtained by integrating beam irradiance from
sunrise to sunset.

## Usage

``` r
H_bh(Ls, phi, tau)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- tau:

  Atmospheric optical depth (dimensionless)

## Value

Beam daily insolation \[Wh/m²-day\]
