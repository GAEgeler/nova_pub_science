# detects dark color: for labelling the bars
# source: https://stackoverflow.com/questions/49437263/is-there-a-is-light-or-is-dark-color-function-in-r

# state: mai 2018

isDark <- function(color) {
  (sum(grDevices::col2rgb(color) *c(299, 587,114))/1000 < 123)
}


#' plot_survey_long <- function(data = data, 
#'                              x = x, 
#'                              y = y, 
#'                              fill = fill,
#'                              gtitle = NULL) {
#'   #' @author gian-andrea egeler based on code of flavio von rickenbach
#'   #' @description plots the answers of conducted survey in two canteens
#'   #' @param data defines data set, containing question of interest
#'   #' @param gtitle set title of the plot (mainly containing the question)
#'   #' @param cols defines the colors per category
#'   #' @param limits defines the limits on the x-axis
#'   
#'   
#'   #plot
#'   ggplot(data = data, 
#'          aes(x=x, y=y, 
#'              fill=factor(Wahl, attributes(ColsPerCat_survey2)$names))) +
#'     geom_bar(stat = "identity", position = position_stack(), color = NA, width = 0.6) +
#'     # scale_color_manual(values = levels(df_mensa_satis$label_color)) +
#'     scale_fill_manual(breaks = attributes(ColsPerCat_survey2)$name,
#'                       values = ColsPerCat_survey2) +
#'     scale_x_discrete(limits=c("Basis (n = 381)", "Intervention (n = 494)"))+
#'     geom_text(aes(label=(if_else(pct_answ<0.0249, "",
#'                                  paste( round(pct_answ*100), "%", sep = " ")))), 
#'               size = 12*converter, 
#'               fontface = "bold", 
#'               position = position_stack(vjust = 0.5))+
#'     xlab("")+
#'     ylab("")+
#'     guides(color = "none", fill = guide_legend("", reverse = TRUE, nrow = 1)) +
#'     ggtitle("Wie zufrieden sind Sie mit dem gewählten Menü?\n(Frage 3, Experimentwoche, n = 875)")+
#'     coord_flip() +
#'     mytheme +
#'     facet_wrap(~question,  nrow = NULL, ncol = 1, scales = "free") +
#'     scale_y_origin(labels = scales::percent) +
#'     theme(legend.position = "bottom")
#'   
#'   
#' }