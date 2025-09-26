# Changelog

Todos los cambios notables de este proyecto se documentarán en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto se adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2025-09-26]

### Implementación final - *scripts* locales
- feat: sistema simplificado con *script* local generate.sh para conversión confiable de .drawio a PNG
- feat: *workflow* de GitHub Pages solo para despliegue estático desde carpeta public/
- feat: página web generada automáticamente con vista previa de diagramas y URLs para Confluence
- docs: documentación completa del sistema que incluye intentos fallidos con GitHub Actions

### Intentos fallidos con GitHub Actions (documentados para referencia)
- ❌ rlespinasse/drawio-export-action@v2: errores de repositorio shallow
- ❌ Docker con draw.io desktop: exit code 8, problemas de permisos
- ❌ AppImage directo: fallos en entorno headless de GitHub Actions
- ✅ Conclusión: la automatización en CI/CD resultó problemática, la solución local es más confiable

### Migración de estructura
- refactor: eliminación de *workflows* complejos fallidos
- refactor: simplificación de estructura de carpetas (drawio/ → *scripts*/ → public/)
- refactor: separación clara entre generación local y despliegue automático

### Sistema completamente funcional
- feat: instalación exitosa de draw.io desktop v28.1.2 desde RPM oficial
- fix: corrección de manejo de códigos de salida en *script* generate.sh para evitar terminación prematura
- feat: generación exitosa de PNG desde archivos .drawio con página web completa y URLs para Confluence
- docs: justificación técnica empresarial por limitaciones de Confluence y recomendaciones para CDN externo
- docs: documentación de arquitectura separada entre diagramas conceptuales públicos y documentación técnica privada en GitLab
- docs: formato profesional de documentación con encabezados YAML, badges de estado y footer corporativo
- docs: licencia MIT agregada para cumplimiento legal empresarial

### Mejoras de documentación
- docs: simplificación significativa del README.md eliminando información redundante y repetitiva
- docs: aplicación de reglas lingüísticas ~/cot/linguistics.md a README.md, CHANGELOG.md y *scripts*/generate.sh
- docs: corrección de capitalización de títulos a estilo oración, aplicación de cursivas en préstamos técnicos y mejoras de redacción en español mexicano
