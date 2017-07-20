help:
	@echo 'Makefile for Forum Web App                                            '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   clean                   Delete all DBs and create new ones         '

setup:
	bundle install
	rake db:create
	rake db:migrate
	rake db:seed
	rake assets:precompile

clean:
	rake db:drop:all
	rake db:create
	rake db:migrate

.PHONY: help, setup, clean
