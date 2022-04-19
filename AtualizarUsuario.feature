Feature: Atualizar ID
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

Background: Atualizar Usuário Cadastrado 
    Given url baseUrl
    And path "users"
   
    * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
    * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
    * def payload = read("payloadCriarUsuario.json")
    #Criar Usuário 
    And request payload
    When method post
    Then status 201
    * def usuarioId = response.id 
    And path "users"

    Scenario: Atualizar Usuário por ID
       
        #Atualizar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")
        And path usuarioId
        And request payload
        When method put
        Then status 200

    Scenario: Validar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And path usuarioId
        And request payload
        When method put
        Then status 400
        
    Scenario: Usuário já Cadastrado
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And request payload
        When method post
        Then status 201

        Given path "users", usuarioId
        And request payload
        When method put
        Then status 422
        And match response contains {error: "E-mail already in use."}

    Scenario: Quantidade de Caracters por nome
        * def nameUsuario = "DavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And path usuarioId
        And request payload
        When method put
        Then status 400

    Scenario: Quantidade de caraters por email
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And path usuarioId
        And request payload
        When method put
        Then status 400




    
