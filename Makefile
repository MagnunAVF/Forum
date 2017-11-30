help:
	@echo 'Makefile for Forum Web App                                            '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   db_clean                Delete all DBs and create new ones         '
	@echo '   reset                   Clean all dbs, all assets and setup again  '
	@echo '   test                    Run all tests                              '
	@echo '   test-cov                Run all tests with coverage result         '

setup:
	bundle install
	@make db_create
	bundle exec rake assets:precompile

reset:
	@make db_clean
	rake assets:clobber
	bundle exec rake assets:precompile

db_clean:
	bundle exec rake db:drop
	@make db_create

db_create:
	bundle exec rake db:create
	bundle exec rake db:migrate
	bundle exec rake db:seed

test:
	rspec

test-cov:
	@make test
	sensible-browser ./coverage/index.html

.PHONY: help, setup, clean, test, test-cov
