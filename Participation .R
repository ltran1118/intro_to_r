library(ggplot2)
library(dplyr)
install.packages("data.table")
library(data.table)

load("suicides.rdata")
all_suicides <- copy(suicides)

suicides <- suicides %>%
  group_by(year, state, means) %>%
  mutate(deaths = sum(deaths))

## the basics
bare <- ggplot(suicides)

## adding plot aesthetics
aesthetic <- ggplot(suicides, aes(x=year, y=deaths))

## adding points
scatter <- ggplot(suicides, aes(x=year, y=deaths)) +
            geom_point()

## splot "means" by color
color_by_means <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
                    geom_point()
    
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
              geom_point() +
              facet_wrap(~state, scales="free")
# line plot
line_state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
              geom_line() +
              facet_wrap(~state, scales="free")
# bar plot
state_fact <- ggplot(suicides, aes(x=year, y=deaths, color=means)) +
              geom_point() +
              facet_wrap(~state, scales="free")