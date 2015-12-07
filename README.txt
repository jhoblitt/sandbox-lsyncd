lsyncd testing sandbox
=======================

vagrant setup
-------------

    vagrant up --provider=virtualbox

    ssh-keygen -f id_rsa -N ""
    vagrant scp id_rsa src:/home/vagrant/.ssh/id_rsa
    vagrant scp id_rsa.pub dest:/home/vagrant/.ssh/id_rsa.pub
    vagrant ssh dest -- 'cat .ssh/id_rsa.pub >> .ssh/authorized_keys'

run lsyncd on src
-----------------

    mkdir /tmp/test
    lsyncd -nodaemon -log all -rsyncssh  /tmp/test 172.28.128.4 /tmp/test

(from another shell)

    touch /tmp/test/foo
