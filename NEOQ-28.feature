Feature: Integración automatizada entre Jira y GIT para NEOQ-28

  Scenario: Creación de repositorio cuando no existe
    Given un nuevo ticket en Jira
    And no existe un repositorio en GIT con el nombre del ticket
    When se crea el ticket
    Then el sistema debe crear automáticamente el repositorio y vincularlo al ticket

  Scenario: Sincronización rechazada por falta de artefactos
    Given un ticket en Jira con features y scripts incompletos o ausentes
    When se intente sincronizar con GIT
    Then el sistema debe rechazar la sincronización y notificar la falta de artefactos requeridos

  Scenario: Cierre automático con criterios y test cases completos
    Given un ticket en Jira con criterios de aceptación y test cases completos
    And los artefactos están actualizados en el repositorio
    When se cumplan las condiciones de cierre
    Then el sistema debe cerrar automáticamente el ticket y registrar la trazabilidad de la acción
