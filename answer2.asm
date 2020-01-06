.data
my_array: .word 4, 8, 15, 16, 23, 42
.text
la $s0, my_array #based address of list loaded into $s0
addi $s1, $zero, 6 #$s1 is set to the size of the list
addi $t0,$zero,0 #index = 0 ($t0)
srl $t1,$s1,1 #len(my_array)/2 ($t1)
while: slt $t2,$t0,$t1 # while: i<len(my_array)/2
beq $t2,$zero,Exit
sll $t3,$t0,2
add $t3,$t3,$s0
lw $t4,0($t3) # $t4 = a[i]
add $t5,$t0,$t1
andi $t6,$s1,1
beq $t6,$0,end_if
addi $t5,$t5,1
end_if: sll $t7,$t5,2
add $t7,$t7,$s0
lw $t8,0($t7) # $t8 = i + len(a) / 2
sw $t8,0($t3) 
sw $t4,0($t7)
addi $t0,$t0,1 #i+=1
j while
Exit:
