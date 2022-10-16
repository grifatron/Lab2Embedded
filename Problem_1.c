#include <msp430.h> 



float count = 2.1;

void main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    int x = 5;
    unsigned char a = 0x01;
    unsigned char b = 0x02;
    x++;
    count--;
    unsigned char c = a & b;
    unsigned char d = a | b;

   while(1){


   }
}
