## Erlang Koans
Inspired by <a href="http://rubykoans.com/">the ruby koans</a>.

### Usage with Docker

To run the koans with docker use `make run`

### Usage

The koans are intended to only rely on erlang and the erlang scripting environment <a href="http://www.erlang.org/doc/man/escript.html">escript</a>. The testing framework is <a href="http://www.erlang.org/doc/apps/eunit/chapter.html">eunit</a>.

To run the koans use the koans executable with the command `escript koans`. This will compile your code and provide the next failing test in the suite to pass.

To run the development tests with substituted answers from answers.config use the command `escript koans test`.

To show a hint for the current koan, use `escript koans hint`.

### Erlang Installation

See the <a href="http://www.erlang.org/doc/installation_guide/INSTALL.html"> installation guide</a>. Be sure to install version 17 which includes the much anticipated map feature!
