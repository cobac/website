.PHONY: all clean

all:
		emacs -Q --script build.el

clean:
		rm ./public/*.html &
		rm ./public/*.xml
