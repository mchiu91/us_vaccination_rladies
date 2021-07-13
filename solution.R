# Built-in challenge: use state.x77 dataset built into base R
# plot mean number of days with minimum temperature below freezing (1931-1960)
# using choroplethr or ggplot or both!

#### choroplethr ####
# convert dataset into format usable for state_choropleth
state_frost_plot <- as.data.frame(state.x77[,"Frost",drop=F]) %>%
  rownames_to_column("region") %>%
  rename(value = Frost) %>%
  mutate(region = tolower(region))

# plot using state_choropleth
state_choropleth(state_frost_plot,
                 title = "Average Days with Minimum Temp. Below Freezing in Capital or Large City",
                 legend = "mean # of days (1931-1960)",
                 num_colors = 1)

#### ggplot2 ####
# map_data function from 'ggplot2' uses name of map provided by 'maps' package
# import us state map and assign it to an object
us_map <- map_data("state")

# merge us_map with frost dataset
state_frost_plot2 <- merge(us_map, state_frost_plot, by = "region")

# plot
# Note: parameter labels are included for ease of interpretation (can be removed)
# geom_map inherits data from previous ggplot layer
ggplot(data = state_frost_plot2, 
       aes(x = long, y = lat)) + 
  geom_map(map = us_map, 
           aes(fill = value, map_id = region), color = "white") +
  scale_fill_viridis(name = "mean # of days", option = "D") +
  # coord_map("polyconic") # coordinate map with map curvature; mapproj pkg
  # theme_map() # clean theme for displaying maps; ggthemes pkg
  labs(title = "Average Days with Minimum Temp. Below Freezing in Capital or Large City",
       subtitle = "(1931-1960)") +
  theme(text = element_text(size = 16),
        legend.title = element_text(size = 14),
        legend.position = 'right') +
  theme_void()
