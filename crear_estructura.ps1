$BASE = "curriculo-tecnologia-longitudinal"

# Función para crear directorio si no existe
function Ensure-Directory($path) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Force -Path $path | Out-Null
        Write-Output "Directorio creado: $path"
    }
}

# Función para crear archivo vacío si no existe
function Ensure-File($path) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Force -Path $path | Out-Null
        Write-Output "Archivo creado: $path"
    }
}

# Crear subdirectorios
Ensure-Directory "$BASE\.github\workflows"
Ensure-Directory "$BASE\schemas"
Ensure-Directory "$BASE\taxonomy"
Ensure-Directory "$BASE\00_framework_pedagogico"
Ensure-Directory "$BASE\01_curriculo_base_men"
Ensure-Directory "$BASE\02_mapping"

# Crear archivos vacíos
Ensure-File "$BASE\.github\workflows\validate_curriculum.yml"
Ensure-File "$BASE\schemas\macrocompetencia.schema.json"
Ensure-File "$BASE\schemas\proyecto.schema.json"
Ensure-File "$BASE\taxonomy\categorias.json"

Ensure-File "$BASE\00_framework_pedagogico\vision.json"
Ensure-File "$BASE\00_framework_pedagogico\macrocompetencias.json"
Ensure-File "$BASE\00_framework_pedagogico\metodologia.json"
Ensure-File "$BASE\00_framework_pedagogico\progresion_longitudinal.json"
Ensure-File "$BASE\00_framework_pedagogico\ecosistema_tecnologico.json"
Ensure-File "$BASE\00_framework_pedagogico\portafolio.json"

Ensure-File "$BASE\01_curriculo_base_men\competencias_6_7.json"
Ensure-File "$BASE\02_mapping\proyectos_vs_men_6_7.json"

Ensure-File "$BASE\.gitignore"
Ensure-File "$BASE\README.md"
Ensure-File "$BASE\LICENSE"
Ensure-File "$BASE\GOVERNANCE.md"
Ensure-File "$BASE\index.json"

Write-Output "✅ Subestructura verificada y creada dentro de $BASE."
