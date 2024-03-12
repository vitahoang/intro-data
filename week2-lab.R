library(statsr)
library(dplyr)
library(ggplot2)
data(nycflights)

assfo_feb_flights <- nycflights %>%
  filter(dest == "SFO", month == 2)


assfo_feb_flights

ggplot(data = assfo_feb_flights, aes(x = arr_delay)) +
  geom_histogram(binwidth = 20)

assfo_feb_flights %>%
  group_by(carrier) %>%
  summarise(mean_dd = mean(arr_delay), iqr_dd = IQR(arr_delay))

nycflights %>%
  group_by(month) %>%
  summarise(mean_dd = mean(dep_delay)) %>%
  arrange(desc(mean_dd))

nycflights %>%
  group_by(month) %>%
  summarise(median_dd = median(dep_delay)) %>%
  arrange(desc(median_dd))

nycflights <- nycflights %>%
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))

nycflights %>%
  group_by(origin) %>%
  summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%
  arrange(desc(ot_dep_rate))

nycflights <- nycflights %>%
  mutate(avg_speed = distance/(air_time/60))

nycflights %>%
  group_by(tailnum) %>%
  arrange(desc(avg_speed))

ggplot(nycflights, aes(x=avg_speed, y=distance)) +
  geom_point(size=0.5, shape=3) +
  geom_smooth()

nycflights <- nycflights %>%
  mutate(arr_type = ifelse(arr_delay < 1, "on time", "delayed"))

nycflights <- nycflights %>%
  mutate(dep_delay_arr_type = ifelse(arr_type == "on time" & dep_type == "delayed", "T", "F"))

nycflights %>%
  summarise(ot_dep_rate = sum(dep_delay_arr_type == "T") / n()) %>%