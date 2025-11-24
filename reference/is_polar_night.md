# Check if location is experiencing polar night

Determines whether a given location on Mars is experiencing polar night
(24-hour darkness) for the specified season. During polar night, the sun
remains below the horizon continuously.

## Usage

``` r
is_polar_night(Ls, phi)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

- phi:

  Planetary latitude \[deg\]

## Value

TRUE if experiencing polar night, FALSE otherwise
