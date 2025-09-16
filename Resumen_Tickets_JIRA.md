# Resumen de Tickets JIRA

## Ticket: NEOQ-28

**Resumen:** Integracion de Jira con Repos de GIT

**Tipo de Issue:** Tarea

**Fecha de Creación:** 2025-09-16

**Descripción:**
Automatizar el flujo QA permitiendo que, a partir del análisis de historias de usuario en Jira, se generen y versionen automáticamente los features y scripts de testing en el repositorio correspondiente de GIT. Esto asegura trazabilidad, eficiencia y actualización continua entre los requerimientos funcionales y los artefactos de automatización.

**Prioridad:** Media

**Estado:** Tareas por hacer

### Mejoras y factores a considerar:
1. Para cada ticket, buscar un repositorio en GIT cuyo nombre coincida con la clave del ticket de Jira (ej: NEOQ-28). Si no existe, crear automáticamente un nuevo repositorio con ese nombre. Si la funcionalidad lo requiere, permitir agrupar varios tickets en un mismo repositorio.
2. La integración debe ser bidireccional: los cambios relevantes deben sincronizarse tanto desde Jira hacia GIT como desde GIT hacia Jira.
3. Eventos clave a sincronizar: push y pull de código, creación/actualización de features y scripts, y cierre automático del ticket solo si el mismo fue refinado, cuenta con criterios de aceptación y test cases, y el repositorio fue actualizado.
4. El cierre automático del ticket en Jira solo debe permitirse si se cumplen las precondiciones de refinamiento, criterios de aceptación y subida de artefactos QA.
5. Toda la gestión de Jira y GIT se realizará a través del MCP, centralizando autenticación, permisos y automatización.
6. La solución será desarrollada desde cero, aprovechando las capacidades del MCP para la integración y automatización.

**Notas adicionales:**
- No se utilizarán herramientas previas; la solución será personalizada y escalable.
- Se prioriza la trazabilidad, la automatización y la alineación entre requerimientos y artefactos QA.

### ¿La información es suficiente para avanzar?
La descripción es clara y detallada, pero se requiere validar los siguientes puntos para avanzar:

#### Preguntas para el usuario:
1. ¿Existe ya algún repositorio en GIT con el nombre "NEOQ-28" o se debe crear uno nuevo?
2. ¿Se debe permitir agrupar varios tickets en un mismo repositorio, o cada ticket debe tener su propio repo?
3. ¿Qué eventos específicos deben disparar la sincronización entre Jira y GIT?
4. ¿Qué criterios de aceptación y test cases se consideran mínimos para permitir el cierre automático del ticket?
5. ¿Hay alguna restricción de seguridad, permisos o compliance para la integración MCP-Jira-GIT?
6. ¿Qué lenguajes y frameworks deben soportar los scripts y features generados?

### Respuestas del refinamiento (usuario):
1. Se debe crear un nuevo repositorio si no existe. Si la funcionalidad es la misma, varios tickets pueden compartir el mismo repo; de lo contrario, cada ticket debe tener su propio repositorio.
2. Si la funcionalidad es la misma puede usarse el mismo repo, pero si no existe ninguno se debe crear uno nuevo.
3. La creación de una nueva tarjeta (ticket) con sus tests y features asociados es motivo suficiente para sincronización y actualización del repositorio.
4. Para el cierre automático del ticket se requieren criterios de aceptación completos (mínimo 4) y al menos 3 test cases: uno positivo, uno negativo y uno exploratorio.
5. No existen requisitos de seguridad, permisos o compliance adicionales para la integración MCP-Jira-GIT.
6. Los scripts de automatización deben soportar Robot Framework y los features deben estar escritos en Gherkin.

---

**Observaciones refinadas:**
- El proceso de integración y sincronización será disparado automáticamente ante la creación de nuevos tickets con sus respectivos tests/features.
- La gestión de repositorios será dinámica: se reutilizarán repos existentes solo si la funcionalidad es compartida, priorizando la trazabilidad.
- El cierre automático del ticket estará condicionado a la existencia de al menos 4 criterios de aceptación y 3 test cases (positivo, negativo, exploratorio).
- No hay restricciones de seguridad adicionales, lo que facilita la integración MCP-Jira-GIT.
- Se estandariza el uso de Robot Framework para automatización y Gherkin para features.

### Criterios de Aceptación
1. Al crear un ticket en Jira, se debe crear automáticamente un repositorio en GIT con el nombre del ticket si no existe, o reutilizar uno existente si la funcionalidad es compartida.
2. La integración debe permitir la sincronización bidireccional de información relevante entre Jira y GIT (features, scripts, estado de tickets).
3. El sistema debe disparar la sincronización y actualización del repositorio ante la creación de nuevos tickets con sus respectivos tests y features.
4. El cierre automático del ticket solo debe permitirse si existen al menos 4 criterios de aceptación documentados y 3 test cases (positivo, negativo, exploratorio) implementados y versionados en el repositorio.

### Test Cases (Gherkin en inglés, escenarios en castellano)

**TC1 - Creación y vinculación de repositorio (Positivo)**
Feature: Creación automática de repositorio para ticket nuevo
  Scenario: Creación de repositorio cuando no existe
    Given un nuevo ticket en Jira
    And no existe un repositorio en GIT con el nombre del ticket
    When se crea el ticket
    Then el sistema debe crear automáticamente el repositorio y vincularlo al ticket

**TC2 - Sincronización de features y scripts (Negativo)**
Feature: Validación de artefactos antes de sincronizar
  Scenario: Sincronización rechazada por falta de artefactos
    Given un ticket en Jira con features y scripts incompletos o ausentes
    When se intente sincronizar con GIT
    Then el sistema debe rechazar la sincronización y notificar la falta de artefactos requeridos

**TC3 - Cierre automático del ticket (Exploratorio)**
Feature: Cierre automático basado en condiciones QA
  Scenario: Cierre automático con criterios y test cases completos
    Given un ticket en Jira con criterios de aceptación y test cases completos
    And los artefactos están actualizados en el repositorio
    When se cumplan las condiciones de cierre
    Then el sistema debe cerrar automáticamente el ticket y registrar la trazabilidad de la acción
