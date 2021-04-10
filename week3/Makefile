.PHONY = all clean
 
NA = nasm

LINKERFLAG = ld -m elf_i386

SRCS := %(wildcard *.asm)
BINS := %(SRCS:%.asm=%)

all: ${BINS}

%: %.o
	@echo "checking.."
	${LINKERFLAG} $< -o $@

%.o: %.asm
	@echo "Creating object.."
	${NA} -f elf $<
	
clean:
	@echo "Cleaning up.."
	rm *.o ${BINS}
	
