Lei_dos_Grandes_Numeros <- function(){

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


  shinyApp(
    ui <- fluidPage(
      theme = shinytheme("darkly"),
      titlePanel(h3("Lei dos Grandes Números - Curso Desvendando o R na Saúde (Módulo 1)")),
      sidebarLayout(
        sidebarPanel(
          # Copy the line below to make a number input box into the UI.
          numericInput("sim", label = ("Digite a quantidade de SIM na população:"), value = 0), #I make the number box.
          numericInput("nao", label = ("Digite a quantidade de NÃO na população:"), value = 0),
          numericInput("amostragem", label = ("Digite a quantidade de amostragem:"), value = 0),
          #numericInput("escala", label = h6("Informe a escala do eixo x do gráfico:"), value = 0),
          actionButton("mp", label = "Realizar Pesquisa e Mostrar Gráfico"),
          #actionButton("mp2", label = "Gerar Gráfico"),
        ),
        mainPanel(
          textOutput("secund"),
          verbatimTextOutput("first"),
          #uiOutput("third"),
          withSpinner(plotOutput("jp_graph",width = "100%",height = "400px"), type = 8, size = 0.4)
        )
      )
    ),
    server <- function(input, output, session) {
      # You can access the value of the widget with input$num, e.g.
      n_sim<-eventReactive(input$mp, {input$sim}  )
      n_nao<-eventReactive(input$mp, {input$nao  }  )
      n_amostragem <- eventReactive(input$mp, {input$amostragem  }  )

      sampling.distribution<-eventReactive(input$mp, { law( n_sim(), n_nao(), n_amostragem()) }  )
      porc.jp<-eventReactive(input$mp,{ round((n_sim() / (sum(n_sim(),n_nao()))) * 100, digits = 2) })
      texto.jp<-eventReactive(input$mp, {"Percentual populacional: "})
      output$secund<-renderText({texto.jp()})
      output$first<-renderText({ porc.jp()})
      #text.reactive3<-eventReactive(input$action,{mean(c(input$num,input$num2))})
      #output$secund<-renderText({text.reactive2()})
      #text.reactive2 <- eventReactive(input$action,{c("Hello ", input$text_jp)})
      output$jp_graph<-renderPlot({ plot(1:n_amostragem(), sampling.distribution(), type="l", xlab = "n", ylab = "% amostral" )
        abline(h=(n_sim() / (sum(n_sim(),n_nao()))) * 100, col="red") })
    }
  )
}
