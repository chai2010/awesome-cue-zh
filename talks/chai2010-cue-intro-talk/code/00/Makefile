default: hello.cue
	cue export --out=json hello.cue > hello.json
	cue export --out=yaml hello.cue > hello.yml

	cue eval hello.cue

clean:
