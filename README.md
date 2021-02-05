# Linux-Cpp-Project-Setup
This repository consists of a comprehensive folder structure with a source-code/scripts for inter-process communication, Doxygen source-code documentation, Catch2 Unit Testing, Gcov/Lcov Code-Coverage Analysis and, multi-level Makefiles. This project is intended for setting up C/C++ projects on Linux.     

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
This project is meant to act as a template for any programmer who wants to build a C/C++ application from the ground-up. The template project includes easy usage of the following features in a typical C/C++ project that needs to be built:

#### [Inter-Process Communication library (POSIX Shared Memory and Message Queue)](https://en.wikipedia.org/wiki/Inter-process_communication)
#### [Doxygen Source Code Documentation](https://www.doxygen.nl/index.html)
#### [CCCC(C and C++ Code Counter)](https://sourceforge.net/projects/cccc/)
#### [CppCheck (Static C/C++ Code Analysis)](https://en.wikipedia.org/wiki/Cppcheck)
#### [Catch2 Unit Testing Setup](https://github.com/catchorg/Catch2)

### Prerequisites

You will require a linux-distro to download and build the application. As the IPC uses Posix library, Windows OS will not be able to compile this project. This project was created using Ubuntu 20.04.2 LTS. This has also been tested on the latest Debian Buster release.  

### Installing

This project is meant to be a starting point for a C/C++ application typically being run on an embedded system. 

```
git clone https://github.com/maharshi66/Linux-Cpp-Project-Setup.git
cd Linux-Cpp-Project-Setup
```
Checkout the structure of the folder and the main makefile in the build folder inside the cpp-project-name to get a better hang of the setup. 

![alt text](https://github.com/maharshi66/Linux-Cpp-Project-Setup/blob/main/resources/cpp_project_folder_structure.png?raw=true)

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

[Maharshi Shah](https://github.com/maharshi66)

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/maharshi66/Linux-Cpp-Project-Setup/blob/main/LICENSE) file for details
