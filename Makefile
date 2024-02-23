.PHONY: dev deps

dev: deps
	iex -S mix phx.server

deps:
	mix do deps.get

setup:
	mix setup
