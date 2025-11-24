# The albedo function.

Calculate the albedo value given geographical location and tau factor.
Source: Appelbaum, Joseph & Landis, Geoffrey & Sherman, I. (1991). Solar
radiation on Mars — Update 1991.

## Usage

``` r
albedo(latitude, longitude, tau, coordinates_rounding = TRUE)
```

## Arguments

- latitude:

  Planetary latitude \[deg\], from -90° to +90°

- longitude:

  Planetary longitude \[deg\], from -180° to 180°

- tau:

  Atmospheric optical depth (dimensionless)

- coordinates_rounding:

  Logical, whether to round coordinates to nearest grid point

## Value

Surface albedo value (dimensionless, 0-1)
