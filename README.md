---
title: incognia Diagrams Repository - Sistema de generación automática
date: 2025-09-26
author: Rodrigo Ernesto Álvarez Aguilera
tags: diagrams, drawio, confluence, github-pages, automation, png, devops, documentation
---

![PROMAD logo](https://hedgedoc.promad.com.mx:31418/uploads/eac9bca0-66f5-463e-9ccb-8813341a549c.png)

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Active-brightgreen?logo=github)](https://incogniadev.github.io/Diagrams/)
[![Draw.io Desktop](https://img.shields.io/badge/Draw.io%20Desktop-v28.1.2-orange?logo=diagramsdotnet)](https://github.com/jgraph/drawio-desktop)
[![Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)](public/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

# 📊 incognia Diagrams Repository

*Última modificación: 26 de septiembre de 2025, 11:49 (CST)*

Sistema de generación local y despliegue automático de diagramas PNG desde archivos draw.io para integración con Confluence. Utiliza draw.io desktop local para conversión confiable y GitHub Pages para servir las imágenes.

## ⚠️ Consideraciones técnicas

### Justificación de la solución
**Problemática**: Confluence presenta soporte limitado para diagramas profesionales (sin Mermaid nativo, renderizado inadecuado de ASCII, plugins limitados).

**Solución**: Sistema PNG con draw.io desktop que garantiza compatibilidad universal, renderizado consistente y calidad profesional.

### Limitaciones de seguridad
**IMPORTANTE**: Repositorio público para GitHub Pages. Solo usar para:
- ⚠️ Diagramas conceptuales sin información sensible
- ⚠️ Referencias y mapas conceptuales generales
- ⚠️ **Nunca incluir datos confidenciales empresariales**

### Arquitectura de documentación
- **Este repositorio**: Diagramas de referencia conceptual (público)
- **GitLab Corporativo**: Documentación técnica detallada (privado)

### Recomendación empresarial
Para diagramas sensibles considerar: CDN privado, infraestructura propia, o mantener separación en GitLab corporativo.

## ℹ️ Decisión técnica

**Problema**: GitHub Actions para conversión draw.io resultó inestable (errores de repositorio, permisos, entornos headless).

**Solución**: Scripts locales con draw.io desktop + despliegue estático. Más simple, confiable y con control total.

## 🏗️ Estructura simplificada

```
Diagrams/
├── drawio/           # Archivos fuente .drawio
├── scripts/          # Script de generación local
├── public/           # PNG generados + página web
└── .github/workflows/deploy.yaml  # Solo despliegue estático
```

## 🚀 Uso

### 1. Prerrequisitos
- Instalar [draw.io desktop](https://github.com/jgraph/drawio-desktop/releases)
- Asegúrate de que `drawio` esté disponible en PATH

### 2. Agregar Diagramas
- Coloca los archivos `.drawio` en la carpeta `drawio/`
- Usa nombres sin espacios: `system-architecture.drawio`

### 3. Generar PNG y página web
```bash
./scripts/generate.sh
```

Este script:
- ✅ Convierte todos los `.drawio` a PNG usando draw.io desktop
- ✅ Genera página web con preview y URLs
- ✅ Limpia archivos anteriores
- ✅ Proporciona feedback visual del proceso

### 4. Desplegar
```bash
git add .
git *commit* -m "Update diagrams"
git push
```

GitHub Pages despliega el contenido automáticamente desde la carpeta `public/`.

## 🌐 URLs para Confluence

Los diagramas están disponibles en:
```
https://incogniadev.github.io/Diagrams/nombre-diagrama.png
```

### Ejemplo de uso en Confluence:
```html
<img src="https://incogniadev.github.io/Diagrams/example-system.png" alt="System Architecture" />
```

## ⚙️ Características

**Ventajas**: Confiable, simple (un comando), control total, rápido, debugging inmediato.

**Limitaciones**: Requiere ejecución manual local y draw.io desktop instalado.

## 🔧 Solución de problemas

### "drawio command not found"
```bash
# Verificar instalación
which drawio
drawio --version

# Si no está instalado, descargar desde:
# https://github.com/jgraph/drawio-desktop/releases
```

### Los PNG no se generan
- Verificar el formato de los archivos `.drawio` (deben ser XML válido)
- Probar abrir y guardar el archivo en draw.io desktop
- Revisar los permisos de escritura en la carpeta `public/`

### GitHub Pages no actualiza
- Confirmar que el repositorio es público
- Verificar que `public/` contiene `index.html` y los archivos PNG
- Revisar la pestaña Actions para errores de despliegue

## 🚀 Workflow

1. **Editar**: Crear/editar diagramas con draw.io desktop
2. **Generar**: `./scripts/generate.sh`
3. **Verificar**: Abrir `public/index.html` localmente
4. **Desplegar**: `git add . && git *commit* && git push`
5. **Usar**: URLs disponibles en Confluence

## 📞 Soporte y contacto

**Solución de problemas**: Verifica `drawio --version`, revisa la salida del script, valida el XML de los archivos .drawio.

**Autor**: Rodrigo Ernesto Álvarez Aguilera - Ingeniero DevOps  
**Correo**: [ralvarez@promad.com.mx](mailto:ralvarez@promad.com.mx)  
**Teléfono**: +52 (55) 7980-9502

**Contribuciones**: *Fork* → *Branch* → Documentar cambios → *Pull Request*

**Tarea Jira**: [AVAMVP-1860](https://avite.atlassian.net/browse/AVAMVP-1860)

---

**Versión**: 1.0.0 | **Estado**: ✅ Funcional | **Última actualización**: 26 de septiembre de 2025, 11:49 (CST)

## Licencia

MIT License - Promad Business Solutions, Equipo DevOps. Ver [LICENSE](LICENSE) para detalles.

*Copyright © 2025, Promad Business Solutions - Equipo DevOps*
