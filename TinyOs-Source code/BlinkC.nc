// $Id: BlinkC.nc,v 1.6 2010-06-29 22:07:16 scipio Exp $

/*									tab:4
 * Copyright (c) 2000-2005 The Regents of the University  of California.  
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
  *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the University of California nor the names of
 *   its contributors may be used to endorse or promote products derived
  *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
  * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Copyright (c) 2002-2003 Intel Corporation
 * All rights reserved.
 *
  * This file is distributed under the terms in the attached INTEL-LICENSE     
 * file. If you do not find these files, copies can be found by writing to
 * Intel Research Berkeley, 2150 Shattuck Avenue, Suite 1300, Berkeley, CA, 
 * 94704.  Attention:  Intel License Inquiry.
 */

/**
 * Implementation for Blink application.  Toggle the red LED when a
 * Timer fires.
 **/

#include "Timer.h"
#include "printf.h"
//#include "stdbool.h"
//#include <stdio.h>

module BlinkC @safe()
{
 uses interface Timer<TMilli> as Timer0;
  //uses interface Timer<TMilli> as Timer1;
  //uses interface Timer<TMilli> as Timer2;
  uses interface Leds;
  uses interface Boot;
}
implementation
{
 event void Boot.booted()
  {
    call Timer0.startPeriodic( 60000 );
    //call Timer1.startPeriodic( 500 );
    //call Timer2.startPeriodic( 1000 );
    
  }
	uint32_t personCode = 10809307;
	//bool l0Status =false;
	//bool l1Status = false;
	//bool l2Status = false;
	uint8_t l0Status =0;
	uint8_t l1Status =0;
	uint8_t l2Status =0;
	//uint8_t stepArray[3];	
  event void Timer0.fired()
  {
  //dbg("BlinkC", "Timer 0 fired @ %s.\n", sim_time_string());
    //do{
     if(personCode>=2){
     	uint8_t r = personCode % 3;
		personCode = personCode/3;
		//printf("PersonCode:  %ld\n ",personCode);
		//printf("r is: %u\n",r);
	
		if(r==0){
			//printf("Here r is 0 \n");
			if(l0Status == 0){
				call Leds.led0Toggle();
				l0Status = 1;
				//printf("l0Status changed from 0 to 1: %u\n", l0Status);
				printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();
			}
			else{ 
			call Leds.led0Toggle();
				l0Status = 0;
				//printf("l0Status changed from 1 to 0: %u\n", l0Status);
				printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();	
			}
		}
		else{
		if(r==1){
				//printf("Here r is 1 \n");
				//printfflush();
				if(l1Status == 0){
					call Leds.led1Toggle();
					l1Status = 1;
				//printf("l0Status changed from 0 to 1: %u\n", l0Status);
					printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();
				}
				else{ 
				call Leds.led0Toggle();
				l1Status = 0;
				//printf("l0Status changed from 1 to 0: %u\n", l0Status);
				printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();	
				}
			}
		else{ 
		//printf("Here r is 2 \n");
				//printfflush();	
				if(l2Status == 0){
					call Leds.led0Toggle();
					l2Status = 1;
				//printf("l0Status changed from 0 to 1: %u\n", l0Status);
					printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();
			}
				else{ 
				call Leds.led2Toggle();
					l2Status = 0;
				//printf("l0Status changed from 1 to 0: %u\n", l0Status);
				printf("%u",l0Status);
		//printf(",");
				printf("%u",l1Status);
		//printf(",");
				printf("%u",l2Status);
		//printf(",");
				printf("\n");
				printfflush();	
				}
			}
		}
		//printf("-------------------- \n");
		//printfflush();
		//stepArray[0] = l0Status;
		//stepArray[1] = l1Status;
		//stepArray[2] = l2Status;
		 //for(uint8_t i = 0; i <= 3; i++) {
     //printf("%d\n", stepArray[i]);
  		//}
		//printf("%d",stepArray);
		//printfflush();
		
		
		
      
	
	
		
	}
	
	else{
		 call Timer0.stop();
		 //printf("The timer is stopped");
	}   
  }
}


