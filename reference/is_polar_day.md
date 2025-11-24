# Check if location is experiencing polar day

Determines whether a given location on Mars is experiencing polar day
(24-hour sunlight) for the specified season. During polar day, the sun
remains above the horizon continuously.

## Usage

``` r
is_polar_day(Ls, phi)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

## Value

TRUE if experiencing polar day, FALSE otherwise
