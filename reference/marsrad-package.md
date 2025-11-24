# marsrad: Mars Solar Radiation

A set of functions to calculate solar irradiance and insolation on Mars
horizontal and inclined surfaces. Based on NASA Technical Memoranda
102299, 103623, 105216, 106321, and 106700, i.e. the canonical Mars
solar radiation papers.

## Details

The package provides three types of solar radiation calculations:

- Instantaneous irradiance (G\_\* functions) — Power per unit area at a
  specific moment

- Daily insolation (H\_\* functions) — Energy per unit area over one
  Martian sol

- Period insolation (I\_\* functions) — Energy per unit area over
  multiple sols

All calculations support both horizontal and inclined surfaces. The
package includes functions for optimal tilt angle calculation,
sunrise/sunset times, and atmospheric optical depth modeling.

## Package Information

- Version:

  1.0.0

- License:

  GPL-3

- Website:

  <https://georges.fyi/marsrad/>

- Author:

  [Georges Labrèche](https://georges.fyi)

- Affiliation:

  [Tanagra Space](https://tanagraspace.com)

- Depends:

  R (\>= 2.10)

## Citation

If you use this package in your research or publication, please cite the
paper it was developed for:

Labrèche, G., & Cordes, F. (2020). Using a Rover's Active Suspension
System as a 2-Axis Solar Tracker Mechanism. *15th International
Symposium on Artificial Intelligence, Robotics and Automation in Space
(i-SAIRAS '20)*.
<https://www.hou.usra.edu/meetings/isairas2020fullpapers/pdf/5035.pdf>

## Links

- Package website:

  <https://georges.fyi/marsrad/>

- Package GitHub repository:

  <https://github.com/georgeslabreche/marsrad>

- Author LinkedIn:

  <https://www.linkedin.com/in/georgeslabreche/>

- Author website:

  <https://georges.fyi>

## References

Appelbaum, J., & Flood, D. J. (1989). Solar Radiation on Mars. NASA
Technical Memorandum 102299.
<https://ntrs.nasa.gov/citations/19890018252>

Appelbaum, J., & Flood, D. J. (1990). Solar radiation on Mars: Update
1990. NASA Technical Memorandum 103623.
<https://ntrs.nasa.gov/citations/19910005804>

Appelbaum, J., & Flood, D. J. (1991). Solar radiation on Mars: Update
1991. NASA Technical Memorandum 105216.
<https://ntrs.nasa.gov/citations/19910023732>

Appelbaum, J., Sherman, I., & Landis, G. A. (1993). Solar radiation on
Mars: Stationary photovoltaic array. NASA Technical Memorandum 106321.
<https://ntrs.nasa.gov/citations/19940010257>

Appelbaum, J., Flood, D. J., & Norambuena, M. (1994). Solar radiation on
Mars: Tracking photovoltaic array. NASA Technical Memorandum 106700.
<https://ntrs.nasa.gov/citations/19950004977>

## See also

Labrèche, G. (2020). Exploiting the SherpaTT Rover Active Suspension
System to Enable Optimal Solar Array Inclination and Orientation for
Long Traverses in a Martian Environment. *Master's Thesis, Luleå
University of Technology*.
<https://www.diva-portal.org/smash/record.jsf?pid=diva2:1413245>

## Author

**Maintainer**: Georges Labrèche <georges@tanagraspace.com>
([ORCID](https://orcid.org/0000-0002-2104-8789))

## Examples

``` r
# Calculate horizontal irradiance at Viking 1 landing site on Ls 90 (northern summer solstice)
G_h(Ls = 90, phi = 22.48, longitude = -48, Ts = 12, tau = 0.5)
#> [1] 457.7637

# Find optimal panel tilt angle for the same location and season
optimal_angle(Ls = 90, phi = 22.48)
#> [1] -0.1715647

# Calculate daily insolation on a horizontal surface
H_h(Ls = 90, phi = 22.48, longitude = -48, tau = 0.5)
#> Warning: Possibly large error encountered with z = 87.8215472861451° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 87.8215472861451° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 89.6387504555656° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 89.6387504555656° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 84.1290152474966° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 84.1290152474966° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 88.9131300363155° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 84.3306104288069° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 89.8194425886699° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 87.0803676701522° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 80.7349105877723° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 88.9131300363155° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 84.3306104288069° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 89.8194425886699° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 87.0803676701522° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> Warning: Possibly large error encountered with z = 80.7349105877723° (maximum error is 7% for Z = 80° or Z = 85°). Consider using the lookup_v1 and lookup_v2 table lookup implementation of the normalized net flux function instead of its polynomial expression.
#> [1] 3630.907

# Calculate insolation over a 24-hour period on an inclined surface
I_i(Ls = 90, phi = 22.48, longitude = -48, tau = 0.5, Ts_start = 0,
    Ts_end = 24, beta = 25, gamma_c = 0)
#> [1] 3216.278
```
