Teorema_do_Limite_Central <- function(){

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
  #library(multicon)

  ui <- fluidPage(
    theme = shinytheme("darkly"),
    titlePanel(h4("Teorema do Limite Central - Curso Desvendando o R na Saúde (Módulo 1)")),
    sidebarLayout(
      sidebarPanel(
        numericInput("sim", label = ("Digite a quantidade de SIM na população:"), value = 0),
        numericInput("nao", label = ("Digite a quantidade de NÃO na população:"), value = 0),
        numericInput("amount_of_sample", label = ("Retirar Quantas Amostras de Forma Aleatória da População?"), value = 0),
        numericInput("n", label = ("Tamanho de Cada Amostra:"), value = 0),
        actionButton("btn",label = "Iniciar"),
      ),
      mainPanel(
        textOutput("text"),
        verbatimTextOutput("text_2"),
        textOutput("text_3"),
        verbatimTextOutput("text_4"),
        withSpinner(plotOutput("jp_graph", width = "100%",height = "400px"), type = 8, size = 0.4)
      )
    )
  )

  server <- function(input,output,session){
    freq_yes <- eventReactive(input$btn, {input$sim})
    freq_no <- eventReactive(input$btn,{input$nao})
    amount_sam <- eventReactive(input$btn,{input$amount_of_sample})
    n_each_sam <- eventReactive(input$btn,{input$n})

    pop_porc <- eventReactive(input$btn,{   round( (freq_yes()/sum(freq_yes(),freq_no())) * 100, digits=2)})
    texto_jp<-eventReactive(input$btn, {"Percentual Populacional: "})
    texto_jp_2<-eventReactive(input$btn, {"Desvio Padrão: "})
    #jp_pop_sd<-eventReactive(input$btn, {popsd(CLT( freq_yes(), freq_no(), n_each_sam(), amount_sam())   )  })
    output$text<-renderText({ texto_jp()  })
    output$text_2<-renderText({pop_porc() })
    output$text_3<-renderText({texto_jp_2() })
    output$text_4<-renderText({sd(CLT( freq_yes(), freq_no(), n_each_sam(), amount_sam()))  })
    output$jp_graph<-renderPlot({ hist( CLT( freq_yes(), freq_no(), n_each_sam(), amount_sam()), ylab="Frequência",xlab="Porcentagem da Amostra", main="Distribuição de Amostragem" )
                                abline(v= pop_porc()+(sd(CLT( freq_yes(), freq_no(), n_each_sam(), amount_sam())) * 2), col='red', lwd=3,lty='dashed')
                                abline(v= pop_porc()-(sd(CLT( freq_yes(), freq_no(), n_each_sam(), amount_sam())) * 2), col='red', lwd=3,lty='dashed')
                                abline(v= pop_porc(), col='blue', lwd=3,lty='dashed')
                                })
  }

  return(shinyApp(ui,server))

}


