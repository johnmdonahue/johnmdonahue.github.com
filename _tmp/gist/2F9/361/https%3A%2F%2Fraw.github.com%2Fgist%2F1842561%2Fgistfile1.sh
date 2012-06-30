o: ActiveSupport::Cache::Entry	:@compressedF:@expires_in0:@created_atf1340954129.684814:@value"I"$ sudo apt-get update
$ sudo apt-get install git-core curl build-essential openssl libssl-dev

# node
$ git clone git://github.com/joyent/node.git && cd node
$ git checkout v0.6.17
$ ./configure
$ make
$ sudo make install

# npm
$ curl http://npmjs.org/install.sh | sudo sh:ET