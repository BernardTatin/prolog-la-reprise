# ============================================
# Makefile
# ============================================

PL = swipl
PLOPTIONS = -p library=./lib:./samples_lib --goal=main --stand_alone=true
## --quiet

INDEXLIB = ./lib/INDEX.pl
SRCLIB = ./lib/someio.pl ./lib/somemaths.pl

INDEXSLIB = ./samples_lib/INDEX.pl
SRCSLIB = ./samples_lib/factorial.pl ./samples_lib/show_factorial.pl

SRCTF = $(SRCLIB) $(SRCSLIB)
MAINTF = test-factorial
EXETF = $(MAINTF).exe

all: $(EXETF)

$(INDEXLIB): $(SRCLIB)
	swipl -g 'make_library_index(lib)' -t halt

$(INDEXSLIB): $(SRCSLIB)
	swipl -g 'make_library_index(samples_lib)' -t halt

$(EXETF): $(INDEXLIB) $(INDEXSLIB) $(SRCTF) $(MAINTF).pl
	$(PL) $(PLOPTIONS) -o $@ -c $(SRCTF) $(MAINTF).pl

clean:
	rm -fv $(EXETF) $(INDEXLIB) $(INDEXSLIB)

testTF: $(EXETF)
	./$(EXETF) || echo "KO"

.PHONY:
	all clean testTF