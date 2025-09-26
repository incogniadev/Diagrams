# 📊 incognia Diagrams Repository

Este repositorio contiene diagramas técnicos y de negocio para Incognia, generados automáticamente desde archivos draw.io.

## 🌐 Sitio Web

Los diagramas están disponibles públicamente en: **https://incogniadev.github.io/Diagrams/**

## 📁 Estructura del Repositorio

```
src/
├── architecture/     # Diagramas de arquitectura de sistemas
├── business/         # Diagramas de procesos de negocio  
├── infrastructure/   # Diagramas de infraestructura
└── workflows/        # Diagramas de flujos de trabajo
```

## 🚀 Cómo Usar

### 1. Agregar Nuevos Diagramas

1. Crea o edita archivos `.drawio` en la carpeta `src/` correspondiente
2. Haz commit y push al repositorio
3. GitHub Actions automáticamente:
   - Convierte los archivos `.drawio` a PNG y SVG
   - Actualiza el sitio web con los nuevos diagramas

### 2. Usar Diagramas en Confluence

Para insertar diagramas en Confluence, usa la URL directa:

```html
<img src="https://incogniadev.github.io/Diagrams/architecture/system-overview.png" alt="System Overview" />
```

### 3. Editar Diagramas

**Opción A: draw.io Web**
1. Ve a https://app.diagrams.net/
2. Abre desde GitHub (File → Open from → GitHub)
3. Selecciona el archivo `.drawio` que quieres editar
4. Guarda directamente en GitHub (File → Save as → GitHub)

**Opción B: draw.io Desktop**
1. Clona el repositorio localmente
2. Abre el archivo `.drawio` con draw.io Desktop
3. Edita y guarda
4. Haz commit y push

## 🔄 Workflow Automático

Cuando se detectan cambios en archivos `.drawio`:

1. **Conversión**: Los archivos se convierten a PNG (para web) y SVG (vectorial)
2. **Generación**: Se crea automáticamente una página web con todos los diagramas
3. **Despliegue**: Los diagramas se publican en GitHub Pages
4. **URLs estables**: Cada diagrama tiene una URL pública fija

## 📋 Convenciones de Nombres

- Usa nombres descriptivos en inglés
- Separar palabras con guiones: `system-architecture.drawio`
- Prefijos por categoría:
  - `arch-`: Arquitectura (`arch-microservices.drawio`)
  - `flow-`: Flujos de trabajo (`flow-user-onboarding.drawio`)
  - `infra-`: Infraestructura (`infra-aws-setup.drawio`)

## 🛠️ Formatos Disponibles

Cada diagrama se genera en dos formatos:
- **PNG**: Para inserción en documentos y web (recomendado para Confluence)
- **SVG**: Para máxima calidad y escalabilidad

## 📖 URLs de Ejemplo

```
# Diagrama de arquitectura
https://incogniadev.github.io/Diagrams/architecture/system-overview.png

# Diagrama de flujo de trabajo  
https://incogniadev.github.io/Diagrams/workflows/user-registration.png

# Versión SVG
https://incogniadev.github.io/Diagrams/svg/architecture/system-overview.svg
```

## ⚡ Inicio Rápido

1. Clona el repositorio:
   ```bash
   git clone git@github.com:incogniadev/Diagrams.git
   ```

2. Crea tu primer diagrama en `src/architecture/mi-sistema.drawio`

3. Haz push:
   ```bash
   git add .
   git commit -m "Add new system diagram"
   git push
   ```

4. Ve la magia en: https://incogniadev.github.io/Diagrams/

## 🔐 Acceso

- **Repositorio**: Privado (solo equipo Incognia)
- **Diagramas generados**: Públicos vía GitHub Pages
- **Edición**: Solo miembros autorizados del repositorio

## 📞 Soporte

Para preguntas sobre el repositorio o problemas con la generación automática, contacta al equipo de DevOps.