# Gobernanza del currículo

## Identificadores (IDs)

- **Macrocompetencias**: `MC-XX` (ej. `MC-PC` = Pensamiento computacional)
- **Evidencias MEN**: `MEN-{componente}-{grado}-{num}` (ej. `MEN-SPTI-6-7-11`)
- **Proyectos**: `P{grado}-{num}` (ej. `P6-01`)
- **Herramientas**: `HERR-{nombre}`

## Versionado semántico

Cada archivo JSON tiene `version` (contenido) y `schema_version` (estructura).  
El `version_global` en `index.json` sigue SemVer:

- MAJOR: cambios incompatibles en la arquitectura
- MINOR: adición de nuevos módulos (ej. nuevo grado)
- PATCH: correcciones sin impacto estructural

## Control de cambios

- Usa commits descriptivos: `feat`, `fix`, `docs`, `refactor`
- Para cambios en `mapping/` o `progresion_longitudinal.json`, abre Pull Request
- La validación automática (GitHub Actions) debe pasar antes de mergear

## Agregar un nuevo proyecto

1. Asigna un ID `P{grado}-{num}`
2. Crea la entrada en `02_mapping/proyectos_vs_men_{grado}.json`
3. Agrégalo a `progresion_longitudinal.json` en el grado correspondiente
4. Verifica que sus referencias (`evidencias_men`, `macrocompetencias`) existan
5. Asegura que las categorías usadas estén en `taxonomy/categorias.json`

## Deuda técnica conocida

- **Schemas pendientes**: los archivos `02_mapping/cobertura_6_7.json` y `02_mapping/proyectos_vs_men_8_11.json` no tienen schema JSON asociado. Por tanto, el CI/CD no valida su estructura.
- **Validación referencial**: actualmente solo se valida sintaxis y schemas individuales. No se comprueba automáticamente que los IDs de evidencias MEN referenciados en proyectos existan realmente en `competencias_6_7.json`. Esto requeriría un script personalizado.
- **Cobertura dinámica**: el archivo `cobertura_6_7.json` es estático. Debería generarse automáticamente a partir del mapping y el currículo MEN (pendiente).

Estas limitaciones serán abordadas en futuras iteraciones del sistema.
