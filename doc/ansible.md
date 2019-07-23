# Ansible

## Playbooks

### Playbooks Are YAML

Ansible playbooks are written in YAML syntax.

### Anatomy of a Playbook

#### Plays

Looking at either the YAML or JSON representation, it should be clear that a playbook is a list of dictionaries.
Specifically, a playbook is a list of *plays*.

Every play must contain the following:
* A set of *hosts* to configure
* A list of *tasks* to be executed on those hosts

Think of a play as the thing that connects hosts to tasks.

#### Tasks

Every task must contain a key with the name of a module and a value with the arguments to that module.

Ansible also supports a task syntax that will let you specify module arguments as a YAML dictionary, which is helpful when using modules that support complex arguments.

#### Modules

*Modules* are scripts that come packaged with Ansible and perform some kind of action on a host.

#### Putting It All Together

To sum up, a playbook contains one or more plays.
A play associates an unordered set of hosts with an ordered list of tasks.
Each task is associated with exactly one module.

### Tracking Host State

When you run `ansible-playbook`, Ansible outputs status information for each task it executes in the play.

Any Ansible task that runs has the potential to change the state of the host in some way.
Ansible modules will first check to see whether the state of the host needs to be changed before taking any action.
If the state of the host matches the arguments of the module, Ansible takes no action on the host and responds with a state of `ok`.

On the other hand, if there is a difference between the state of the host and the arguments to the module, Ansible will change the state of the host and return `changed`.

Ansible's detection of state change can be used to trigger additional actions through the use of *handlers*.

## Inventory

The collection of hosts that Ansible knows about is called the *inventory*.

### The Inventory File

The default way to describe your hosts in Ansible is to list them in text files, called *inventory files*.

### Groups and Groups and Groups

Ansible automatically defines a group called `all` (or `*`), which includes all of the hosts in the inventory.

We can define our own groups in the inventory file.
Ansible uses the *.ini* file format for inventory files.
In the *.ini* format, configuration values are grouped together into sections.

### Host and Group Variables: In Their Own Files

Ansible offers a more scalable approach to keep track of host and group variables: you can create a separate variable file for each host and each group.
Ansible expects these variable files to be in YAML format.

Ansible looks for host variable files in a directory called *host_vars* and group variable files in a directory called *group_vars*.

## Variables and Facts

### Defining Variables in Playbooks

The simplest way to define variables is to put a `vars` section in your playbook with the names and values of variables.

Ansible also allows you to put variables into one or more files, using a section called `vars_files`.

### Viewing the Values of Variables

### Registering Variables

Often, you'll find that you need to set the value of a variable based on the result of a task.
To do so, we create a *registered variable* using the `register` clause when invoking a module.

In order to use the registered variable later, we need to know the type of value to expect.
The value of a variable set using the `register` clause is always a dictionary, but the specific keys of the dictionary are different, depending on the module that was invoked.

I've found the simplest way to find out what a module returns is to register a variable and then output that variable with the `debug` module.

Sometimes it's useful to do something with the output of a failed task.
However, if the task fails, Ansible will stop executing tasks for the failed host.
We can use the `ignore_errors` clause, so Ansible does not stop on the error.

### Facts

When Ansible gathers facts, it connects to the host and queries it for all kinds of details about the host: CPU architecture, operating system, IP addresses, memory info, disk info, and more.
This information is stored invariables that are called *facts*, and they behave just like any other variable.
