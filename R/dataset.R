SciViews::R

# importation des données provenant de dryard <https://doi.org/10.5061/dryad.nb25502>
# On s'intéresse à l'espece Plestiodon quadrilineatus Blyth, 1853 (donc la feuille 2)

data_raw <- read("data/raw/Data.xlsx", sheet = 2)
names(data_raw)
# On veut travailler sur les males et spécifiquement sur l'individus 2

data_raw %>.%
  select(., 1:5) %>.%
  rename(., 
         id = "Animal_ID...1", weeks = Weeks, mass = "Mass♂ (g)",
         svl = "SVL♂ (cm)", tl = "TL♂ (cm)") -> data_sub

data_sub <- labelise(
  data_sub, 
  label = list(id = "ID", weeks = "Temps", mass = "Masse", svl ="SVL", tl = "TL"),
  units = list(weeks = "semaine", mass = "g", svl = "cm", tl = "cm"))

data_sub %>.%
  filter(., id == 2) -> data_sub

write(data_sub, file = "data/data_pquadri_2.rds", type = "rds")
