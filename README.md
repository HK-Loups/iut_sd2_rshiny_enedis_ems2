# iut_sd2_rshiny_enedis_ems2
Projer R

okey okey 
c'est quoi ton style : mec de 6t simple 



df = read.csv(file = "dpe-v2-logements-existants.csv", sep = ",", dec = ".")

df2 = read.csv(file = "dpe-v2-logements-neufs.csv", sep = ",", dec = ".")

dim(df)
dim(df2)

df$Logement ="ancien"
df2$Logement ="neuf"

df2$Année_construction = "2024"

liste = intersect(names(df), names(df2))
dfmodif = df[,liste]
dfmodif2 = df2[,liste]

df_merged12 <- rbind(dfmodif, dfmodif2)

EKIPPPPPPPPP
