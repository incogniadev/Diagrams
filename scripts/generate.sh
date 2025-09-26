#!/bin/bash
# Note: No 'set -e' porque drawio devuelve exit code 1 aunque funcione

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔄 Generando diagramas PNG desde archivos .drawio...${NC}"

# Verificar que existe draw.io desktop
if ! command -v drawio &> /dev/null; then
    echo -e "${RED}❌ Error: draw.io desktop no está instalado${NC}"
    echo -e "${YELLOW}💡 Instala draw.io desktop desde: https://github.com/jgraph/drawio-desktop/releases${NC}"
    exit 1
fi

# Crear directorio de salida
mkdir -p public

# Limpiar archivos PNG anteriores
rm -f public/*.png

# Contador de archivos procesados
count=0

# Procesar cada archivo .drawio
for file in drawio/*.drawio; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .drawio)
        output="public/${filename}.png"
        
        echo -e "${YELLOW}📄 Procesando: $file${NC}"
        
        # Convertir usando draw.io desktop (ignorar exit code porque funciona pero devuelve 1)
        drawio --export --format png --width 1200 --output "$output" "$file" || true
        
        # Verificar si el archivo se creó exitosamente
        if [ -f "$output" ]; then
            echo -e "${GREEN}✅ Generado: $output${NC}"
            ((count++))
        else
            echo -e "${RED}❌ Error procesando: $file${NC}"
        fi
    fi
done

if [ $count -eq 0 ]; then
    echo -e "${YELLOW}⚠️  No se encontraron archivos .drawio en la carpeta 'drawio/'${NC}"
else
    echo -e "${GREEN}🎉 Procesados $count archivos exitosamente${NC}"
fi

echo -e "${YELLOW}🌐 Generando página web...${NC}"

# Generar página HTML
cat > public/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Incognia Diagrams</title>
    <style>
        body { 
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            margin: 40px auto;
            max-width: 1200px;
            background: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 { color: #333; margin-bottom: 30px; }
        .diagram {
            margin: 30px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #fafafa;
        }
        .diagram img {
            max-width: 100%;
            height: auto;
            border: 1px solid #eee;
            border-radius: 4px;
        }
        .diagram h3 {
            margin-top: 0;
            color: #555;
        }
        .url {
            background: #f0f0f0;
            padding: 10px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            word-break: break-all;
            margin-top: 10px;
            font-size: 14px;
        }
        .footer {
            margin-top: 40px;
            text-align: center;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 Incognia Diagrams Repository</h1>
        <p><strong>URL base:</strong> <code>https://incogniadev.github.io/Diagrams/</code></p>
EOF

# Agregar cada diagrama a la página
for png in public/*.png; do
    if [ -f "$png" ]; then
        filename=$(basename "$png")
        name=$(basename "$png" .png)
        
        cat >> public/index.html << EOF
        <div class="diagram">
            <h3>🖼️ $name</h3>
            <img src="./$filename" alt="$name" />
            <p><strong>URL para Confluence:</strong></p>
            <div class="url">https://incogniadev.github.io/Diagrams/$filename</div>
        </div>
EOF
    fi
done

cat >> public/index.html << EOF
        <div class="footer">
            <p>Generado automáticamente • <a href="https://github.com/incogniadev/Diagrams">Ver repositorio</a></p>
        </div>
    </div>
</body>
</html>
EOF

echo -e "${GREEN}✅ Página web generada en public/index.html${NC}"
echo -e "${YELLOW}💡 Para ver localmente: open public/index.html${NC}"
echo -e "${YELLOW}🚀 Para desplegar: git add . && git commit -m 'Update diagrams' && git push${NC}"