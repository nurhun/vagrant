#!/bin/bash -x

# Connect via ssh to be able to copy & paste.

# With vagrant hey
# vagrant ssh <node_name>

# With self key
ssh-keygen -q -t rsa -b 2048 -f $HOME/.ssh/vagrant_key -N ""

# ssh -i ~/.ssh/vagrant_key vagrant@<node_name>
