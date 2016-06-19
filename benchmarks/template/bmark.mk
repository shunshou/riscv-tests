#=======================================================================
# UCB CS250 Makefile fragment for benchmarks
#-----------------------------------------------------------------------
#
# Each benchmark directory should have its own fragment which
# essentially lists what the source files are and how to link them
# into an riscv and/or host executable. All variables should include
# the benchmark name as a prefix so that they are unique.
#

template_c_src = \
	template_main.c \
	syscalls.c \

template_riscv_src = \
	crt.S \

template_c_objs     = $(patsubst %.c, %.o, $(template_c_src))
template_riscv_objs = $(patsubst %.S, %.o, $(template_riscv_src))

template_host_bin = template.host
$(template_host_bin) : $(template_c_src)
	$(HOST_COMP) $^ -o $(template_host_bin)

template_riscv_bin = template.riscv
$(template_riscv_bin) : $(template_c_objs) $(template_riscv_objs)
	$(RISCV_LINK) $(template_c_objs) $(template_riscv_objs) -o $(template_riscv_bin) $(RISCV_LINK_OPTS)

junk += $(template_c_objs) $(template_riscv_objs) \
        $(template_host_bin) $(template_riscv_bin)
