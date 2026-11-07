# TODO: Mejoras de Contenido y Maquetación del CV

Este documento reúne las mejoras pendientes de contenido, redacción y ajustes técnicos de LaTeX para [`RichardCruz_CV.tex`](./RichardCruz_CV.tex).

---

## 1. Orientación a Impacto y Métricas Cuantificables (Experiencia Laboral)

- [ ] **Banco Alfin (`L130-L137`):**
  - [ ] Cuantificar el impacto de los reportes regulatorios (SBS / auditoría interna), ej. porcentaje de reducción en tiempos de generación o volumen de cartera activa soportada.
  - [ ] Indicar volumen de operaciones o alcance del módulo de líneas de crédito revolventes para personas jurídicas.
- [ ] **SES (`L140-L145`):**
  - [ ] Agregar métricas de reducción de tiempos de despliegue tras automatizar pipelines CI/CD con Jenkins.
  - [ ] Mencionar volumen aproximado de transacciones o proveedores soportados en el flujo masivo de pagos.
- [ ] **Bantotal (`L148-L156`):**
  - [ ] **Herramienta Golang + ANTLR (`L152`) y Plugin Wiki.js (`L155`):** Cuantificar cuántos programas/archivos XPZ fueron documentados automáticamente o el porcentaje de ahorro de tiempo manual para el equipo.
  - [ ] **Multithreading en Bantotal 4 (`L153`):** Especificar la mejora de rendimiento o reducción de tiempos de ejecución en procesos batch de alta concurrencia (cierre/cadena nocturna).

---

## 2. Consistencia y Redacción

- [ ] **Año en Hackatón Bantotal (`L181`):**
  - [ ] Añadir el año del reconocimiento en **Premios & Reconocimientos** para mantener consistencia con el resto de ítems (`Indecopi, 2018`, `Incubadora KAMAN, 2018`, `2015`).
- [ ] **Formato del mérito académico en Educación (`L195`):**
  - [ ] Evaluar reemplazar `(Promedio ponderado: 14.52/20.00)` por `Quinto Superior (Top 20%)` para evitar malinterpretaciones del sistema vigesimal peruano en procesos de selección internacionales.
- [ ] **Palabras clave para filtros ATS en Habilidades Técnicas (`L113-L122`):**
  - [ ] Incluir herramientas clave del ecosistema Java/Bancario usadas en proyectos previos: `Maven` / `Gradle`, `Postman`, `SoapUI`.
  - [ ] Especificar motores de bases de datos relacionales bancarios trabajados en Core Bancario (ej. `Oracle PL/SQL`, `SQL Server / T-SQL`, `DB2`) además de `SQL` y `MySQL`.
  - [ ] Evaluar si conviene reincorporar tecnologías web/frontend (`React.js`, `Node.js`) según el tipo de vacante objetivo.

---

## 3. Ajustes Técnicos de LaTeX y Diseño Visual

- [ ] **Espaciado vertical entre empresas (`L69-L80`):**
  - [ ] Ajustar `\vspace` entre `\resumeItemListEnd` y `\resumeSubheading` (agregar `~1.5pt–2pt` de separación entre bloques de empresas) para que no se vean visualmente pegados entre sí.
- [ ] **Uso o limpieza del color `darktext` (`L32`):**
  - [ ] Aplicar `\color{darktext}` al cuerpo del documento para suavizar el contraste del texto o eliminar la definición `\definecolor{darktext}{HTML}{1A202C}` si no se utiliza.
- [ ] **Limpieza de preámbulo y paquetes no utilizados (`L12-L44`):**
  - [ ] Eliminar paquetes importados que no se usan en el documento: `latexsym` (`L12`), `tabularx` (`L18`) y `hyphenat` (`L19`).
  - [ ] Unificar la configuración de `hyperref`: eliminar la opción redundante `[hidelinks]` en `\usepackage[hidelinks]{hyperref}` (`L16`), ya que se sobreescribe con `colorlinks=true` en `\hypersetup` (`L40`).
