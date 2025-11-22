# Equation 13 (1990): Daily beam insolation on a horizontal surfce at top of Mars atmosphere [Wh/m2-day].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Daily beam insolation at top of Mars atmosphere
#'
#' Calculates the solar beam energy over a full Martian day on a horizontal surface at the top
#' of the Martian atmosphere (before atmospheric attenuation). Implements Equation 13 from
#' Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]
#'
#' @return Daily beam insolation at top of atmosphere [Wh/m²-day]
#' @export
H_obh = function(Ls, phi){
  Hobh = I_obh(Ls=Ls, phi=phi, Ts_start=0, Ts_end=24)
  return(Hobh)
}
