% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ochre.R
\docType{data}
\name{ochre_palettes}
\alias{ochre_palettes}
\title{Australian Colour Palettes}
\format{An object of class \code{list} of length 16.}
\usage{
ochre_palettes
}
\description{
A collection of colour palettes inspired by the landscape and wildlife of
Australia. The list of available palettes is:
namatjira_qual, namatjira_div
mccrea
parliament
tasmania
nolan_ned
winmar
olsen_qual
williams_pilbara
healthy_reef, dead_reef
galah, lorikeet, jumping_frog
emu_woman_paired
}
\examples{

# Make an x-y plot using the Namatjira palette
library(tidyverse)
df <- data.frame(x = rnorm(100, 0, 20),
          y = rnorm(100, 0, 20),
          cl = sample(letters[1:8], 100, replace=TRUE))
ggplot(df, aes(x, y, colour=cl, shape=cl)) +
  geom_point(size=4) + scale_colour_ochre() +
  theme_bw() + theme(aspect.ratio=1)

# Make a histogram using the McCrea Collins Street palette
ggplot(df, aes(x, fill=cl)) + geom_histogram() +
  scale_fill_ochre(palette="mccrea")

\dontrun{
  data(elev)
  library(elevatr)
  library(raster)
  library(ochRe)
  colpal <- ochre_pal()(150)
  ex <- extent(110, 155, -45, -10)
  elev <- raster::crop(elev, ex)
  elev[elev < 0] <- NA
  topo <- list(x = xFromCol(elev), y = rev(yFromRow(elev)),
               z = t(as.matrix(elev))[, nrow(elev):1])
               par(mar = rep(0, 4), bg = "#444444")
               image(topo, useRaster = TRUE, col = colpal,
                     axes = FALSE, xlab = "", ylab = "",
                           asp = cos(27.5 * pi/180))
}
}
\keyword{datasets}
