# Equation 5 (1990): Beam irridiance on a horizontal surface at the top of Mars atmosphere [W/m2].
#
# Based on equations presented in the following publication:
#   Appelbaum, Joseph & Flood, Dennis. (1990). Solar radiation on Mars. Solar Energy. 45. 353–363. 10.1016/0038-092X(90)90156-7. 
#   https://ntrs.nasa.gov/?R=19890018252


#' Beam irradiance on horizontal surface at top of Mars atmosphere
#'
#' Calculates the solar beam irradiance on a horizontal surface at the top of the Martian
#' atmosphere (before atmospheric attenuation). Implements Equation 5 from Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#' @param phi Planetary latitude [deg]. Can be NULL if z is provided
#' @param Ts Solar time [h]. Can be NULL if z is provided
#' @param z Sun zenith angle [deg]. If not provided, calculated from Ls, phi, and Ts
#'
#' @return Beam irradiance at top of atmosphere [W/m²]
#' @export
G_obh = function(Ls, phi=NULL, Ts=NULL, z=Z(Ls=Ls, phi=phi, Ts=Ts)){
  #TODO: What happens if phi and Ts are null?
  Gobh = G_ob(Ls) * cos(z*pi/180)
  return(Gobh)
}