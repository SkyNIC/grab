flake:
	flake8 grab test

flake_verbose:
	flake8 grab test --show-pep8

test:
	./runtest.py --test-all

coverage:
	coverage erase
	coverage run --source=grab ./runtest.py --test-all
	coverage report -m

coverage_full:
	coverage erase
	coverage run --source=grab ./runtest.py --test-all --extra --backend-mongo --backend-mysql --backend-redis
	coverage report -m

clean:
	find -name '*.pyc' -delete
	find -name '*.swp' -delete

upload:
	python setup.py sdist upload

.PHONY: all build venv flake test vtest testloop cov clean doc
