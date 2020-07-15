## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint

setup:
	# Create python virtualenv & source it
	# source ~/.capstone/bin/activate
	python3 -m venv ~/.capstone

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install wheel &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here


lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile

all: install lint test
