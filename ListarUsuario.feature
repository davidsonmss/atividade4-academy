Feature: Listar Usúario
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

Scenario: Consultar todos os usuários
    Given url baseUrl 
    And path "users"
    When method get
    Then status 200
    And match each response contains { id: '#string', name: '#string', email: '#string', createdAt: '#string', updatedAt: '#string'}



 