all: LSHIFT.v ADD.v MUX20.v
	iverilog -o LSHIFT LSHIFT.v
	iverilog -o ADD ADD.v
	iverilog -o MUX20 MUX20.v
	iverilog -o XOR20 XOR20.v
	vvp LSHIFT
	vvp ADD
	vvp MUX20
	vvp XOR20

clean:
	rm ADD
	rm LSHIFT
	rm MUX20
	rm XOR20