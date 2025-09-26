# Changelog

Todos los cambios notables de este proyecto se documentarán en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto se adhiere a [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2025-09-26]

- feat: configuración inicial del sistema de generación automatizada de diagramas con GitHub Actions y Pages para integración con Confluence
- fix: simplificación del workflow de GitHub Actions para optimizar velocidad y confiabilidad del despliegue
- fix: resolución de error de repositorio shallow y cambio a solución Docker más confiable
- fix: creación de página estática básica para establecer GitHub Pages funcionando antes de implementar conversión
- feat: implementación de conversión automática de archivos .drawio a PNG con visualización en página web y URLs para Confluence
- fix: corrección del formato XML del archivo .drawio para compatibilidad completa con herramientas de conversión
- fix: cambio a instalación directa de draw.io desktop para conversión confiable usando AppImage y xvfb
