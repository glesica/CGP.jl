# CGP.jl

[![Build Status](https://travis-ci.org/glesica/CGP.jl.svg?branch=master)](https://travis-ci.org/glesica/CGP.jl)

CGP.jl is a library for using
[Cartesian Genetic Programming](http://www.cartesiangp.co.uk/) in
Julia. It is being developed at the University of Montana in Missoula,
MT for use in simulating the evolution of technology, though there is
nothing specific to that application in the library so it is (will be)
perfectly suitable for other applications as well.

## Development

### Vagrant

There is a [Vagrant](http://docs.vagrantup.com/) configuration file
(called `Vagrantfile`) in the repository root that will provide two
properly configured development and test-running environments (using
[Virtualbox](https://www.virtualbox.org/) behind the scenes). One will
run the release version of Julia, and the other will run the nightly
version. This is especially helpful for Mac and Windows users for whom
keeping Julia up-to-date can be a bit of a challenge.

Additionally, this method protects the developer's system Julia
packages, which is ideal for people who are both using and developing
CGP.jl.

Once
[Vagrant is installed](http://docs.vagrantup.com/v2/getting-started/index.html),
bring up the VMs with the following command:

```
$ vagrant up
```

Optionally, and this applies to most of the vagrant commands, you can
include either "releases" or "nightlies" after the command to apply
the action to only one of the machines. So to bring up just the
"releases" machine you would do:

```
$ vagrant up releases
```

Launching the VMs will cause the test suite to run on both (unless you
launched only one). The tests can be subsequently run again in the VMs like
so:

```
$ vagrant ssh -c $'julia -e \'Pkg.clone("/vagrant", "CGP"); Pkg.test("CGP")\''
```

Or to run in just the release environment, for example (provided it
was brought up):

```
$ vagrant ssh releases -c $'julia -e \'Pkg.clone("/vagrant", "CGP"); Pkg.test("CGP")\''
```

To shut down the VMs:

```
$ vagrant halt
```

To destroy the VMs (and free the hard drive space used to store their
disk images:

```
$ vagrant destroy
```
