# rvw_cohorts_reps.R

library(tidyverse)
install.packages("ecotoxicology")
library(ecotoxicology)

# Examine df_fltcyl from Script01

df_fltcyl
# # A tibble: 60 × 4
#     rep sex    dose twentyfour_out
#   <dbl> <chr> <dbl>          <dbl>
# 1     1 f         0              9
# 2     1 f       100              9
# 3     1 f       150              9

unique(df_fltcyl$rep)
# [1] 1 2 3 4 5

unique(df_fltcyl$sex)
# [1] "f" "m"

df_fltcyl %>% 
  group_by(rep,sex,dose) %>% 
  summarise(nObs = n())

# Examine df_mating from Script03

df_mating
# # A tibble: 92 × 5
#   rep   FemID sex     dose mate 
#   <chr> <chr> <chr>  <dbl> <chr>
# 1 c     C1    female     0 No   
# 2 c     C2    female     0 Yes  
# 3 c     C5    female     0 Yes  
# 4 e     E1    female     0 Yes  

unique(df_mating$rep)
# [1] "c" "e" "b" "d"

unique(df_mating$sex)
# [1] "female" "male" 

unique(df_mating$dose)
# [1]   0 100 200 300 400

df_mating %>% 
  group_by(rep,sex,dose) %>% 
  summarise(nObs = n())
