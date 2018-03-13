/* Linkfile for a STM32F070C6T6*
 * Robin Isaksson 2016 
 */ 

/* MEMORY STRUCTURE
 *  Program flash:   32 KB: start 0x08000000
 *  SRAM:             6 KB: start 0x20000000
 */

MEMORY { 
    SRAM :       ORIGIN = 0x20000000, LENGTH = 6K
    FLASH :      ORIGIN = 0x08000000, LENGTH = 32K 

} 

SECTIONS {
    _STACK_TOP = 0x20000000 + 6K;
    . = 0x00000000;

   .text : {
       KEEP ( * (vectors) );
       * (.text); 
    } > FLASH

    .rodata : {
        * (.rodata);
    } > FLASH 
    FLASH_DATA_START = .; /*Where we will load from flash when writing to SRAM */ 

    /* Now we'll configure where we will keep our data outside off flash */ 
    . = 0x20000000;
    SRAM_DATA_START = .; 

    .data : AT (FLASH_DATA_START) {
        * (.data);
    } > SRAM
    SRAM_DATA_END = .;
    SRAM_DATA_SIZE = SRAM_DATA_END - SRAM_DATA_START;

    BSS_START = .;
    .bss : {
        * (.bss);
        * (COMMON);
    } > SRAM
    BSS_END = .;
    BSS_SIZE = BSS_END - BSS_START; 
} 

ENTRY(main)
