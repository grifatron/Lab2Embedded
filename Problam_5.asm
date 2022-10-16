;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

			mov.w	#00F1h,R4;
			mov.w	#0F01h,R5;

Main:
			cmp.w	R4,R5;
            jeq		Main;

            cmp.w	R4,R5;
            jge		greater;

            cmp.w	R4,R5;
            jl		less;

            jmp 	Main;

greater:
            mov.w	#0001h,&02000h;
            mov.w	#0002h,&02002h;
            mov.w	#0003h,&02004h;
            mov.w	#0004h,&02006h;
            mov.w	#0005h,&02008h;
            dec.w	R4
            jmp		Main;

less:
            mov.w	#000Ah,&02000h;
            mov.w	#0009h,&02002h;
            mov.w	#0008h,&02004h;
            mov.w	#0007h,&02006h;
            mov.w	#0006h,&02008h;
            dec.w	R4
            jmp		Main;

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
