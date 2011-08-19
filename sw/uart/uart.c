#include <board.h>
#include <support.h>
#include <or1200.h>
#include <int.h>

#include <uart.h>

int main()
{
	uart_init();

	int_init();
	int_add(UART_IRQ, &uart_interrupt, NULL);
	
	/* We can't use printf because in this simple example
	   we don't link C library. */
	uart_print_str("Hello World.\n\r");
	
	report(0xdeaddead);
	or32_exit(0);
}
