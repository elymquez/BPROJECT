/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>

#include "io.h"
#include "system.h"
#define DELAY 1000000

int main()
{

	int counter = 0;
	unsigned int wait;
	printf("Lets start counting \n");
	IOWR_8DIRECT(LEDS_BASE,0,0);
	while(1)
	{ counter ++;
	printf("counter = %d \n",counter);
	IOWR_8DIRECT(LEDS_BASE,1,counter);
	// silly busy wait
	for(wait = 0; wait < DELAY; wait++)
	asm volatile ("nop");
	}


}
