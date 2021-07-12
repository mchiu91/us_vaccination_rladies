# Built-in challenge: use state.x77 dataset built into base R
# plot mean number of days with minimum temperature below freezing (1931-1960)
# using choroplethr or ggplot or both!

## choroplethr
### convert dataset into format usable for state_choropleth
state_frost_plot <- as.data.frame(state.x77[,"Frost",drop=F]) %>%
  rownames_to_column("region") %>%
  rename(value = Frost) %>%
  mutate(region = tolower(region))

### plot using state_choropleth
state_choropleth(state_frost_plot,
                 title = "Average Days with Minimum Temp. Below Freezing in Capital or Large City",
                 legend = "mean # of days (1931-1960)",
                 num_colors = 1)

## ggplot2
# map_data function from 'ggplot2' uses name of map provided by 'maps' package
# import us state map and assign it to an object
us_map <- map_data("state")

# merge us_map with frost dataset
state_frost_plot2 <- merge(us_map, state_frost_plot, by = "region")

ggplot(data = state_frost_plot2, 
       aes(x = long, y = lat, group = group, fill = value)) +
  geom_polygon(color = "white") + # white state borders
  scale_fill_viridis_c(option = "D") +
  theme_void() +
  labs(title = "Average Days with Minimum Temp. Below Freezing in Capital or Large City",
       subtitle = "(1931-1960)",
       fill = "Mean num. of days") +
  theme(text = element_text(color = "#22211d", size = 16),
        legend.title = element_text(size = 14), 
        legend.position = "bottom",
        panel.background = element_rect(fill = "#ffffff", color = NA),
        legend.background = element_rect(fill = "#ffffff", color = NA))
# + coord_fixed(ratio = 1.1)