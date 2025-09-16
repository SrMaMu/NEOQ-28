# NEOQ-28: Integración automatizada entre Jira y GIT

## Resumen ejecutivo
Automatizar el flujo QA permitiendo que, a partir del análisis de historias de usuario en Jira, se generen y versionen automáticamente los features y scripts de testing en el repositorio correspondiente de GIT. Esto asegura trazabilidad, eficiencia y actualización continua entre los requerimientos funcionales y los artefactos de automatización.

## Criterios de aceptación
1. Al crear un ticket en Jira, se debe crear automáticamente un repositorio en GIT con el nombre del ticket si no existe, o reutilizar uno existente si la funcionalidad es compartida.
2. La integración debe permitir la sincronización bidireccional de información relevante entre Jira y GIT (features, scripts, estado de tickets).
3. El sistema debe disparar la sincronización y actualización del repositorio ante la creación de nuevos tickets con sus respectivos tests y features.
4. El cierre automático del ticket solo debe permitirse si existen al menos 4 criterios de aceptación documentados y 3 test cases (positivo, negativo, exploratorio) implementados y versionados en el repositorio.
