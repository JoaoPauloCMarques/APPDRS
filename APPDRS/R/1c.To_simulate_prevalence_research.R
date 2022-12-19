Simular_Pesquisa_de_Prevalencia <- function(){

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
    titlePanel(h4("Simular Pesquisa de Prevalência - Curso Desvendando o R na Saúde (Módulo 1)")),
    sidebarLayout(
      sidebarPanel(
        numericInput("sim", label = ("Digite a quantidade de SIM na população:"), value = 0), # 1
        numericInput("nao", label = ("Digite a quantidade de NÃO na população:"), value = 0), # 1
        actionButton("btn_population", label = ("Criar População e Ver a Porcentagem de SIM"),  value = 0 ), # 1
        hr(),

        numericInput("sample_size", label = ("Informe o Tamanho da Amostra que Deseja Retirar"), value = 0), # 2
        actionButton("btn_sample_size", label = ("Retirar Amostra Aleatória e Calcular Porcentagem de SIM"),  value = 0 ), # 2
        #hr(),

        #actionButton("btn_error", label = ("Calcular Margem de Erro da Amostra"),  value = 0 ), # 3


      ),
      mainPanel(
        textOutput("population_porcentage_text"), # 1
        verbatimTextOutput("population_porcentage_number"), # 1

        textOutput("sample_porcentage_text"), # 2
        verbatimTextOutput("sample_porcentage_number"), # 2

       # textOutput("error_text"), # 3
      #  verbatimTextOutput("error_number"), # 3

       # textOutput("low_limit_text"), # 3
      #  verbatimTextOutput("low_limit_number"), # 3

       # textOutput("upper_limit_text"), # 3
      #  verbatimTextOutput("upper_limit_number"), # 3


      )
    )
  )

  server <- function(input,output,session){
    freq_yes <- eventReactive(input$btn_population, {input$sim}) # 1
    freq_no <- eventReactive(input$btn_population,{input$nao}) # 1
    porc_result <- eventReactive(input$btn_population, {round( (freq_yes()/sum(freq_yes(),freq_no())) * 100, digits=2)})
    output$population_porcentage_text <- renderText({"Porcentagem na População: "}) # 1
    output$population_porcentage_number <- renderText({porc_result()   }) # 1

    sample_size_user <- eventReactive(input$btn_sample_size,{input$sample_size}) #2
    sample_porc <- eventReactive(input$btn_sample_size,{ create_yes_no( freq_yes(), freq_no(), sample_size_user() )  }) # 2
    output$sample_porcentage_text <- renderText({"Porcentagem na Amostra: "})#2
    output$sample_porcentage_number<-renderText({sample_porc()})#2

    #sample_prop <-eventReactive(input$btn_error,{ sample_porc() / 100 }   )#3
    #error_jp <- eventReactive(input$btn_error,{sqrt( (sample_prop()* (1-sample_prop())) / length(  sample_size_user() ) )})#3
    #low_porc <- eventReactive(input$btn_error,{  (sample_prop() - (error_jp()  * 2 )) * 100   })#3
    #upper_porc <- eventReactive(input$btn_error,{  (sample_prop() + (error_jp() * 2)) * 100  })#3

    #output$low_limit_text<-renderText({"Limite Inferior: "}) #3
    #output$low_limit_number<-renderText({ low_porc()  }) #3

    #output$upper_limit_text<-renderText({"Limite Superior: "}) #3
    #output$upper_limit_number<-renderText({ upper_porc()  }) #3

  }

  return(shinyApp(ui,server))

}
