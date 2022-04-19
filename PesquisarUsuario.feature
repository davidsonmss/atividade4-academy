Feature: Pesquisar Usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: Buscar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        Given url baseUrl
        And path "search"
        And request payload
        When method get
        Then status 200
        
        