# Beam irradiance at top of Martian atmosphere

Calculates the solar beam irradiance at the top of the Martian
atmosphere (before any atmospheric effects) as a function of Mars'
orbital position. Accounts for Mars' elliptical orbit which causes
seasonal variation in solar intensity. Implements Equation 4 from
Appelbaum & Flood (1990).

## Usage

``` r
G_ob(Ls)
```

## Arguments

- Ls:

  Areocentric longitude \[deg\]

## Value

Beam irradiance at top of atmosphere \[W/m²\]
