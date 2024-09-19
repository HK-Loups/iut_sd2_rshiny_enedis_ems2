getwd()


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


df_merged12$Date_réception_DPE =as.Date(df_merged12$Date_réception_DPE) # modifie le type 
str(df_merged12$Date_réception_DPE) " voir le type"


#7)


df_merged12$Date_réceptionAnne = format(df_merged12$Date_réception_DPE, "%Y")  #avoir que l'annee 



# Ajouter une nouvelle colonne en fonction d'une condition
df_merged12$verfication =ifelse(df_merged12$Coût_total_5_usages == (df_merged12$Coût_chauffage + df_merged12$Coût_éclairage + df_merged12$Coût_ECS + df_merged12$Coût_refroidissement + df_merged12$Coût_auxiliaires) , "vrais", "faux")

df_merged12$Année_construction =as.numeric(df_merged12$Année_construction)

cut(df_merged12$Année_construction, breaks= c(1900,1960,1970,1980,1990,2000,2010,2050), labels = c("avant 1960","1961-1970","1971-1980","1991-2000","2001-2010","apres 2010")



repartition_dpe = table(df_merged12$Etiquette_DPE)
print(repartition_dpe)


df_merged12$Date_réception_DPE = as.Date(df_merged12$Date_réception_DPE)
repartition_dpe = table(df_merged12$Date_réception_DPE)  
print(Date_réception_DPE)
  
  