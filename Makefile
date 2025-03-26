# 自动将SVG文件转换为PDF文件

# 获取所有WSD文件
WSD_FILES := $(wildcard wsd/*.wsd)
# 获取所有SVG文件
SVG_FILES := $(patsubst wsd/%.wsd,svg/%.svg,$(WSD_FILES))
# 生成对应的PDF文件路径
PDF_FILES := $(patsubst svg/%.svg,pdf/%.pdf,$(SVG_FILES))

# 不要删除中间文件
.PRECIOUS: $(SVG_FILES)

all: $(PDF_FILES)

pdf/%.pdf: svg/%.svg
	@mkdir -p pdf
	inkscape --export-filename=$@ $<

svg/%.svg: wsd/%.wsd
	@mkdir -p svg
	java -jar plantuml.jar -tsvg -o../svg $<


.PHONY: all