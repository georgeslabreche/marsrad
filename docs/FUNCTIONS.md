# Mars Package Functions Reference

This document provides a quick reference for all exported functions in the mars package.

## Function Summary

| Function | Description |
|----------|-------------|
| `albedo()` | Calculate surface albedo based on location and atmospheric optical depth |
| `declination()` | Calculate solar declination angle on Mars |
| `f()` | Normalized net flux function accounting for atmospheric scattering |
| `G_ali()` | Albedo-reflected irradiance on inclined surface |
| `G_b()` | Direct beam irradiance on surface normal to solar rays |
| `G_bh()` | Direct beam irradiance on horizontal surface |
| `G_bi()` | Direct beam irradiance on inclined surface |
| `G_dh()` | Diffuse irradiance on horizontal surface |
| `G_di()` | Diffuse irradiance on inclined surface |
| `G_h()` | Global irradiance on horizontal surface |
| `G_i()` | Global irradiance on inclined surface |
| `G_ob()` | Beam irradiance at top of Martian atmosphere |
| `G_obh()` | Beam irradiance on horizontal surface at top of atmosphere |
| `H_ali()` | Albedo-reflected daily insolation on inclined surface |
| `H_bh()` | Beam daily insolation on horizontal surface |
| `H_bi()` | Beam daily insolation on inclined surface |
| `H_dh()` | Diffuse daily insolation on horizontal surface |
| `H_di()` | Diffuse daily insolation on inclined surface |
| `H_h()` | Global daily insolation on horizontal surface |
| `H_i()` | Global daily insolation on inclined surface |
| `H_obh()` | Daily beam insolation at top of atmosphere |
| `I_ali()` | Albedo-reflected insolation on inclined surface over time period |
| `I_bh()` | Beam insolation on horizontal surface over time period |
| `I_bi()` | Beam insolation on inclined surface over time period |
| `I_dh()` | Diffuse insolation on horizontal surface over time period |
| `I_di()` | Diffuse insolation on inclined surface over time period |
| `I_h()` | Global insolation on horizontal surface over time period |
| `I_i()` | Global insolation on inclined surface over time period |
| `I_obh()` | Beam insolation at top of atmosphere over time period |
| `is_irradiated()` | Check if surface is receiving solar irradiance |
| `is_polar_day()` | Check if location is experiencing polar day |
| `is_polar_night()` | Check if location is experiencing polar night |
| `optical_depth()` | Calculate atmospheric optical depth |
| `optimal_angle()` | Calculate optimal tilt angle for maximum daily insolation |
| `sunrise()` | Calculate sunrise time |
| `sunset()` | Calculate sunset time |
| `T_d()` | Calculate number of daylight hours |
| `Z()` | Calculate solar zenith angle |

## Function Categories

### Irradiance Functions (Instantaneous Power - W/m²)
Instantaneous solar power at a specific time:
- **Global:** `G_h()`, `G_i()`
- **Direct Beam:** `G_b()`, `G_bh()`, `G_bi()`
- **Diffuse:** `G_dh()`, `G_di()`
- **Albedo-reflected:** `G_ali()`
- **Top of Atmosphere:** `G_ob()`, `G_obh()`

### Daily Insolation Functions (Energy per Day - Wh/m²-day)
Total solar energy over a full Martian day:
- **Global:** `H_h()`, `H_i()`
- **Direct Beam:** `H_bh()`, `H_bi()`
- **Diffuse:** `H_dh()`, `H_di()`
- **Albedo-reflected:** `H_ali()`
- **Top of Atmosphere:** `H_obh()`

### Time Period Insolation Functions (Energy over Custom Period - Wh/m²)
Total solar energy over a specified time range:
- **Global:** `I_h()`, `I_i()`
- **Direct Beam:** `I_bh()`, `I_bi()`
- **Diffuse:** `I_dh()`, `I_di()`
- **Albedo-reflected:** `I_ali()`
- **Top of Atmosphere:** `I_obh()`

### Utility Functions
Supporting calculations and checks:
- **Solar Geometry:** `Z()`, `declination()`, `sunrise()`, `sunset()`, `T_d()`
- **Surface Properties:** `albedo()`, `optimal_angle()`
- **Atmospheric:** `optical_depth()`, `f()`
- **Conditions:** `is_irradiated()`, `is_polar_day()`, `is_polar_night()`

## Naming Convention

Functions follow a consistent naming pattern:
- **Prefix:** Type of calculation (G=irradiance, H=daily insolation, I=period insolation)
- **Suffix:** Surface type and radiation component
  - `h` - horizontal surface
  - `i` - inclined surface
  - `b` - beam (direct) radiation
  - `d` - diffuse radiation
  - `al` - albedo-reflected radiation
  - `ob` - outside atmosphere (top of atmosphere)

For complete documentation including parameters, return values, and examples: generate the package manual pdf or use R's help system: `?function_name`
