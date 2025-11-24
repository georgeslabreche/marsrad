# Package index

## Package Documentation

- [`marsrad`](https://georgeslabreche.github.io/marsrad/reference/marsrad-package.md)
  [`marsrad-package`](https://georgeslabreche.github.io/marsrad/reference/marsrad-package.md)
  : marsrad: Mars Solar Radiation

## Instantaneous Irradiance (G\_\* functions)

Power per unit area at a specific moment

- [`G_h()`](https://georgeslabreche.github.io/marsrad/reference/G_h.md)
  : Global irradiance on Mars horizontal surface
- [`G_i()`](https://georgeslabreche.github.io/marsrad/reference/G_i.md)
  : Global irradiance on Mars inclined surface
- [`G_ob()`](https://georgeslabreche.github.io/marsrad/reference/G_ob.md)
  : Beam irradiance at top of Martian atmosphere
- [`G_obh()`](https://georgeslabreche.github.io/marsrad/reference/G_obh.md)
  : Beam irradiance on horizontal surface at top of Mars atmosphere
- [`G_b()`](https://georgeslabreche.github.io/marsrad/reference/G_b.md)
  : Direct beam irradiance on Mars surface normal to solar rays
- [`G_bh()`](https://georgeslabreche.github.io/marsrad/reference/G_bh.md)
  : Direct beam irradiance on Mars horizontal surface
- [`G_bi()`](https://georgeslabreche.github.io/marsrad/reference/G_bi.md)
  : Direct beam irradiance on Mars inclined surface
- [`G_dh()`](https://georgeslabreche.github.io/marsrad/reference/G_dh.md)
  : Diffuse irradiance on Mars horizontal surface
- [`G_di()`](https://georgeslabreche.github.io/marsrad/reference/G_di.md)
  : Diffuse irradiance on Mars inclined surface
- [`G_ali()`](https://georgeslabreche.github.io/marsrad/reference/G_ali.md)
  : Albedo-reflected irradiance on Mars inclined surface

## Daily Insolation (H\_\* functions)

Energy per unit area over one Martian sol

- [`H_h()`](https://georgeslabreche.github.io/marsrad/reference/H_h.md)
  : Global daily insolation on Mars horizontal surface
- [`H_i()`](https://georgeslabreche.github.io/marsrad/reference/H_i.md)
  : Global daily insolation on Mars inclined surface
- [`H_obh()`](https://georgeslabreche.github.io/marsrad/reference/H_obh.md)
  : Daily beam insolation at top of Mars atmosphere
- [`H_bh()`](https://georgeslabreche.github.io/marsrad/reference/H_bh.md)
  : Beam daily insolation on Mars horizontal surface
- [`H_bi()`](https://georgeslabreche.github.io/marsrad/reference/H_bi.md)
  : Beam daily insolation on Mars inclined surface
- [`H_dh()`](https://georgeslabreche.github.io/marsrad/reference/H_dh.md)
  : Diffuse daily insolation on Mars horizontal surface
- [`H_di()`](https://georgeslabreche.github.io/marsrad/reference/H_di.md)
  : Diffuse daily insolation on Mars inclined surface
- [`H_ali()`](https://georgeslabreche.github.io/marsrad/reference/H_ali.md)
  : Albedo-reflected daily insolation on Mars inclined surface

## Period Insolation (I\_\* functions)

Energy per unit area over multiple sols

- [`I_h()`](https://georgeslabreche.github.io/marsrad/reference/I_h.md)
  : Global insolation on Mars horizontal surface over time period
- [`I_i()`](https://georgeslabreche.github.io/marsrad/reference/I_i.md)
  : Global insolation on Mars inclined surface over time period
- [`I_obh()`](https://georgeslabreche.github.io/marsrad/reference/I_obh.md)
  : Beam insolation at top of Mars atmosphere over time period
- [`I_bh()`](https://georgeslabreche.github.io/marsrad/reference/I_bh.md)
  : Beam insolation on Mars horizontal surface over time period
- [`I_bi()`](https://georgeslabreche.github.io/marsrad/reference/I_bi.md)
  : Beam insolation on Mars inclined surface over time period
- [`I_dh()`](https://georgeslabreche.github.io/marsrad/reference/I_dh.md)
  : Diffuse insolation on Mars horizontal surface over time period
- [`I_di()`](https://georgeslabreche.github.io/marsrad/reference/I_di.md)
  : Diffuse insolation on Mars inclined surface over time period
- [`I_ali()`](https://georgeslabreche.github.io/marsrad/reference/I_ali.md)
  : Albedo-reflected insolation on Mars inclined surface over time
  period

## Solar Geometry

Sun position and angles

- [`declination()`](https://georgeslabreche.github.io/marsrad/reference/declination.md)
  : Solar declination angle on Mars
- [`Z()`](https://georgeslabreche.github.io/marsrad/reference/Z.md) :
  Solar zenith angle
- [`sunrise()`](https://georgeslabreche.github.io/marsrad/reference/sunrise.md)
  : Sunrise time on Mars
- [`sunset()`](https://georgeslabreche.github.io/marsrad/reference/sunset.md)
  : Sunset time on Mars
- [`T_d()`](https://georgeslabreche.github.io/marsrad/reference/T_d.md)
  : Number of Mars daylight hours

## Day/Night Conditions

Check polar day/night conditions

- [`is_irradiated()`](https://georgeslabreche.github.io/marsrad/reference/is_irradiated.md)
  : Check if surface is receiving solar irradiance
- [`is_polar_day()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_day.md)
  : Check if location is experiencing polar day
- [`is_polar_night()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_night.md)
  : Check if location is experiencing polar night

## Atmospheric Effects

Optical depth modeling

- [`optical_depth()`](https://georgeslabreche.github.io/marsrad/reference/optical_depth.md)
  : Atmospheric optical depth on Mars

## Optimization

Calculate optimal angles

- [`optimal_angle()`](https://georgeslabreche.github.io/marsrad/reference/optimal_angle.md)
  : Optimal tilt angle for maximum daily insolation

## Helper Functions

- [`albedo()`](https://georgeslabreche.github.io/marsrad/reference/albedo.md)
  : The albedo function.
- [`f()`](https://georgeslabreche.github.io/marsrad/reference/f.md) :
  Normalized net flux function
