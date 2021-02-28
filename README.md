# makefile

***This repository was created to fulfill my needs of a decent makefile. I do not think it is perfect, but may suit a simple or complex C/C++ project.***

***The Makefile found in this repository can handle complex directory structure in the source directory, using recursive wildcards.***

## Cloning the makefile repository

- In order to clone this repository, use `git clone https://github.com/talberko1/makefile.git`

## Creating the source and header directories

- If you want makefile to create the two fundamental directories to every C/C++ project, use `make init`

*The default names for the source and header directories are 'src' and 'include' respectively.*

## Compiling and Linking the project

- To both compile and link the project, use `make` or `make all`



## Tutorial

### Linux

```
mkdir <project name>
cd <project name>
mkdir vendor && cd vendor
git clone https://github.com/talberko1/makefile.git
cd ..
cp vendor/makefile/Makefile .
make init
```

- After adding files to the source and header directories, lets compile and link:

`make all`