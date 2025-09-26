# 📊 incognia Diagrams Repository

Repositorio para generar y servir diagramas PNG desde archivos draw.io para uso en Confluence.

## ⚠️ Justificación Técnica y Limitaciones

### Problemática de Confluence
Confluence presenta **soporte muy limitado** para diagramas profesionales:
- ❌ **Sin soporte nativo** para Mermaid o diagramas como código
- ❌ **Renderizado inadecuado** de diagramas ASCII/texto
- ❌ **Funcionalidad limitada** en plugins de diagramas

### Solución Implementada
Debido a estas limitaciones técnicas, me vi **orillado a implementar** una solución basada en imágenes PNG:
- ✅ **Compatibilidad universal** con Confluence
- ✅ **Renderizado consistente** en todas las plataformas
- ✅ **Calidad profesional** mediante draw.io

### Limitaciones de Seguridad
**IMPORTANTE**: Para utilizar GitHub Pages, el repositorio debe ser **público**, lo que implica:
- ⚠️ **Solo diagramas conceptuales sencillos** sin información sensible
- ⚠️ **Referencias y mapas conceptuales** para Confluence
- ⚠️ **No incluir datos confidenciales** de la empresa

### Arquitectura de Documentación
- **Confluence**: Diagramas de **referencia y mapas conceptuales** (repositorio público)
- **GitLab Corporativo**: Documentación técnica detallada con **credenciales corporativas** (repositorio privado)

### Recomendación Empresarial
**Para Promad / Grupo Kabat**: Se recomienda considerar las siguientes mejoras:

1. **CDN Externo**: Implementar CDN externo para servir diagramas desde infraestructura privada
2. **Infraestructura Privada**: Facilitar implementación de solución privada para diagramas sensibles
3. **Separación de Contenido**: Mantener diagramas técnicos detallados en GitLab con acceso corporativo

Esta implementación mantiene la **separación adecuada** entre diagramas públicos conceptuales y documentación técnica privada.

## ⚠️ Historial de Implementación

### Intento Fallido: GitHub Actions Automático
Inicialmente intentamos implementar conversión automática con GitHub Actions usando:
- `rlespinasse/drawio-export-action@v2` → Errores de repositorio shallow
- Docker con draw.io desktop → Exit code 8, problemas de permisos
- AppImage directo → Falló en entorno headless de GitHub Actions

**Conclusión**: La conversión automática de .drawio en GitHub Actions es problemática y poco confiable.

### Solución Final: Scripts Locales
Sistema simple y confiable usando draw.io desktop local + despliegue estático.

## 🏗️ Estructura Simplificada

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
- Asegurar que `drawio` esté disponible en PATH

### 2. Agregar Diagramas
- Coloca archivos `.drawio` en la carpeta `drawio/`
- Usa nombres sin espacios: `system-architecture.drawio`

### 3. Generar PNG y Página Web
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
git commit -m "Update diagrams"
git push
```

GitHub Pages despliega automáticamente desde la carpeta `public/`.

## 🌐 URLs para Confluence

Los diagramas están disponibles en:
```
https://incogniadev.github.io/Diagrams/nombre-diagrama.png
```

### Ejemplo de uso en Confluence:
```html
<img src="https://incogniadev.github.io/Diagrams/example-system.png" alt="System Architecture" />
```

## 📋 Ventajas de Esta Solución

### ✅ Pros
- **Confiable**: Usa draw.io desktop oficial local
- **Simple**: Un script, un comando
- **Control total**: No dependencias de terceros problemáticas
- **Rápido**: Conversión local vs CI/CD lento
- **Debugging**: Errores visibles inmediatamente

### ❌ Contras 
- **Manual**: Requiere ejecutar script localmente
- **Dependencia**: Necesita draw.io desktop instalado
- **No automático**: No convierte al hacer push

## 🔧 Solución de Problemas

### "drawio command not found"
```bash
# Verificar instalación
which drawio
drawio --version

# Si no está instalado, descargar desde:
# https://github.com/jgraph/drawio-desktop/releases
```

### Los PNG no se generan
- Verificar formato de archivos `.drawio` (deben ser XML válido)
- Probar abrir/guardar el archivo en draw.io desktop
- Revisar permisos de escritura en carpeta `public/`

### GitHub Pages no actualiza
- Confirmar que el repo es público
- Verificar que `public/` contiene `index.html` y archivos PNG
- Revisar Actions tab para errores de despliegue

## 📚 Lecciones Aprendidas

1. **GitHub Actions + draw.io = Problemático**: Múltiples intentos fallidos
2. **Simplicidad > Automatización**: Herramientas locales son más confiables
3. **Feedback inmediato**: Scripts locales permiten debugging fácil
4. **Separación de responsabilidades**: Generación local + despliegue automático

## 🚀 Workflow Recomendado

1. **Editar**: Usar draw.io desktop para crear/editar diagramas
2. **Generar**: `./scripts/generate.sh` después de cambios
3. **Verificar**: Abrir `public/index.html` localmente
4. **Desplegar**: `git add . && git commit && git push`
5. **Usar**: URLs en Confluence inmediatamente disponibles

## 📞 Soporte

Para problemas:
1. Verificar que draw.io desktop funciona: `drawio --version`
2. Revisar output detallado del script de generación
3. Comprobar que archivos `.drawio` son válidos XML