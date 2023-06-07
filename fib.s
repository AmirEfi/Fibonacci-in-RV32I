j main # jump to main

fibonacci: # fibonacci function
	addi sp , sp , -12 # save regs
	sw a0, 4(sp) # store a0 to sp[1]
	sw ra, 0(sp) # store return address to sp[0]
    
    addi t0, zero, 0 # t0 = 0
    bne a0, t0, else # check if n == 0 
    addi a0, zero, 0 # a0 = 0
    addi sp, sp, 12 # restore sp
    jr ra # return
	
    else:
    	addi t1, zero, 1 # t1 = 1
   		bne a0, t1, over # check if n == 1
    	addi a0, zero, 1 # a0 = 1
   		addi sp, sp, 12 # restore sp
        jr ra # return
    
    
	over:
		addi a0, a0, -1 # a0 = a0 - 1
    	jal fibonacci # recursive call for (n-1)
    	sw a0, 8(sp) # store return of fib(n-1) to sp[2]
    
    	lw t2, 4(sp) # load the value of fib(n) to t2
    	addi a0, t2, -2 # a0 = t2 - 2
    	jal fibonacci # recursive call for (n-2)
    	lw t3, 8(sp) # load the value of fib(n-1) to t3
    	lw ra, 0(sp) # load the value of return address
    	addi sp, sp, 12 # restore sp
    	add a0, t3, a0 # a0 = t3 + a0 and the final result
    	jr ra # return
    
main:

	addi a0, zero, 5 # array[0]
    jal fibonacci
    
    addi a0, zero, 3 # array[1]
    jal fibonacci
    
    addi a0, zero, 0 # array[2]
    jal fibonacci
    
    addi a0, zero, 4 # array[3]
    jal fibonacci
    
    addi a0, zero, 1 # array[4]
    jal fibonacci
   
    addi a0, zero, 2 # array [5]
    jal fibonacci
    
    