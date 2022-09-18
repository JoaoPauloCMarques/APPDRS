die<-function(){
  ui <- fluidPage(
    theme = shinytheme('darkly'),

    sidebarLayout(
      sidebarPanel(
        actionButton("mp", label="Lançar Dado"),
        hr(),
        verbatimTextOutput("result")
      ),
      mainPanel(
        hr(),
        hr(),
        img(src='https://lh3.googleusercontent.com/aPIc9dspJEMlwkJi_aSZX_r1K6tysYnhTufS040Qm5jRtndjg2hjPZ_I9JRH0lUWbnHv0Fq88fAApPsTsKSEKzLll7nYgR_BChK0awJE7IkuH5K4DvyPM7AsGePiSRb_xNiqUatwWexLVvHlVDAqyZjHUMeGnxgeW2Be8eFv_sSdGU4II0kyITXtxTV2vbb-1sfH0jhDyXWs0UeeHMMD5wS5SdV_FunvtoVrLGXFMBzC4mVbn5Uk8hd4gFjmeXYeThOsbyID2RAUDLa3QQ2nPFOW0imM1KfcTotYDvgNoo7hjCQRV0f9hUiZVw33Ts8LszHLY7I13EoX7bC3FEQgh1C8YM_N4aIWGY0IDTzAbX-7F0SiFrsf3PssmiP_LHWR0RmVK-1ABsRK0KrVa6Z8QZaY51iR5EOlS2EAlomnNZm07Ge8Gw2P34Wz-K-ubBKI3Ma3WEYJncN6vkok_gTVDVRLLhlZyPRnrgqS2r7etQjyb6SrJf_8oLN5sMtB6AV5tEgOeN60er-zP9IdDLual7HLfK3nwpPTqi7rqZkWhuMQ9Ip6tgPNs_mA0VGXaZgB6zd7RPJ9D78TzHrhEZUZWteRFDPhaAc5m2iB9EXqXGfoMGaM8BsiTeqgIM1xkeUSCCmLnrH-N2YndauJam89TZ-g9eBqc6E6lET0tFSOwFuqFq64H3o5jXXyS5uXxBSdLZbnBwUc8A7O7Tw4HfPjbeKsS6KbtnX_fCS0T5W8h_UKMmsqR2FX60ZxaAk0wqQJeVXOOZyJNorKdA4HqRlI4yRz29jtm7DZmhM=w831-h296-no?authuser=0')
      )
    )
  )

  server <- function(input, output, session){

    a<-eventReactive(input$mp,{
      sample(c("Um","Dois","Três","Quatro","Cinco","Seis"),1)
    })

    output$result<-renderText({a()})
  }

  shinyApp(ui,server)
}

