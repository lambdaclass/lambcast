.PHONY: dev deps compile-app compile run

dev:
	iex -S mix phx.server

run-test: 
	mix phx.server

deps:
	mix do deps.get --only prod
	mix compile

compile-app:
	mix assets.deploy
	mix phx.gen.release
	mix release

compile: deps compile-app

run: 
	_build/prod/rel/lambcast/bin/lambcast start
