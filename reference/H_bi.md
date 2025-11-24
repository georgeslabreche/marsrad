# Beam daily insolation on Mars inclined surface

Calculates the direct beam solar energy received over a full Martian day
on an inclined surface. Obtained by integrating beam irradiance from
sunrise to sunset.

## Usage

``` r
H_bi(Ls, phi, tau, beta, gamma_c)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- tau:

  Atmospheric optical depth (dimensionless)

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Beam daily insolation on inclined surface \[Wh/m²-day\]
