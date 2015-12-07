lsyncd testing sandbox
=======================

vagrant setup
-------------

    vagrant up --provider=virtualbox

    ssh-keygen -f id_rsa -N ""
    perl -pi -e 's|^|command="/home/vagrant/.ssh/rsync_only.sh" |' id_rsa.pub
    vagrant scp id_rsa src:/home/vagrant/.ssh/id_rsa
    vagrant scp id_rsa.pub dest:/home/vagrant/.ssh/id_rsa.pub
    vagrant scp rsync_only.sh dest:/home/vagrant/.ssh/rsync_only.sh
    vagrant ssh dest -- 'cat .ssh/id_rsa.pub >> .ssh/authorized_keys'
    vagrant ssh dest -- 'chmod 700 .ssh/rsync_only.sh'

run lsyncd on src
-----------------

    mkdir /tmp/test
    lsyncd -nodaemon -log all -rsyncssh  /tmp/test 172.28.128.4 /tmp/test

(from another shell)

    touch /tmp/test/foo
