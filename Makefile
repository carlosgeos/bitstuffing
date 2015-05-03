code:
	nasm -f elf32 bitstuffing.asm
	g++ -m32 bitstuffing.cpp bitstuffing.o -o out
	./out

pdf:
	latexmk -xelatex -output-directory=tex_files main.tex

view:
	evince tex_files/main.pdf &
