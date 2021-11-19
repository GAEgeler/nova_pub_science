#config file

#create directory
mainDir <- here::here()


#set structure
if(!dir.exists(file.path(mainDir, "output/"))){
  dir.create(file.path(mainDir, "output/"))
}
#create subfolder
if(!dir.exists(file.path(mainDir,"output/plots"))){
  dir.create(file.path(mainDir,"output/plots"))
}


#set directory for saving plots
wd_plots <- here::here("output/plots")


