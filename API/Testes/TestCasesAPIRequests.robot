*** Settings ***
Documentation       Suíte de testes API de CEP com o Robot Framework
Resource            ../Resources/BDDpt-br.robot
Resource            ../Resources/Resource.robot

*** Test Cases ***
Cenário 01: Consulta de endereço existente
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "88036001"
    Então deve ser mostrado o endereço "Rua Lauro Linhares"
    E deve ser mostrado o bairro "Trindade"
    E deve ser mostrada a cidade "Florian\u00f3polis"
    E deve ser mostrada a UF "SC"
    E deve ser mostrado o CEP "88036001"

Cenário 02: Consulta de endereço inexistente
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "99999999"
    Então nenhum dado deve ser mostrado para o CEP "99999999"

Cenário 03: Consulta de CEP inválido
    Dado que esteja conectado no webservice de consultas de CEP
    Quando o usuário consultar o CEP "882010125"
    Então nenhum dado deve ser mostrado para o CEP "882010125"
    E deve ser mostrada a mensagem "VALIDATION_ERROR"