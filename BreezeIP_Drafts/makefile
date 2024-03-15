all: LSHIFT.v ADD.v MUX20.v INC_tb.v INC.v
	iverilog -o LSHIFT LSHIFT.v
	iverilog -o ADD ADD.v
	iverilog -o MUX20 MUX20.v
	iverilog -o XOR20 XOR20.v
	iverilog -o INC_tb INC_tb.v
	iverilog -o INC INC.v
	vvp LSHIFT
	vvp ADD
	vvp MUX20
	vvp XOR20
	vvp INC_tb
	vvp INC

clean:
	rm ADD
	rm LSHIFT
	rm MUX20
	rm XOR20
	rm INC_tb
	rm INC