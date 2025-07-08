# scratch.R
library(dplyr)


df_mating <- read_excel("Dataset.xlsx", sheet = "Mating_400Gy")
df_mating
# # A tibble: 92 × 5
#   rep   FemID sex     dose mate 
#   <chr> <chr> <chr>  <dbl> <chr>
# 1 c     C1    female     0 No   
# 2 c     C2    female     0 Yes  
# 3 c     C5    female     0 Yes  
# 4 e     E1    female     0 Yes  
# 5 e     E2    female     0 Yes  
# 6 e     E3    female     0 Yes 

df_mating %>% 
  group_by(FemID,sex,dose) %>% 
  summarise(nObs = n()) %>%      # nObs 92 to this point
  filter(!nObs == 1)             # Takes to 0

x <- sort(df_mating$FemID)

y <- unique(sort(df_mating$FemID))

x == y         # Verifies that these are the same

df_mating %>% 
  group_by(sex,dose) %>% 
  summarise(nObs = n())
# # A tibble: 10 × 3
# # Groups:   sex [2]
#   sex     dose  nObs
#   <chr>  <dbl> <int>
# 1 female     0     8
# 2 female   100     7
# 3 female   200    10
# 4 female   300     9
# 5 female   400    10
# 6 male       0     9
# 7 male     100    10
# 8 male     200    10
# 9 male     300     9
# 10 male     400    10

df_all <- read_excel("Dataset.xlsx", sheet = "Oviposition_400Gy")
df_all
# # A tibble: 74 × 5
#   rep   FemID sex     dose sum_white
#   <chr> <chr> <chr>  <dbl>     <dbl>
# 1 c     C2    female     0       225
# 2 c     C5    female     0       241
# 3 e     E1    female     0       135
# 4 e     E2    female     0        61
# 5 e     E3    female     0         8
# 6 e     E4    female     0        41

a <- sort(df_all$FemID)
b <- sort(unique(df_all$FemID))
a == b            # also verified the same


# What is the difference?
disappeared <- setdiff(y,b)
disappeared
# [1] "B10" "B14" "B18" "B2"  "B9"  "C1"  "C10" "C23" "C8"  "D10" "D11" "D13" "D14" "D18"
# [15] "D6"  "E14" "E17" "E9" 

# Take another look at these in the first data set
df_dropped <- df_mating[df_mating$FemID %in% disappeared,]
# # A tibble: 18 × 5
#   rep   FemID sex     dose mate 
#   <chr> <chr> <chr>  <dbl> <chr>
# 1 c     C1    female     0 No   
# 2 c     C10   female   100 No   
# 3 c     C8    female   100 No   
# 4 e     E9    female   100 No   
# 5 e     E14   female   200 No   
# 6 e     E17   female   300 No   
# 7 c     C23   female   400 No   
# 8 b     B2    male     100 No   
# 9 d     D10   male     100 No   
# 10 d     D6    male     100 No   
# 11 b     B10   male     200 No   
# 12 b     B9    male     200 No   
# 13 d     D11   male     200 No   
# 14 d     D13   male     200 No   
# 15 d     D14   male     200 No   
# 16 b     B14   male     300 No   
# 17 d     D18   male     300 No   
# 18 b     B18   male     400 No   

# Examine females, 100 Gy, in df_mating
df_mating %>% 
  filter(sex == "female" & dose == 100)
# # A tibble: 7 × 5
#   rep   FemID sex     dose mate 
#   <chr> <chr> <chr>  <dbl> <chr>
# 1 c     C10   female   100 No   
# 2 c     C8    female   100 No   
# 3 e     E9    female   100 No   
# 4 c     C7    female   100 Yes  
# 5 c     C9    female   100 Yes  
# 6 e     E10   female   100 Yes  
# 7 e     E8    female   100 Yes  

# 7 total, 4 mated, 3 unmated--total checks with mated