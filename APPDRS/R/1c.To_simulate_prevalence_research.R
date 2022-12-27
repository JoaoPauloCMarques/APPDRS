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
        actionButton("btn_sample_size", label = ("Retirar Amostra Aleatória"),  value = 0 ), # 2
        #hr(),

        #actionButton("btn_error", label = ("Calcular Margem de Erro da Amostra"),  value = 0 ), # 3


      ),
      mainPanel(
        textOutput("population_size_text"), # 4
        verbatimTextOutput("population_size"), # 4

        textOutput("population_porcentage_text"), # 1
        verbatimTextOutput("population_porcentage_number"), # 1

        textOutput("sample_porcentage_text"), # 2
        verbatimTextOutput("sample_porcentage_number"), # 2

        textOutput("sample_freq_no_text"), # 3
        verbatimTextOutput("sample_freq_no"), # 3



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
    output$population_size_text <- renderText({"Tamanho da População:"}) #4
    output$population_size <- renderText({freq_yes() + freq_no()})#4
    output$population_porcentage_text <- renderText({"Porcentagem na População: "}) # 1
    output$population_porcentage_number <- renderText({porc_result()   }) # 1

    sample_size_user <- eventReactive(input$btn_sample_size,{input$sample_size}) #2
    sample_freq <- eventReactive(input$btn_sample_size,{ create_yes_no( freq_yes(), freq_no(), sample_size_user() )  }) # 2
    output$sample_porcentage_text <- renderText({"Frequência de SIM na Amostra: "})#2
    output$sample_porcentage_number<-renderText({sample_freq()})#2


    output$sample_freq_no_text <- renderText({"Frequência de NÃO na Amostra:"}) #3
    output$sample_freq_no <- renderText({sample_size_user()  - sample_freq()}) #3



  }

  return(shinyApp(ui,server))

}
