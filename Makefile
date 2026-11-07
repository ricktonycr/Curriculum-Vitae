# Makefile para compilar el CV y actualizar la vista previa

MAIN ?= RichardCruz_CV
TEX_FILE = $(MAIN).tex
PDF_FILE = $(MAIN).pdf
PREVIEW_DIR = png
PREVIEW_PREFIX = $(PREVIEW_DIR)/cv-0
TEXLIVE_IMAGE = ghcr.io/xu-cheng/texlive-full

# Detectar motor de compilación LaTeX (pdflatex local o contenedor Podman/Docker)
ifneq ($(shell command -v pdflatex 2>/dev/null),)
    LATEX_CMD = pdflatex -interaction=nonstopmode -halt-on-error
else ifneq ($(shell command -v podman 2>/dev/null),)
    LATEX_CMD = podman run --rm -v "$$(pwd):/workdir:Z" -w /workdir $(TEXLIVE_IMAGE) pdflatex -interaction=nonstopmode -halt-on-error
else ifneq ($(shell command -v docker 2>/dev/null),)
    LATEX_CMD = docker run --rm -v "$$(pwd):/workdir" -w /workdir $(TEXLIVE_IMAGE) pdflatex -interaction=nonstopmode -halt-on-error
else
    $(error No se encontró pdflatex, podman ni docker en el sistema)
endif

.PHONY: all build preview clean help

all: build preview clean

build:
	@echo "==> Compilando $(TEX_FILE)..."
	$(LATEX_CMD) $(TEX_FILE)

preview: build
	@echo "==> Actualizando vista previa en $(PREVIEW_PREFIX).png..."
	@mkdir -p $(PREVIEW_DIR)
	pdftoppm -png -r 300 -singlefile $(PDF_FILE) $(PREVIEW_PREFIX)

clean:
	@echo "==> Limpiando archivos temporales de LaTeX..."
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz *.bak texput.log

help:
	@echo "Comandos disponibles:"
	@echo "  make          Compila el PDF, actualiza el PNG de vista previa y limpia temporales"
	@echo "  make build    Compila únicamente $(PDF_FILE)"
	@echo "  make preview  Compila $(PDF_FILE) y regenera $(PREVIEW_PREFIX).png"
	@echo "  make clean    Elimina archivos temporales (.aux, .log, .out, etc.)"
