DOCS	= Wander.txt WanderExportReadMe.txt WanderMisc.txt WanderWrld.txt
DOT_CS	= wand1.c wand2.c wandglb.c wandsys.c qdos.c
DOT_OS	= wand1.o wand2.o wandglb.o wandsys.o qdos.o
A3	= a3.misc a3.wrld
CASTLE	= castle.misc castle.wrld
LIBRARY	= library.misc library.wrld
TUT	= tut.misc tut.wrld
EXPORT	= Makefile $(DOCS) wanddef.h $(DOT_CS) $(A3) $(CASTLE) $(LIBRARY) $(TUT)
CC = qcc

default: wander

clean:
	rm $(DOT_OS) $(DOCS)

docs:	$(DOCS)
	ls -l $(DOCS)

export: $(EXPORT)
	ls -l $(EXPORT)
	tar -czf Wander.tgz $(EXPORT)
	ls -l Wander.tgz

wander: Wander
Wander: $(DOT_OS)
	$(CC) $(DOT_OS) -o $@

wand1.o: wand1.c wanddef.h

wand2.o: wand2.c wanddef.h

wandglb.o: wandglb.c wanddef.h

wandsys.o: wandsys.c wanddef.h

Wander.txt: wander.nr mac
	nroff wander.nr >$@

WanderExportReadMe.txt:
	cp $? $@

WanderMisc.txt: misc.nr mac
	nroff misc.nr >$@

WanderWrld.txt: wrld.nr mac
	nroff WanderWrld.nr >$@
