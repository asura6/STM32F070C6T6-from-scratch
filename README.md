# STM32F070C6T6-from-scratch
This repository contains examples on how do program and use the STM32F070C6T6
microcontroller and its peripherals. The examples are simple and easy to use as
I have programmed them stand-alone without external libraries. The
programs are written from scratch in the sense that only the CMSIS register
definitions are used.

The programs are all compiled with gcc and makefiles meaning that no IDE is
required unless you want to use one.

The makefile includes scripts to program the device with a JLink device.

The programs are all self-contained and increment in number as more
functionality is added. The first example toggles an on-board LED while latter
examples add more complex functionality.
