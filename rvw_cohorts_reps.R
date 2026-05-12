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
# # A tibble: 20 × 4
# # Groups:   rep, sex [4]
#    rep   sex     dose  nObs
#    <chr> <chr>  <dbl> <int>
#  1 b     male       0     5
#  2 b     male     100     5
#  3 b     male     200     5
#  4 b     male     300     4
#  5 b     male     400     5
#  6 c     female     0     3
#  7 c     female   100     4
#  8 c     female   200     5
#  9 c     female   300     5
# 10 c     female   400     5
# 11 d     male       0     4
# 12 d     male     100     5
# 13 d     male     200     5
# 14 d     male     300     5
# 15 d     male     400     5
# 16 e     female     0     5
# 17 e     female   100     3
# 18 e     female   200     5
# 19 e     female   300     4
# 20 e     female   400     5

# Examine egg numbers from script 4

df_all   # Raw numbers
# A tibble: 74 × 5
#   rep   FemID sex    dose  sum_white
#   <chr> <chr> <chr>  <fct>     <dbl>
# 1 c     C2    female 0           225
# 2 c     C5    female 0           241
# 3 e     E1    female 0           135

# This was subsetted into females and males
females %>% 
  group_by(dose) %>%
  summarise(nObs = sum(!is.na(sum_white)),
            mn = mean(sum_white, na.rm = TRUE),
            sem = se(sum_white))
# # A tibble: 5 × 4
#   dose   nObs    mn   sem
#   <fct> <int> <dbl> <dbl>
# 1 0         7  113.  34.3
# 2 100       4  122   55.4
# 3 200       9  156   26.9
# 4 300       8  150.  33.5
# 5 400       9  126.  36.9

# White eggs--numbers the same for all egg endpoints

males %>% 
  group_by(dose) %>%
  summarise(nObs = sum(!is.na(sum_white)),
            mn = mean(sum_white, na.rm = TRUE),
            sem = se(sum_white))
# # A tibble: 5 × 4
#   dose   nObs    mn   sem
#   <fct> <int> <dbl> <dbl>
# 1 0         9 189.   30.9
# 2 100       7 189    50.4
# 3 200       5 202.   55.7
# 4 300       7 124.   29.3
# 5 400       9  81.7  26.6

# Examine numbers for pupal endpoint from Expt 3, script07
df_pupae350 %>% 
  group_by(Sex, Dose) %>% 
  summarise(nObs = sum(!is.na(Pupae)),
            mn = mean(Pupae, na.rm = TRUE),
            sem = se(Pupae))
# # A tibble: 6 × 5
# # Groups:   Sex [2]
#   Sex   Dose   nObs    mn    sem
#   <chr> <fct> <int> <dbl>  <dbl>
# 1 F     0         5  48.2  4.91 
# 2 F     250       5   0.2  0.2  
# 3 F     350       5   2.8  0.970
# 4 M     0         4  60.2 20.2  
# 5 M     250       5   1.8  0.490
# 6 M     350       4   2.5  1.19 
