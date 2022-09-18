# Medidas de tendência central e medidas de dispersão.
estatistica_descritiva_2 <- function(){


  verify.jp3 <- require("dplyr")
  if(verify.jp3 == FALSE){
    install.packages("dplyr")
  }

  library(dplyr)

  ui <- fluidPage(
    theme = shinytheme("darkly"),
    titlePanel("Estatística Descritiva 2"),
    sidebarLayout(
      sidebarPanel(
        fileInput("csvFile", "Selecione um banco de dados:"),
        selectInput("select", label=("Selecione o método:"),
                    choices=list("Média" = "round(jp_cpp_media( CN()[,1]), digits=1)",
                                 "Mediana" = "round(median(CN()[,1]),digits=1 )",
                                 "Moda" = "jp_mode(CN()[,1])",
                                 "Desvio Padrão" = "round(sd(CN()[,1]), digits=1)"
                                 ) # lacking interquartile distance
                    ),
        textInput("columnName", label = ("Digite o nome da coluna que você quer analisar:")),
        actionButton("mp", label = "Calcular"),
        hr(),
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

    CN <- eventReactive(input$mp,{         # CN is the key variable.
      select(jpData(), input$columnName)  })

    #commands <- "a <- rep(c(1,2,4),4)"
    #eval(parse(text = commands))
    #a
    a<-eventReactive(input$mp,{
      eval(parse(text=input$select))  # to become input$select, that is character, to a command.
    })

    output$result<-renderPrint({  a()    })
  }

  return(shinyApp(ui, server))
}












