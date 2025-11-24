# Solar declination angle on Mars

Calculates the angular position of the Sun at solar noon with respect to
the plane of the Martian equator. For Mars: -24.936° \<= delta \<=
24.936°. The declination is 0° at vernal (Ls=0°) and autumnal equinoxes
(Ls=180°), +24.936° at summer solstice (Ls=90°), and -24.936° at winter
solstice (Ls=270°). Implements Equation 7 from Appelbaum & Flood (1990).

## Usage

``` r
declination(Ls, unit = 1)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- unit:

  Output unit: 1 for radians, 2 for degrees (default: 1)

## Value

Declination angle \[rad\] or \[deg\] depending on unit parameter
