# Beam insolation at top of Mars atmosphere over time period

Calculates the solar beam energy on a horizontal surface at the top of
the Martian atmosphere (before atmospheric attenuation) between
specified start and end times. Implements Equation 11 from Appelbaum &
Flood (1990).

## Usage

``` r
I_obh(Ls, phi, Ts_start, Ts_end)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- Ts_start:

  Start of integration period \[h\]

- Ts_end:

  End of integration period \[h\]

## Value

Beam insolation at top of atmosphere over specified time period
\[Wh/m²\]
