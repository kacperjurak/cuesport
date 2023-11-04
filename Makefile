.PHONY: all reload compile clean

all: compile

compile: rebar
	./rebar3 compile

reload: compile
	zsh -c './reload.erl $$(foreach f (src/*.erl); basename $$f .erl; end)'

rebar:
	wget -c https://s3.amazonaws.com/rebar3/rebar3
	chmod +x $@

clean: rebar
	./rebar3 clean
