# Fortran Udunits Test

This repo is for testing Fortran Udunits

## Building with Baselibs

### CMake

```bash
cmake -B build -DCMAKE_INSTALL_PREFIX=install -DCMAKE_PREFIX_PATH=/path/to/baselibs/install
```
such that `/path/to/baselibs/install` contains the following directories:
* `include/udunits2`
* `lib/libudunits2.a`
* `Fortran_UDUNITS2-1.0`

A build of ESMA-Baselibs-7.15.1 or higher should have this.

### Build and Install

```bash
cmake --build build --target install
```

## Running the code
```bash
./install/bin/test_f_udunits_2
```

### UDUNITS2_XML_PATH

Note that you might need to set `UDUNITS2_XML_PATH` in your environment to point to the
right udunits2.xml file.  This is the file that contains the unit definitions.  It is
located at `/path/to/baselibs/install/share/udunits/udunits2.xml` if you are using the
baselibs install above.
