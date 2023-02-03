/*----------------------------------------------------------------------------
 * Name:    sample.c
 * Purpose: to control led through EINT buttons and manage the bouncing effect
 *        	- key1 switches on the led at the left of the current led on, 
 *					- it implements a circular led effect. 	
  * Note(s): this version supports the LANDTIGER Emulator
 * Author: 	Paolo BERNARDI - PoliTO - last modified 15/12/2020
 *----------------------------------------------------------------------------
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2017 Politecnico di Torino. All rights reserved.
 *----------------------------------------------------------------------------*/
                  
#include <stdio.h>
#include "LPC17xx.H"                    /* LPC17xx definitions                */
#include "led/led.h"
#include "button_EXINT/button.h"
#include "timer/timer.h"
#include "RIT/RIT.h"
//#include "joystick/joystick.h"
//#include "adc/adc.h"

/*Chiamata ad una funzione assembler*/
//extern int my_function(int); //Commento0

/* Led external variables from funct_led */
//extern unsigned char led_value;					

#ifdef SIMULATOR
extern uint8_t ScaleFlag; // <- ScaleFlag needs to visible in order for the emulator to find the symbol (can be placed also inside system_LPC17xx.h but since it is RO, it needs more work)
#endif

/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
int main (void) {	
	SystemInit();  												/* System Initialization (i.e., PLL)  */
  
	/*CHIAMATA AD UNA SVC con valore 0xca*/
	//__asm__("SVC 0xca");//Commento1
	
	/*CHIAMATA AD UNA FUNZIONE ASSEMBLER*/
	//my_function(10);//Commento0_1
	
	/*Gestione LEDs */
	LED_init();                           
  
	/*GEstione BUTTONs */
	BUTTON_init();												
	
	/*Gestione RIT 50 msec       */	
	init_RIT(0x004C4B40);								/*100.000.000[Mhz]*0.05[sec]=5.000.000 = 0x004C4B40*/
	enable_RIT();												
	
	/*Gestione TIMER*/
	//init_timer(0, 0, 0, 3, 0x017D7840);   /*25.000.000[Mhz]*1[sec]=25.000.000 = 0x017D7840*/
	//enable_timer(0);
	
	/*Gestione JOYSTICK*/
	//joystick_init();
	
	/*Gestione POTENZIOMETRO*/
	//ADC_init();	
	
	LPC_SC->PCON |= 0x1;									/* power-down	mode										*/
	LPC_SC->PCON &= ~(0x2);						
		
  while (1) {                           /* Loop forever                       */	
		__ASM("wfi");
  }

}
