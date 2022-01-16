######
# Theme for plotting
######
###
# state: january 2022
# author: gian-Andrea egeler
###

#infos from here: https://www.science.org/content/page/instructions-preparing-initial-manuscript


#translate meal labels into english
labels = c(health = "...of my nutrition on my health.",
           environment = "...of my nutritional habits on the environment.",
           production = "...of the production of foods I eat on those working in supply chains.",
           animal = "...of my consumption of animal products on animals.",
           money = "...of my nutrition on my finances.")
           



#define colors for plot-----
## canteen lunch types
#kudos: https://davidmathlogic.com/colorblind/
ColsPerCat_blind =  c("buffet" = "#004D40", 
                      "never meat" = "#1E88E5",
                      "veg-flexitarian" = "#AAED89",
                      "meat-flexitarian" = "#5D6395",
                      "meat-eater" =  "#c5b87c",
                      "meat lover" = "#F59D28",
                      "always meat" = "#D81B60") 



#food types names
NamesPerType = tibble::tibble(lunch_type = c("buffet", 
                                             "never meat",
                                             "veg-flexitarian",
                                             "meat-flexitarian",
                                             "meat-eater",
                                             "meat lover",
                                             "always meat"),
                              plot_names_rmp = c("Buffetarian (rmp)",
                                             "Never meat (rmp)",
                                             "Vegetarian-\nflexitarian (rmp)", 
                                             "Meat-\nflexitarian (rmp)",
                                             "Meat eater (rmp)" , 
                                             "Meat lover (rmp)",
                                             "Always meat (rmp)"))

#POS plots meal content
NamesPerContent = c("Unknown" = "black",
                    "Vegan (meat substitute)" = "grey90", 
                    "Vegan (authentic)" = "#80ccff",
                    "Vegetarian" = "#c5b87c", 
                    "Fish"="#6619e6", 
                    "Meat" = "#fad60d",
                    "Hot and Cold"="#4c4848")

##colors for meal content
#attention defines also the order of the legend
NamesPerContent2 = c("Unknown" = "black",
                   "Vegan (substitute)" = "grey90", 
                   "Vegan (authentic)" = "#1E88E5",
                   "Vegetarian" = "#AAED89", 
                   "Fish" = "#5D6395", 
                   "Meat" = "#FFC107",
                   "Hot&Cold (buffet)" = "#004D40")



#survey plots
ColsPerCat_survey1 = c("NA" = "grey",
                      "disagree" = "#DC6413", 
                      "rather disagree" = "#Fdd200", 
                      "rather agree" = "#AFC410", 
                      "agree"="#006885")

ColsPerCat_survey2 = c("NA" = "grey",
                       "not applicable" = "#DC6413", 
                       "rather not applicable" = "#Fdd200", 
                       "rather applicable" = "#AFC410", 
                       "applicable" = "#006885")







##############-----------
#defining mytheme
extrafont::loadfonts(device = "win", quiet = TRUE) # https://cran.r-project.org/web/packages/extrafont/README.html


#that geom_text inherits from theme: https://stackoverflow.com/questions/48977963/how-to-let-geom-text-inherit-theme-specifications-ggplot2
ggplot2::theme_set(ggplot2::theme_minimal(base_family = "Helvetica"))
ggplot2::update_geom_defaults("text", 
                              list(family = ggplot2::theme_get()$text$family))



### for regular plots -------------------

mytheme_pos <- ggplot2::theme_bw()+ # define theme for plot
    ggplot2::theme(plot.title = ggplot2::element_text(size = 22, face = "bold"),
          axis.text.x = ggplot2::element_text(size=22),
          axis.text.y = ggplot2::element_text(size=22, face = "plain"),
          legend.text = ggplot2::element_text(size = 22),
          legend.title = ggplot2::element_text(size =22),
          strip.text = ggplot2::element_text(size=30),
          panel.spacing = ggplot2::unit(1, "lines"), # space between panels 
          axis.title.y = ggplot2::element_text(size = 22,
                                               margin =ggplot2::margin(t = 0, r = 22, b = 0, l = 0)),
          axis.title.x = ggplot2::element_text(size = 22,  
                                               margin =ggplot2::margin(t = 22, r = 0, b = 0, l = 0)),
          plot.subtitle = ggplot2::element_text(margin=ggplot2::margin(b=15),
                                                size = 22),
          plot.caption = ggplot2::element_text(margin=ggplot2::margin(t=15), 
                                               face="italic", size=22),
          text = ggplot2::element_text(family = ggplot2::theme_get()$text$family),
          legend.key = ggplot2::element_rect(color = "white", size = 6, 
                                             fill = "white"), 
          legend.key.size = ggplot2::unit(1.5, "cm"),
          legend.margin = ggplot2::margin(-0.5, 0, 0.05, 0, "cm"),
          plot.margin = ggplot2::unit(c(t = 0, r = 0, b = 0, l = 0),"cm"))


