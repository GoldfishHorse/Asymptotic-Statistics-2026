PROJECT_NAME := 渐近统计笔记
MAIN := main.tex
OUTPUT_DIR := outputs
OUTPUT_PDF := $(OUTPUT_DIR)/$(PROJECT_NAME).pdf
LATEXMK := latexmk
LATEXMK_FLAGS := -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=$(OUTPUT_DIR)

.PHONY: all clean distclean rebuild

all:
	@mkdir -p "$(OUTPUT_DIR)"
	$(LATEXMK) $(LATEXMK_FLAGS) "$(MAIN)"
	@mv "$(OUTPUT_DIR)/main.pdf" "$(OUTPUT_PDF)"
	@echo "Built $(OUTPUT_PDF)"

clean:
	@mkdir -p "$(OUTPUT_DIR)"
	$(LATEXMK) -C -outdir=$(OUTPUT_DIR) "$(MAIN)"
	@rm -f "$(OUTPUT_DIR)"/*.bbl-SAVE-ERROR

distclean: clean
	@rm -f "$(OUTPUT_PDF)"

rebuild: clean all
