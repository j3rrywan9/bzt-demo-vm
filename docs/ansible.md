# Ansible

## Playbooks Are YAML

Ansible playbooks are written in YAML syntax.

## Anatomy of a Playbook

### Plays

Looking at either the YAML or JSON representation, it should be clear that a playbook is a list of dictionaries.
Specifically, a playbook is a list of *plays*.

Every play must contain the following:
* A set of *hosts* to configure
* A list of *tasks* to be executed on those hosts

Think of a play as the thing that connects hosts to tasks.

### Tasks

Every task must contain a key with the name of a module and a value with the arguments to that module.

Ansible also supports a task syntax that will let you specify module arguments as a YAML dictionary, which is helpful when using modules that support complex arguments.

### Modules

*Modules* are scripts that come packaged with Ansible and perform some kind of action on a host.

### Putting It All Together

To sum up, a playbook contains one or more plays.
A play associates an unordered set of hosts with an ordered list of tasks.
Each task is associated with exactly one module.

## Tracking Host State

When you run `ansible-playbook`, Ansible outputs status information for each task it executes in the play.

Any Ansible task that runs has the potential to change the state of the host in some way.
Ansible modules will first check to see whether the state of the host needs to be changed before taking any action.
If the state of the host matches the arguments of the module, Ansible takes no action on the host and responds with a state of `ok`.

On the other hand, if there is a difference between the state of the host and the arguments to the module, Ansible will change the state of the host and return `changed`.

Ansible's detection of state change can be used to trigger additional actions through the use of *handlers*.
