Feature: Encontrar Usuário ID
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

Scenario: Buscar usuário por ID
        * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
        * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
        * def payload = read("payloadCriarUsuario.json")

        #Criar um usuário
        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201
        * def usuarioId = response.id 

        #Buscando o usuário que acabei de criar
        Given url baseUrl
        And path "users", usuarioId
        When method get
        Then status 200

Scenario: Usuário não localizado      
        Given url baseUrl
        And path "users", java.util.UUID.randomUUID()
        When method get
        Then status 404
