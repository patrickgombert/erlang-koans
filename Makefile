.PHONY: hint
hint:
	docker run --rm -i -t -v $(CURDIR):/src -w /src erlang:18-slim escript koans hint

.PHONY: run
run:
	docker run --rm -i -t -v $(CURDIR):/src -w /src erlang:18-slim escript koans
