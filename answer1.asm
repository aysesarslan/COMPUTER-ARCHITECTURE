.data
my_array: .word 4, 8, 15, 16, 23, 42
.text
la $s0, my_array   # based address of list loaded into $s0
addi $s1, $zero, 6 # $s1 is set to the size of the list
addi $t0,$zero,0   # index = 0
while_1: slt $s2,$t0,$s1 # while_1: index <len(my_data)
beq $s2,$zero,end_1
sll $s3,$t0,2
add $s3,$s3,$s0
lw $s4,0($s3) # $s4 = my_array[index] (item)
addi $t1,$zero,0 # k=0
addi $t2,$zero,2 # i=2
addi $t3,$s4,1 # item + 1 ($t3)
while_2: slt $s2,$t2,$t3 # while_2: i < item + 1
beq $s2,$zero,end_2
andi $t4,$t2,1 # i & 1
bne $t4,$zero,end_if # if i & 1 is not equal to zero it is not an even number
addi $t1,$t1,1 # k += 1
end_if: addi $t2,$t2,1 # i += 1
j while_2
end_2: sw $t1,0($s3) #my_data[index] = k
addi $t0,$t0,1 #index += 1
j while_1
end_1:
