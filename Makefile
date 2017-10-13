all: julia juliaoriginal image

julia:
	$(CC) -o julia julia.c

juliaoriginal: # for timing only
	$(CC) -o julia_original julia_original.c

julia-xeonphi:
	icc -axMIC-AVX512,CORE-AVX2 -offload-attribute-target=mic -qopenmp -o julia julia.c
	icc -axMIC-AVX512,CORE-AVX2 -offload-attribute-target=mic -qopenmp -o julia_original julia_original.c

image:
	./julia; python visualize.py

largeimage:
	./julia 2000; python visualize.py

clean:
	rm -f julia julia.txt

