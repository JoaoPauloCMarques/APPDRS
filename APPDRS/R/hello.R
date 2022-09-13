# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


lei.dos.grandes.numeros.jpcm2 <- function(){
  verify.jp1 <- require("shiny")
  if(verify.jp1 == FALSE){
    install.packages("shiny")
  }

  verify.jp2 <- require("shinycssloaders")
  if(verify.jp2 == FALSE){
    install.packages("shinycssloaders")
  }

  library(shiny)
  library(shinycssloaders)

  law <- function(x,y,z){
    a<-rep("Sim", times=x)
    b<-rep("Não", times=y)
    populacao<-c(a,b)
    b<-c()
    for(i in 1:z){
      n<-sample(populacao,i)
      j<-table(n)
      if (length(j) == 1 & names(j)[1] == "Não"  ){
        porcentagem_de_sim <- 0
      }else if(length(j) == 1 & names(j)[1] == "Sim") {
        porcentagem_de_sim <- 100
      }else if (length(j) == 2) { porcentagem_de_sim <- ( (j[2]/sum(j)) ) * 100}
      b<-append(b,porcentagem_de_sim)
    }
    return(b)
  }

  shinyApp(
    ui <- fluidPage(
      theme = bslib::bs_theme(bootswatch = "superhero"),
      titlePanel("Curso Desvendando o R na Saúde - Lei dos Grandes Números"),
      sidebarLayout(
        sidebarPanel(
          # Copy the line below to make a number input box into the UI.
          numericInput("sim", label = h6("Digite a quantidade de SIM na população:"), value = 0), #I make the number box.
          numericInput("nao", label = h6("Digite a quantidade de NÃO na população:"), value = 0),
          numericInput("amostragem", label = h6("Digite a quantidade de amostragem:"), value = 0),
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

abcd<-function(x,y,z){
  a<-c(x,y,z)
  return(media_joao(a))
}


hello <- function() {
  print("Hello, world JP!")
}
