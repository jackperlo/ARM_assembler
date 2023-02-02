/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_RIT.c
** Last modified Date:  2014-09-25
** Last Version:        V1.00
** Descriptions:        functions to manage T0 and T1 interrupts
** Correlated files:    RIT.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "lpc17xx.h"
#include "RIT.h"
//#include "../adc/adc.h"
#include "../led/led.h"
#include "../timer/timer.h"
#include "../../common.h"

/******************************************************************************
** Function name:		RIT_IRQHandler
**
** Descriptions:		REPETITIVE INTERRUPT TIMER handler
**
** parameters:			None
** Returned value:		None
**
******************************************************************************/

/*variabili per gestione debouncing dei buttons*/
volatile int down_0 = 0;
volatile int down_1 = 0;
volatile int down_2 = 0;

void RIT_IRQHandler (void)
{		
	
	/*GESTIONE ADC*/
	//ADC_start_conversion();
	
	static int j_select=0, j_left=0, j_right=0, j_down=0, j_up=0;
	
	/*Gestione Joystick Polling*/
	if((LPC_GPIO1->FIOPIN & (1<<25)) == 0){ //joystick select
		j_select++;
		switch(j_select){
			case 1:
				break;
			//per controllare pressioni prolungate: es. 5[sec]/50[msec](RIT timer) = 100
			//case 100:
			//	break;
			default:
				break;
		}
	}else
		j_select=0;
	
	if((LPC_GPIO1->FIOPIN & (1<<26)) == 0){ //joystick down
		j_down++;
		switch(j_down){
			case 1:
				break;			
			default:
				break;
		}
	}else
		j_down=0;
	
	if((LPC_GPIO1->FIOPIN & (1<<27)) == 0){ //joystick left
		j_left++;
		switch(j_left){
			case 1:
				break;			
			default:
				break;
		}
	}else
		j_left=0;
	
	if((LPC_GPIO1->FIOPIN & (1<<28)) == 0){ //joystick right
		j_right++;
		switch(j_right){
			case 1:
				break;			
			default:
				break;
		}
	}else
		j_right=0;
	
	if((LPC_GPIO1->FIOPIN & (1<<29)) == 0){ //joystick up
		j_up++;
		switch(j_up){
			case 1:
				break;			
			default:
				break;
		}
	}else
		j_up=0;
	
	/*Gestione BUTTONS*/
	if(down_0!=0){  
			down_0 ++;  
			//controllo il piedino fisico 10->INT0, 11->KEY1, 12->KEY2
			if((LPC_GPIO2->FIOPIN & (1<<10)) == 0){ 
				switch(down_0){
				case 2:
					//codice da eseguire in caso di pressione del button
					break;
				//per controllare pressioni prolungate: es. 5[sec]/50[msec](RIT timer) = 100
				//case 100:
				//	break;
				default:
					//se voglio gestire il button on X click
					//if(down_0 % X == 0){
					//}					
					break;
			}
		}
		else {	/* button released */
			down_0=0;			
			NVIC_EnableIRQ(EINT0_IRQn);							 /* enable Button interrupts			*/
			LPC_PINCON->PINSEL4    |= (1 << 20);     /* External interrupt 0 pin selection */
		}
	}
	
	if(down_1!=0){  
			down_1 ++;  
			//controllo il piedino fisico 10->INT0, 11->KEY1, 12->KEY2
			if((LPC_GPIO2->FIOPIN & (1<<11)) == 0){ 
				switch(down_1){
				case 2:
					//codice da eseguire in caso di pressione del button
					break;				
				default:
					//se voglio gestire il button on X click
					//if(down_1 % X == 0){
					//}					
					break;
			}
		}
		else {	/* button released */
			down_1=0;			
			NVIC_EnableIRQ(EINT1_IRQn);							 /* enable Button interrupts			*/
			LPC_PINCON->PINSEL4    |= (1 << 22);     /* External interrupt 0 pin selection */
		}
	}
	
	if(down_2!=0){  
			down_2 ++;  
			//controllo il piedino fisico 10->INT0, 11->KEY1, 12->KEY2
			if((LPC_GPIO2->FIOPIN & (1<<12)) == 0){ 
				switch(down_2){
				case 2:
					//codice da eseguire in caso di pressione del button
					break;				
				default:
					//se voglio gestire il button on X click
					//if(down_2 % X == 0){
					//}					
					break;
			}
		}
		else {	/* button released */
			down_2=0;			
			NVIC_EnableIRQ(EINT2_IRQn);							 /* enable Button interrupts			*/
			LPC_PINCON->PINSEL4    |= (1 << 24);     /* External interrupt 0 pin selection */
		}
	}
	
	
	reset_RIT();
  LPC_RIT->RICTRL |= 0x1;	/* clear interrupt flag */
	
  return;
}

/******************************************************************************
**                            End Of File
******************************************************************************/
