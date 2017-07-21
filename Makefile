help:
	@echo 'Makefile for Forum Web App                                            '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   clean                   Delete all DBs and create new ones         '
	@echo '   test                    Run all tests                              '
	@echo '   test-cov                Run all tests with coverage result         '

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

test-cov:
	@make test
	sensible-browser ./coverage/index.html

.PHONY: help, setup, clean, test, test-cov
