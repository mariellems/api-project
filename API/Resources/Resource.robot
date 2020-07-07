*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${HOST}         https://financeiro.hostgator.com.br/api/v3/checkout/cep/

*** Keywords ***
#### DADO
Que esteja conectado no webservice de consultas de CEP
    Conecta ao WebService

#### QUANDO
O usuário consultar o CEP "${CEP_CONSULTADO}"   
    Realiza requisição do CEP   ${CEP_CONSULTADO}

#### ENTÃO
Deve ser mostrado o endereço "${ADDRESS1}"
    Confere o status code       200
    Confere endereço do CEP     ${ADDRESS1}

Deve ser mostrado o bairro "${ADDRESS2}"
    Confere bairro do CEP       ${ADDRESS2}

Deve ser mostrada a cidade "${CITY}"  
    Confere cidade do CEP       ${CITY}

Deve ser mostrada a UF "${STATE}"  
    Confere UF do CEP       ${STATE}    

Deve ser mostrado o CEP "${POSTCODE}"
    Confere CEP       ${POSTCODE}

Nenhum dado deve ser mostrado para o CEP "${CEP}"
    Confere o status code       200
    Confere endereço do CEP     ${EMPTY}
    Confere bairro do CEP       ${EMPTY}
    Confere cidade do CEP       ${EMPTY}
    Confere UF do CEP           ${EMPTY}
    Confere CEP                 ${CEP}

Deve ser mostrada a mensagem "${LEVEL}"
    Confere mensagem       ${LEVEL}

#### PASSOS    
Conecta ao WebService
    Create Session      consultaCEP     ${HOST}

Realiza requisição do CEP
    [Arguments]         ${CEP_DESEJADO}
    ${RESPOSTA}=        Get Request  consultaCEP  /${CEP_DESEJADO}           
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere o status code
    [Arguments]     ${HTTP_STATUS_CODE}
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere endereço do CEP
    [Arguments]         ${ADDRESS1}         
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere bairro do CEP
    [Arguments]         ${ADDRESS2}          
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Confere cidade do CEP
    [Arguments]         ${CITY}  
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA} 

Confere UF do CEP
    [Arguments]         ${STATE}      
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}   

Confere CEP
    [Arguments]         ${POSTCODE}        
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}     

Confere mensagem
    [Arguments]         ${LEVEL}        
    Log                 Resposta: ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}   
