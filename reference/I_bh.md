# Beam insolation on Mars horizontal surface over time period

Calculates the direct beam solar energy received on a horizontal surface
between specified start and end times. Implements Equation 19 from
Appelbaum & Flood (1990).

## Usage

``` r
I_bh(Ls, phi, tau, Ts_start, Ts_end)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- tau:

  Atmospheric optical depth (dimensionless)

- Ts_start:

  Start of integration period \[h\]

- Ts_end:

  End of integration period \[h\]

## Value

Beam insolation over specified time period \[Wh/m²\]
