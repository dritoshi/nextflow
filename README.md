Nextflow on docker
=======================

Nextflow's Docker image for test

Run
---

Run Nextflow.

    $ docker run -it dritoshi/nextflow /bin/bash
    root@xxxx:/# nextflow run tutorial.nf
    N E X T F L O W  ~  version 0.14.1
    Launching tutorial.nf
    [warm up] executor > local
    [4e/392478] Submitted process > splitLetters (1)
    [c2/0de416] Submitted process > convertToUpper (2)
    [e8/3a1b6e] Submitted process > convertToUpper (1)
    WORLD!
    HELLO
    root@xxxx:/# exit 

Build
-----
    git clone git@github.com:dritoshi/nextflow.git
    docker build -t dritoshi/nextflow .

Copyright
-----
Itoshi NIKAIDO <dritoshi@gmail.com>
This software is released under the MIT License, see LICENSE.
