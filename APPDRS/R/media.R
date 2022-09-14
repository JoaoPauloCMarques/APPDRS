B.media_aritmetica <- function(){

  verify.jp1 <- require("shiny")
  if(verify.jp1 == FALSE){
    install.packages("shiny")
  }

  verify.jp2 <- require("shinycssloaders")
  if(verify.jp2 == FALSE){
    install.packages("shinycssloaders")
  }

  verify.jp3 <- require("dplyr")
  if(verify.jp3 == FALSE){
    install.packages("dplyr")
  }

  library(shiny)
  library(shinycssloaders)
  library(dplyr)

  ui <- fluidPage(
    theme = bslib::bs_theme(bootswatch = "superhero"),
    titlePanel("Curso Desvendando o R na Saúde - Média Aritmética"),
    sidebarLayout(
      sidebarPanel(
        fileInput("csvFile", "Selecione um banco de dados"),
        textInput("columnName", label = ("Digite o nome da coluna que você quer analisar")),
        actionButton("mp", label = "Calcular Média"),
        verbatimTextOutput("result")
      ),

      mainPanel(
        tableOutput("dataset")
      )
    )
  )

  server <- function(input, output, session) {

    jpData <- eventReactive(input$csvFile,{
      read.csv(input$csvFile$datapath)
    })

    output$dataset<-renderTable({jpData()})

    CN <- eventReactive(input$mp,{
      select(jpData(), input$columnName)  })

    mediajp <- eventReactive(input$mp,{
      jp_cpp_media( CN()[,1] )
    })

    output$result<-renderText({mediajp()})

  }

  shinyApp(ui, server)
}


