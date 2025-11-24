# Beam insolation on Mars inclined surface over time period

Calculates the direct beam solar energy received on an inclined surface
between specified start and end times. Obtained by integrating beam
irradiance over the time period.

## Usage

``` r
I_bi(Ls, phi, tau, Ts_start, Ts_end, beta, gamma_c)
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

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Beam insolation on inclined surface over specified time period \[Wh/m²\]
