.data
my_array: .word 42, 23, 16, 15, 8, 4 #After running: 4, 8, 15, 16, 23, 42
.text

la $s0, my_array   
addi $s1, $zero, 6

add $a0,$s0,$zero
add $a1, $s1, $zero
addi $t1, $zero, 1

W_1: slt $t3, $t1, $a1
beq $t3, $zero, end_1
sll $t5, $t1, 2
add $t5, $a0, $t5
lw $t0, 0($t5)
addi $t2, $t1, -1
W_2:
slti $t3, $t2, 0
bne  $t3, $zero, end_2
sll $t4, $t2, 2
add $t4, $a0, $t4
lw $t6, 0($t4)
slt $t3, $t0, $t6
beq $t3, $zero, end_2
sw $t6, 4($t4)
addi $t2, $t2, -1
j W_2
end_2:
sll $t4,$t2,2
add $t4,$a0,$t4
sw $t0, 4($t4)
addi $t1, $t1, 1
j W_1
end_1:



