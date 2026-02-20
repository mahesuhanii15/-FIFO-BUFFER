# FIFO-BUFFER
We design and implement a First-In, First-Out Buffer in Verilog with the following 
specifications: 
1. Synchronous Operation: All state changes (pointer increments, data writes) 
must occur on the rising edge of the CLOCK signal.  
2.  Synchronous Reset: The RESET signal should reset the FIFO to a completely 
empty state, clearing both the read and write pointers. 
3. Read/Write Logic: 
a.  A write operation should only occur when WR_EN is high, and the full flag 
is low.  
b.  A read operation should only occur when RD_EN is high, and the empty 
flag is low.  
c.  If both WR_EN and RD_EN are high in the same clock cycle, the data 
should be written, and a new data item should be read. The total count of 
items in the FIFO should remain unchanged 
4. REQUIRED SOFTWARE USED: 
a. VIVADO Software 
b. FPGA target used for implementation => Zedboard 
THEORY: 
The First-In, First-Out (FIFO) buffer is a fundamental and widely used component in digital 
system design and computing. By definition, a FIFO buffer is a data structure or hardware 
module that stores data such that the first element written into the buffer is the first one to 
be read out. This operational principle ensures that the order of data integrity is preserved, 
making FIFOs essential for orderly, sequential data processing. 
FIFO buffers are sometimes referred to as queue-based storage or circular buffers when 
implemented with wrap-around pointers. They serve as temporary storage to synchronize 
data transfer between components or modules operating at different speeds or clock 
domains. Because independent read and write operations may operate asynchronously or 
at varying rates, FIFOs help smooth out bursts of data and prevent data loss or corruption. 
Typical applications of FIFOs include: 
• Data communication: Holding packets or data frames between interfaces or 
protocols. 
• Clock domain crossing: Buffering data between different clock signals to avoid 
metastability. 
• Pipeline processing: Storing intermediate results in sequential stages of 
computation. 
• Resource decoupling: Allowing producer and consumer blocks to operate 
independently. 

