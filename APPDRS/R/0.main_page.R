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
    setBackgroundImage(src="https://lh3.googleusercontent.com/GUZsCf8kRLMo1JUOWI-ViUmgPJL3GL9camY7CLETP9a2766wsyjE5vvRN2hEGY0SxK2qX9En9azx4QBBlBpIZ8tLhscqkL-SpHhTlxmrwIQfagE2u2WOQOyPzXPxYJ449GGrSiZaZOywDY5_RsRlOCoFO-AL8X5FuW9hc4R2LbIzjQA9NpRrvjukiSBf9jLpdnX6mJD0bKHZVn84RBrygr0scYjf5N6HLc0m68RFo6NKM6UmFYxJRxS6GBbOONAfQAYyCRSJZa21jR2ckevYx97BX-Ub_87FbLCeFv5ARTKsB7KrDpJBgx49j7etTuqdNi4Hwqym-YE3Y40TeuXAplc5z8t7bTVy_i7R7CC9TQOUcyHaLyZ_dswMDA1zQjFreGKtiIokPpB5PxnUpvHWdOAWIRC4c6egrNcqCC4wOhDiDpxRcAgmIbZprr1AZu8uV0GlFVAa1ZwozW8YS3GjNT0EhNcCkMdhufsl2bcGtUmY1CqYi7kqgEzEm3f7Ah5vTiVfi1ChBS8XIj3HMqwp3_E6e9xWhcBXeLh46Wtsr47nDK12podJ-0PZ-KVoGOTqbQ5hZUDHZB7lqZxwGZzimG9ZubmZCU8TSF5atbRhR5NPakxz0Y4G-XxmBN8jwONDmS_hqJMLH6toT07CO0OsIqRK_OtffG_PwNDjZLAFt2zO9e1P_sah2214ot7xcOT0u9VC6IbTw5cnOvVPxKbdFL7cWo3e3nPI8U1PLXBwPrQiQqV6KCDXSIcvIGnInBibjCvDMRHUU1O4kCvpsxMwUcp2TUppSBbqXQMt4J0UZbqYq1klkkoTzl1IQVBm3CMbVaGYU_HIJwmtmdjourCwU6xY7CgX6sCQgm4TXcpwWOrjDSEwL-8qaIbfQ0hCB3k72L9xlfkALR5ozqayuPYhg4ysvCBKZ1cjLC9-n9pFwqMqWSXrMQ0NOWi55gpEE-3lxX0Me_vY94rqPA=w1083-h609-no?authuser=0"),
    #titlePanel("APP do Curso Desvendando o R na Saúde"),
    fluidRow(column(3,
                    selectInput("select",label=("Teorias:") ,choices = list(
                      "Lei dos grandes números" = "lei_dos_grandes_numeros()",
                      "Teorema do Limite Central" = "qwqwqw",
                      "Lançar dado" = "die()"
                    ))),
             column(3,
                    selectInput("select2",label=("Estatistica Descritiva:") ,choices = list(
                      "Estatística Descritiva 1" = "qwqwqw",
                      "Estatística Descritiva 2" = "estatistica_descritiva_2()"
                    ))),
             column(3,
                    selectInput("select3",label=("Estatistica Inferencial:") ,choices = list(
                      "Est. Proporção e Média" = "qwqwqw",
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






