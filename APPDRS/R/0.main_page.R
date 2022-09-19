APP_DESVENDANDO_O_R_NA_SAUDE <- function(){

  verify.jp1 <- require("shiny")
  if(verify.jp1 == FALSE){
    install.packages("shiny")
  }

  verify.jp2 <- require("shinythemes")
  if(verify.jp2 == FALSE){
    install.packages("shinythemes")
  }

  verify.jp3 <- require("shinyWidgets")
  if(verify.jp3 == FALSE){
    install.packages("shinyWidgets")
  }

  verify.jp4 <- require("shinycssloaders")
  if(verify.jp4 == FALSE){
    install.packages("shinycssloaders")
  }

  library(shiny)
  library(shinythemes)
  library(shinyWidgets)
  library(shinycssloaders)

  ui <- fluidPage(
    theme = shinytheme("darkly"),
    #setBackgroundImage(src="logo.png"), # HERE
    titlePanel("DRS", windowTitle = "DRS"),
    fluidRow(column(3,
                    selectInput("select",label=("Teorias:") ,choices = list(
                      "Lei dos grandes números" = "lei_dos_grandes_numeros()",
                      "Teorema do Limite Central" = "qwqwqw"

                    ))),
             column(3,
                    selectInput("select2",label=("Estatistica Descritiva:") ,choices = list(
                      "Porcentagem" = "porc()",
                      "Medidas de Tendência Central e Dis." = "med_tendencia_central_dis()"
                    ))),
             column(3,
                    selectInput("select3",label=("Estatistica Inferencial:") ,choices = list(
                      "Estetimativa de Proporção e Média" = "qwqwqw",
                      "Teste Z de uma Proporção" = "qwqw",
                      "Realizar Amostragem" = "qwqwer"
                    )))
    ),
    fluidRow(column(3,
            actionButton("show", "Abrir")
    ),
    column(3,
           actionButton("show2", "Abrir")
    ),
    column(3,
           actionButton("show3", "Abrir")
    )
    )

  )

  server <- function(input, output) {
    observeEvent(input$show, {
      # to become input$select, that is character, to a command.
      # See: a<-"1+2"
      # eval(parse(text=a))
      showModal(eval(parse(text=input$select)))
    })

    observeEvent(input$show2, {
      # to become input$select, that is character, to a command.
      # See: a<-"1+2"
      # eval(parse(text=a))
      showModal(eval(parse(text=input$select2)))
    })

    observeEvent(input$show3, {
      # to become input$select, that is character, to a command.
      # See: a<-"1+2"
      # eval(parse(text=a))
      showModal(eval(parse(text=input$select3)))
    })
  }
  shinyApp(ui,server)
}






