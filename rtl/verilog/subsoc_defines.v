//
// Currently, it's for Xilinx SPARTAN3 FPGA only
// Define FPGA manufacturer
//`define GENERIC_FPGA
//`define ALTERA_FPGA
`define XILINX_FPGA

// 
// Define FPGA Model (comment all out for ALTERA)
//
//`define SPARTAN2
`define SPARTAN3
//`define SPARTAN3E
//`define SPARTAN3A
//`define VIRTEX
//`define VIRTEX2
//`define VIRTEX4
//`define VIRTEX5


//
// Memory
//
`define MEMORY_ADR_WIDTH   12	//MEMORY_ADR_WIDTH IS NOT ALLOWED TO BE LESS THAN 12, memory is composed by blocks of address width 11
			        //Address width of memory -> select memory depth, 2 powers MEMORY_ADR_WIDTH defines the memory depth 
				//the memory data width is 32 bit, memory amount in Bytes = 4*memory depth

//
// TAP selection
//
//`define GENERIC_TAP
`define FPGA_TAP

//
// Start-up circuit (only necessary later to load firmware automatically from SPI memory)
//
//`define START_UP

//
// Connected modules
//
`define UART
`define SFIFO_IF    // SYNC_FIFO InterFace
`define SSIF        // Servo/Stepper InterFace

//
// Interrupts
//
`define APP_INT_RES1	1:0
`define APP_INT_UART	2
`define APP_INT_RES2	3
`define APP_INT_ETH	4
`define APP_INT_PS2	5
`define APP_INT_RES3	19:6

//
// Address map
//
`define APP_ADDR_DEC_W	8
`define APP_ADDR_SRAM	`APP_ADDR_DEC_W'h00   // t0
`define APP_ADDR_FLASH	`APP_ADDR_DEC_W'h04   // t1
`define APP_ADDR_DECP_W  4
`define APP_ADDR_PERIP  `APP_ADDR_DECP_W'h9
`define APP_ADDR_SFIFO	`APP_ADDR_DEC_W'h9d   // t4, SYNC_FIFO
`define APP_ADDR_SSIF	`APP_ADDR_DEC_W'h9e   // t7, Servo/Stepper InterFace
`define APP_ADDR_SPI	`APP_ADDR_DEC_W'h97
`define APP_ADDR_ETH	`APP_ADDR_DEC_W'h92
`define APP_ADDR_UART	`APP_ADDR_DEC_W'h90
`define APP_ADDR_PS2	`APP_ADDR_DEC_W'h94
`define APP_ADDR_RES2	`APP_ADDR_DEC_W'h9f
