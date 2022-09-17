APP_DESVENDANDO_O_R_NA_SAUDE <- function(){

  verify.jp1 <- require("shiny")
  if(verify.jp1 == FALSE){
    install.packages("shiny")
  }

  verify.jp2 <- require("shinythemes")
  if(verify.jp2 == FALSE){
    install.packages("shinythemes")
  }

  verify.jp3 <- require("shinycssloaders")
  if(verify.jp2 == FALSE){
    install.packages("shinycssloaders")
  }

  library(shiny)
  library(shinythemes)
  library(shinycssloaders)

  ui <- fluidPage(
    theme = shinytheme("slate"),
    titlePanel("APP do Curso Desvendando o R na Saúde"),
    sidebarPanel(
      selectInput("select",label=("Selecione:") ,choices = list(
        "Estatistica Descritiva 2" = "estatistica_descritiva_2()",
        "Lei dos grandes números" = "lei_dos_grandes_numeros()"
      )
      ),
      actionButton("show", "Abrir")

    ),
  )

  server <- function(input, output) {
    observeEvent(input$show, {
      # to become input$select, that is character, to a command.
      # See: a<-"1+2"
      # eval(parse(text=a))
      showModal(eval(parse(text=input$select)))
    })

  }

  shinyApp(ui,server)
}





