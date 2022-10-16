#include <msp430.h> 


void main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    signed int a = 20000;
    signed int b = 20000;
    signed int c = add(a, b);

   while(1){


   }
}


int add(int a, int b){
    return a + b;
}