### for plots with double x-axis: https://stackoverflow.com/questions/52554822/save-a-ggplot2-time-series-plot-grob-generated-by-ggplotgrob
mytheme_facet <- ggplot2::theme_classic()+ # definve theme for plot
    ggplot2::theme(axis.text.x = ggplot2::element_text(size=22),
                   axis.text.y = ggplot2::element_text(size=22, face = "plain"),
                   #remove the lines, background and grid
                   # panel.border = ggplot2::element_blank(),
                   # panel.background = ggplot2::element_blank(),
                   panel.grid.major = ggplot2::element_blank(),
                   # panel.grid = ggplot2::element_blank(),
                   legend.text = ggplot2::element_text(size = 22),
                   legend.title = ggplot2::element_text(size =22),
                   strip.text = ggplot2::element_text(size=22),
                   strip.background.x = ggplot2::element_blank(), #background color to blanc facet wraps
                   # remove facet spacing on x-direction
                   strip.placement = 'outside',
                   panel.spacing.x = ggplot2::unit(0, "lines"), 
                   axis.title.y = ggplot2::element_text(size = 22, 
                                                        margin = ggplot2::margin(t = 0, r = 22, b = 0, l = 0)),
                   axis.title.x = ggplot2::element_text(size = 22, 
                                                        margin = ggplot2::margin(t = 22, r = 0, b = 0, l = 0)),
                   plot.subtitle = ggplot2::element_text(margin = ggplot2::margin(b=15),size = 30),
                   plot.caption = ggplot2::element_text(margin = ggplot2::margin(t=15), face="italic", size=22),
                   text = ggplot2::element_text(family = ggplot2::theme_get()$text$family)) 

#set coord expansion
#source: https://stackoverflow.com/questions/61969752/force-the-origin-to-start-at-0-without-margin-between-data-and-x-axis-in-new-ggp
scale_y_origin <- function(...) {
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0.02)), ...)
}


#geom_text size "converter": https://stackoverflow.com/questions/17311917/ggplot2-the-unit-of-size
converter = (25.4/72.27)



### for plots form survey

mytheme_survey <- ggplot2::theme_bw()+ 
    ggplot2::theme(plot.title = ggplot2::element_text(size = 22, face = "bold",  
                                    margin = ggplot2::margin(0, 0, .05, 0., "cm")),
          axis.text.x = ggplot2::element_text(size = 22),
          axis.text.y = ggplot2::element_text(size = 22),
          legend.text = ggplot2::element_text(size = 22),
          legend.title = ggplot2::element_text(size = 22),
          strip.text.x = ggplot2::element_text(size = 22,  face = "bold",  
                                      hjust = 0, 
                                      margin = ggplot2::margin(.05, 0, .05, 0.05, "cm")),
          axis.title.y = ggplot2::element_text(size = 22,
                                      margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0)),
          axis.title.x = ggplot2::element_text(size = 22, 
                                      margin = ggplot2::margin(t = 0, r = 0, b = 0, l = 0)),
          plot.subtitle = ggplot2::element_text(margin = ggplot2::margin(b=15), size = 22),
          plot.caption = ggplot2::element_text(margin = ggplot2::margin(t=15), face="italic", size=  22),
          panel.spacing = ggplot2::unit(1, "lines"),
          legend.position = "bottom",
          legend.key.size = ggplot2::unit(1.5, "cm"),
          legend.margin = ggplot2::margin(-0.5, 0, 0.05, 0, "cm"),
          text = ggplot2::element_text(family = ggplot2::theme_get()$text$family),
          plot.margin = ggplot2::unit(c(t = 0, r = 0, b = 0, l = 0),"cm"))
