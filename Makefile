.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
MY_DIR = my
CV_DIR = my/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(MY_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(MY_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf


# my\cv.tex $(shell find my\cv -name '*.tex')
# 	xelatex -output-directory=my cv.pdf