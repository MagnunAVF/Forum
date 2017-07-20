help:
	@echo 'Makefile for Forum Web App                                            '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   clean                   Delete all DBs and create new ones         '
	@echo '   test                    Run all tests                              '

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

test:
	rspec

.PHONY: help, setup, clean, test
