# Atmospheric optical depth on Mars

Calculates the optical depth of the Martian atmosphere as a function of
latitude and season. The optical depth varies spatially and temporally,
with peaks during global dust storms. Implements Equations 1 and 2 from
Appelbaum, Landis & Sherman (1991).

## Usage

``` r
optical_depth(Ls, phi, model = 1)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- model:

  Dust storm model (1 or 2). Model 1 assumes both storms originated at
  -30° latitude. Model 2 assumes storms at -30° (Ls=215°) and -10°
  (Ls=295°)

## Value

Atmospheric optical depth (dimensionless, minimum 0.5)

## Examples

``` r
# Calculate optical depth at Viking Lander 1 site during dust storm season
tau <- optical_depth(Ls = 215, phi = 22.3, model = 1)
```
