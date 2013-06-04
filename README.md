## Erlang Koans
Inspired by <a href="http://rubykoans.com/">the ruby koans</a>.

### Usage
The koans are intended to only rely on erlang and the erlang scripting environment <a href="http://www.erlang.org/doc/man/escript.html">escript</a>. The testing framework is <a href="http://www.erlang.org/doc/apps/eunit/chapter.html">eunit</a>.

To run the koans use the koans executable with the command `escript koans`. This will compile your code and provide the next failing test in the suite to pass.

To run the development tests with substituted answers from answers.config use the command `escript koans test`.

To show a hint for the current koan, use `escript koans hint`.

### Erlang Installation

##### OSX
<a href="https://github.com/mxcl/homebrew">Homebrew</a> can be used to install Erlang, but it has an out-of-date version (R15B).  To get the most updated version (R16B), you can tap into the `homebrew/homebrew-versions` repo, and get the `erlang-r16` formula from there.  To do this, run `brew tap homebrew/versions` followed by `brew install erlang-r16`.

##### Ubuntu
Unfortunately, aptitude has an old version of erlang which is less than ideal.

First, install all necessary dependencies `apt-get -y install build-essential m4 libncurses5-dev libssh-dev unixodbc-dev` `libgmp3-dev libwxgtk2.8-dev libglu1-mesa-dev fop xsltproc default-jdk`

Next, move to some place to install erlang and pull the .tar.gz `wget http://www.erlang.org/download/otp_src_R16B.tar.gz`

Followed by `tar -xvzf otp_src_R16B.tar.gz` and `chmod -R 777 otp_src_R16B`

Move to the install directory `cd otp_src_R16B`

Then run `./configure`, `make`, `make install` which will produce a bin/ directory. Place this bin/ directory on your path. Specifically, the koans require the erl, erlc, and escript binaries.

#### Development Goals
- Cover many more topics
- Include erlang installation instructions (for all environments not yet mentioned) in this README
