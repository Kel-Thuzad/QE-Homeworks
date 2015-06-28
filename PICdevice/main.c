unsigned int interrupt_counter;
bit mode;
unsigned short value;
void interrupt()
{
	if (INTCON.T0IF == 1)
	{
		interrupt_counter ++;
		INTCON.T0IF = 0;
	}
	if (INTCON.INTF == 1)
	{
		mode = ~mode;
		if (mode == 1)
			value = 63; //111111 in binary
		else
			value = 42; //101010 in binary
		PORTC = 0;
		PORTC = value;
		interrupt_counter = 0;
		INTCON.INTF = 0;
	}
}

void main()
{
	OPTION_REG.INTEDG = 0; //external interrupt on falling edge
	OPTION_REG.T0CS = 0; //TMR0 Clock Source = Internal instruction cycle clock (CLKOUT)
	INTCON.GIE = 1; //Enables all unmasked interrupts
	INTCON.T0IE = 1; //Enables the TMR0 interrupt
	INTCON.INTE = 1; //Enables the RA2/INT external interrupt
	
	//Port A configuration
	TRISA = 0b101100; //OSC1/OSC2/RESET/INT/A1/A0
	PORTA = 0;
	
	//Port C configuration
	TRISC = 0;
	PORTC = 0;
	
	//Initial values
	INTCON.T0IF = 0; //Timer0 interrupt flag
	INTCON.INTF = 0; //External interrupt flag
	interrupt_counter = 0;
	mode = 0;
	value = 42; //101010 in binary
	PORTC = value;
	
	while(1)
	{
		if (interrupt_counter == 999)
		{
			interrupt_counter = 0;
			PORTC = ~PORTC;
		}
	}
}