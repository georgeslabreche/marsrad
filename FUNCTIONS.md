# marsrad Package Functions Reference

This document provides a quick reference for all exported functions in
the marsrad package.

## Function Summary

| Function                                                                                    | Description                                                              |
|---------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| [`albedo()`](https://georgeslabreche.github.io/marsrad/reference/albedo.md)                 | Calculate surface albedo based on location and atmospheric optical depth |
| [`declination()`](https://georgeslabreche.github.io/marsrad/reference/declination.md)       | Calculate solar declination angle on Mars                                |
| [`f()`](https://georgeslabreche.github.io/marsrad/reference/f.md)                           | Normalized net flux function accounting for atmospheric scattering       |
| [`G_ali()`](https://georgeslabreche.github.io/marsrad/reference/G_ali.md)                   | Albedo-reflected irradiance on inclined surface                          |
| [`G_b()`](https://georgeslabreche.github.io/marsrad/reference/G_b.md)                       | Direct beam irradiance on surface normal to solar rays                   |
| [`G_bh()`](https://georgeslabreche.github.io/marsrad/reference/G_bh.md)                     | Direct beam irradiance on horizontal surface                             |
| [`G_bi()`](https://georgeslabreche.github.io/marsrad/reference/G_bi.md)                     | Direct beam irradiance on inclined surface                               |
| [`G_dh()`](https://georgeslabreche.github.io/marsrad/reference/G_dh.md)                     | Diffuse irradiance on horizontal surface                                 |
| [`G_di()`](https://georgeslabreche.github.io/marsrad/reference/G_di.md)                     | Diffuse irradiance on inclined surface                                   |
| [`G_h()`](https://georgeslabreche.github.io/marsrad/reference/G_h.md)                       | Global irradiance on horizontal surface                                  |
| [`G_i()`](https://georgeslabreche.github.io/marsrad/reference/G_i.md)                       | Global irradiance on inclined surface                                    |
| [`G_ob()`](https://georgeslabreche.github.io/marsrad/reference/G_ob.md)                     | Beam irradiance at top of Martian atmosphere                             |
| [`G_obh()`](https://georgeslabreche.github.io/marsrad/reference/G_obh.md)                   | Beam irradiance on horizontal surface at top of atmosphere               |
| [`H_ali()`](https://georgeslabreche.github.io/marsrad/reference/H_ali.md)                   | Albedo-reflected daily insolation on inclined surface                    |
| [`H_bh()`](https://georgeslabreche.github.io/marsrad/reference/H_bh.md)                     | Beam daily insolation on horizontal surface                              |
| [`H_bi()`](https://georgeslabreche.github.io/marsrad/reference/H_bi.md)                     | Beam daily insolation on inclined surface                                |
| [`H_dh()`](https://georgeslabreche.github.io/marsrad/reference/H_dh.md)                     | Diffuse daily insolation on horizontal surface                           |
| [`H_di()`](https://georgeslabreche.github.io/marsrad/reference/H_di.md)                     | Diffuse daily insolation on inclined surface                             |
| [`H_h()`](https://georgeslabreche.github.io/marsrad/reference/H_h.md)                       | Global daily insolation on horizontal surface                            |
| [`H_i()`](https://georgeslabreche.github.io/marsrad/reference/H_i.md)                       | Global daily insolation on inclined surface                              |
| [`H_obh()`](https://georgeslabreche.github.io/marsrad/reference/H_obh.md)                   | Daily beam insolation at top of atmosphere                               |
| [`I_ali()`](https://georgeslabreche.github.io/marsrad/reference/I_ali.md)                   | Albedo-reflected insolation on inclined surface over time period         |
| [`I_bh()`](https://georgeslabreche.github.io/marsrad/reference/I_bh.md)                     | Beam insolation on horizontal surface over time period                   |
| [`I_bi()`](https://georgeslabreche.github.io/marsrad/reference/I_bi.md)                     | Beam insolation on inclined surface over time period                     |
| [`I_dh()`](https://georgeslabreche.github.io/marsrad/reference/I_dh.md)                     | Diffuse insolation on horizontal surface over time period                |
| [`I_di()`](https://georgeslabreche.github.io/marsrad/reference/I_di.md)                     | Diffuse insolation on inclined surface over time period                  |
| [`I_h()`](https://georgeslabreche.github.io/marsrad/reference/I_h.md)                       | Global insolation on horizontal surface over time period                 |
| [`I_i()`](https://georgeslabreche.github.io/marsrad/reference/I_i.md)                       | Global insolation on inclined surface over time period                   |
| [`I_obh()`](https://georgeslabreche.github.io/marsrad/reference/I_obh.md)                   | Beam insolation at top of atmosphere over time period                    |
| [`is_irradiated()`](https://georgeslabreche.github.io/marsrad/reference/is_irradiated.md)   | Check if surface is receiving solar irradiance                           |
| [`is_polar_day()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_day.md)     | Check if location is experiencing polar day                              |
| [`is_polar_night()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_night.md) | Check if location is experiencing polar night                            |
| [`optical_depth()`](https://georgeslabreche.github.io/marsrad/reference/optical_depth.md)   | Calculate atmospheric optical depth                                      |
| [`optimal_angle()`](https://georgeslabreche.github.io/marsrad/reference/optimal_angle.md)   | Calculate optimal tilt angle for maximum daily insolation                |
| [`sunrise()`](https://georgeslabreche.github.io/marsrad/reference/sunrise.md)               | Calculate sunrise time                                                   |
| [`sunset()`](https://georgeslabreche.github.io/marsrad/reference/sunset.md)                 | Calculate sunset time                                                    |
| [`T_d()`](https://georgeslabreche.github.io/marsrad/reference/T_d.md)                       | Calculate number of daylight hours                                       |
| [`Z()`](https://georgeslabreche.github.io/marsrad/reference/Z.md)                           | Calculate solar zenith angle                                             |

## Function Categories

### Irradiance Functions (Instantaneous Power - W/m²)

Instantaneous solar power at a specific time: - **Global:**
[`G_h()`](https://georgeslabreche.github.io/marsrad/reference/G_h.md),
[`G_i()`](https://georgeslabreche.github.io/marsrad/reference/G_i.md) -
**Direct Beam:**
[`G_b()`](https://georgeslabreche.github.io/marsrad/reference/G_b.md),
[`G_bh()`](https://georgeslabreche.github.io/marsrad/reference/G_bh.md),
[`G_bi()`](https://georgeslabreche.github.io/marsrad/reference/G_bi.md) -
**Diffuse:**
[`G_dh()`](https://georgeslabreche.github.io/marsrad/reference/G_dh.md),
[`G_di()`](https://georgeslabreche.github.io/marsrad/reference/G_di.md) -
**Albedo-reflected:**
[`G_ali()`](https://georgeslabreche.github.io/marsrad/reference/G_ali.md) -
**Top of Atmosphere:**
[`G_ob()`](https://georgeslabreche.github.io/marsrad/reference/G_ob.md),
[`G_obh()`](https://georgeslabreche.github.io/marsrad/reference/G_obh.md)

### Daily Insolation Functions (Energy per Day - Wh/m²-day)

Total solar energy over a full Martian day: - **Global:**
[`H_h()`](https://georgeslabreche.github.io/marsrad/reference/H_h.md),
[`H_i()`](https://georgeslabreche.github.io/marsrad/reference/H_i.md) -
**Direct Beam:**
[`H_bh()`](https://georgeslabreche.github.io/marsrad/reference/H_bh.md),
[`H_bi()`](https://georgeslabreche.github.io/marsrad/reference/H_bi.md) -
**Diffuse:**
[`H_dh()`](https://georgeslabreche.github.io/marsrad/reference/H_dh.md),
[`H_di()`](https://georgeslabreche.github.io/marsrad/reference/H_di.md) -
**Albedo-reflected:**
[`H_ali()`](https://georgeslabreche.github.io/marsrad/reference/H_ali.md) -
**Top of Atmosphere:**
[`H_obh()`](https://georgeslabreche.github.io/marsrad/reference/H_obh.md)

### Time Period Insolation Functions (Energy over Custom Period - Wh/m²)

Total solar energy over a specified time range: - **Global:**
[`I_h()`](https://georgeslabreche.github.io/marsrad/reference/I_h.md),
[`I_i()`](https://georgeslabreche.github.io/marsrad/reference/I_i.md) -
**Direct Beam:**
[`I_bh()`](https://georgeslabreche.github.io/marsrad/reference/I_bh.md),
[`I_bi()`](https://georgeslabreche.github.io/marsrad/reference/I_bi.md) -
**Diffuse:**
[`I_dh()`](https://georgeslabreche.github.io/marsrad/reference/I_dh.md),
[`I_di()`](https://georgeslabreche.github.io/marsrad/reference/I_di.md) -
**Albedo-reflected:**
[`I_ali()`](https://georgeslabreche.github.io/marsrad/reference/I_ali.md) -
**Top of Atmosphere:**
[`I_obh()`](https://georgeslabreche.github.io/marsrad/reference/I_obh.md)

### Utility Functions

Supporting calculations and checks: - **Solar Geometry:**
[`Z()`](https://georgeslabreche.github.io/marsrad/reference/Z.md),
[`declination()`](https://georgeslabreche.github.io/marsrad/reference/declination.md),
[`sunrise()`](https://georgeslabreche.github.io/marsrad/reference/sunrise.md),
[`sunset()`](https://georgeslabreche.github.io/marsrad/reference/sunset.md),
[`T_d()`](https://georgeslabreche.github.io/marsrad/reference/T_d.md) -
**Surface Properties:**
[`albedo()`](https://georgeslabreche.github.io/marsrad/reference/albedo.md),
[`optimal_angle()`](https://georgeslabreche.github.io/marsrad/reference/optimal_angle.md) -
**Atmospheric:**
[`optical_depth()`](https://georgeslabreche.github.io/marsrad/reference/optical_depth.md),
[`f()`](https://georgeslabreche.github.io/marsrad/reference/f.md) -
**Conditions:**
[`is_irradiated()`](https://georgeslabreche.github.io/marsrad/reference/is_irradiated.md),
[`is_polar_day()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_day.md),
[`is_polar_night()`](https://georgeslabreche.github.io/marsrad/reference/is_polar_night.md)

## Naming Convention

Functions follow a consistent naming pattern: - **Prefix:** Type of
calculation (G=irradiance, H=daily insolation, I=period insolation) -
**Suffix:** Surface type and radiation component - `h` - horizontal
surface - `i` - inclined surface - `b` - beam (direct) radiation - `d` -
diffuse radiation - `al` - albedo-reflected radiation - `ob` - outside
atmosphere (top of atmosphere)

For complete documentation including parameters, return values, and
examples: generate the package manual pdf or use R’s help system:
`?function_name`
