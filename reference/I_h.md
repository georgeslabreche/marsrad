# Global insolation on Mars horizontal surface over time period

Calculates the total solar energy received on a horizontal surface
between specified start and end times. Obtained by integrating global
irradiance over the time period.

## Usage

``` r
I_h(
  Ls,
  phi,
  longitude,
  tau,
  Ts_start,
  Ts_end,
  al = albedo(latitude = phi, longitude = longitude, tau = tau)
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

## Value

Global insolation over specified time period \[Wh/m²\]
