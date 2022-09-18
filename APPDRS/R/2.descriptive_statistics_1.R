# porcentagem, taxa, razão, taxa de variação.

estatistica_descritiva_1 <- function(){


  verify.jp3 <- require("dplyr")
  if(verify.jp3 == FALSE){
    install.packages("dplyr")
  }

  library(dplyr)

  ui <- fluidPage(
    theme = shinytheme("cosmo"),
    titlePanel("Curso Desvendando o R na Saúde - Estatística Descritiva 1"),
    sidebarLayout(
      sidebarPanel(
        fileInput("csvFile", "Selecione um banco de dados:"),
        selectInput("select", label=("Selecione o método:"),
                    choices=list("Porcentagem" = "",
                                 "Taxa" = "",
                                 "Razão" = "",
                                 "Taxa de Variação" = ""
                    ) # lacking interquartile distance
        ),
        textInput("columnName", label = ("Digite o nome da coluna que você quer analisar:")),
        actionButton("mp", label = "Calcular"),
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

    output$result<-renderText({  a()    })
  }

  return(shinyApp(ui, server))
}













