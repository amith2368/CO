.PHONY = all clean
 
NA = nasm

LINKERFLAG = ld -m elf_i386

SRCS := %(wildcard *.c)
BINS := %(SRCS:%.c=%)

all: ${BINS}

%: %.o
	@echo "checking.."
	${LINKERFLAG} $< -o $@
	
  
