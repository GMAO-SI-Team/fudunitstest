# Fortran Udunits Test

This repo is for testing Fortran Udunits

## Building with Baselibs

### Loading modules

To make it easy on discover, you can load a `g5_modules`. So on `bash`:
```bash
source env/g5_modules.sh
```
and on `tcsh`:
```tcsh
source env/g5_modules
```

### CMake

If you are using the `g5_modules` above, then you have `$BASEDIR` set and can do:

```bash
cmake -B build -DCMAKE_INSTALL_PREFIX=install -DCMAKE_PREFIX_PATH=$BASEDIR/Linux
```

If you are not using Baselibs, then you need to set `CMAKE_PREFIX_PATH` to point to
`/path/to/baselibs/install` such that it contains the following directories:

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
right udunits2.xml file.  This is the file that contains the unit definitions.  

This is taken care of for you if you are using the
`g5_modules` above. If not, it is usually located at
`/path/to/baselibs/install/share/udunits/udunits2.xml` if you are using
the baselibs install above.
