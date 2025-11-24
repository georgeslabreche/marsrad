# Solar zenith angle

Calculates the angle between the sun's rays and the vertical (zenith)
direction. A zenith angle of 0° means the sun is directly overhead,
while 90° means the sun is at the horizon. Implements Equation 6 from
Appelbaum & Flood (1990).

## Usage

``` r
Z(Ls, phi, Ts)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

- Ts:

  Solar time \[h\]

## Value

Sun zenith angle \[deg\]
