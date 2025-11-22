# Constants.
Ls_P = 248      # Periphelion.
e = 0.093377    # Mars orbit eccentricity.
Mb = 590        # Mean beam irradiance at the top of the Martian atmosphere.

#' Beam irradiance at top of Martian atmosphere
#'
#' Calculates the solar beam irradiance at the top of the Martian atmosphere (before any
#' atmospheric effects) as a function of Mars' orbital position. Accounts for Mars' elliptical
#' orbit which causes seasonal variation in solar intensity. Implements Equation 4 from
#' Appelbaum & Flood (1990).
#'
#' @param Ls Areocentric longitude [deg]
#'
#' @return Beam irradiance at top of atmosphere [W/m²]
#' @export
G_ob = function(Ls){
  
  Gob = Mb * (1 + e*cos((Ls-Ls_P)*pi/180))^2 / (1-e^2)^2
  return(Gob)
}
