run:
	docker run --rm -i -t -v $(CURDIR):/src -w /src erlang:18-slim escript koans
