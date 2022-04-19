Feature: Hook

    Scenario: Criar Usuário
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")
    
        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201
