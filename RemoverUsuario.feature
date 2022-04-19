Feature: Remover Usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

Scenario: Deletar Usuário
    * def nameUsuario = "Davidson" + java.util.UUID.randomUUID()
    * def emailUsuario = java.util.UUID.randomUUID() + "@gmail.com"
    * def payload = read("payloadCriarUsuario.json")

    Given url baseUrl
    And path "users"
    And request payload
    When method post
    Then status 201
    * def usuarioId = response.id 

    Given url baseUrl
    And path "users", usuarioId
    When method delete
    Then status 204
    