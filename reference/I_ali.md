# Albedo-reflected insolation on Mars inclined surface over time period

Calculates the ground-reflected solar energy received on an inclined
surface between specified start and end times. Obtained by integrating
albedo-reflected irradiance over the time period.

## Usage

``` r
I_ali(
  Ls,
  phi,
  longitude,
  tau,
  Ts_start,
  Ts_end,
  al = albedo(latitude = phi, longitude = longitude, tau = tau),
  beta,
  gamma_c
)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- longitude:

  Planetary longitude \[deg\]

- tau:

  Atmospheric optical depth (dimensionless)

- Ts_start:

  Start of integration period \[h\]

- Ts_end:

  End of integration period \[h\]

- al:

  Surface albedo (dimensionless, 0-1). If not provided, calculated from
  latitude, longitude, and tau

- beta:

  Surface tilt/slope angle from horizontal \[deg\]

- gamma_c:

  Surface azimuth angle \[deg\]. Zero facing equator, east negative,
  west positive (-180 to +180)

## Value

Albedo-reflected insolation on inclined surface over specified time
period \[Wh/m²\]
