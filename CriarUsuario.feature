Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Rotas de Criar Usuário
        Given url baseUrl
        And path "users"

     Scenario: Criar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")
        
        And request payload
        When method post
        Then status 201
        And match response contains {name: "#(nameUsuario)", email: "#(emailUsuario)"}

    Scenario: Validar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "gmail.com"
        * def payload = read("payloadCriarUsuario.json")
        
        And request payload
        When method post
        Then status 400
        
    Scenario: Usuário já Cadastrado
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        
        And request payload
        When method post
        Then status 201
        And path "users"
        And request payload
        When method post
        Then status 422
        And match response contains {error: "User already exists."}

    Scenario: Quantidade de Caracters por nome
        * def nameUsuario = "DavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidsonDavidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And request payload
        When method post
        Then status 400

    Scenario: Quantidade de caraters por email
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        And request payload
        When method post
        Then status 400




 