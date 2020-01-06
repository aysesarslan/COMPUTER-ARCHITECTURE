.data
my_array: .word 4, 8, 15, 16, 23, 42
.text
la $s0, my_array   
addi $s1, $zero, 6

addi $t4,$0,0
w_2:slt $t5,$t4,$s1
beq $t5,$0,end_2
sll $t6,$t4,2
add $t6,$s0,$t6
lw $t7,0($t6)
add $a0,$t7,$0
jal is_prime
sw $v0,0($t6)
addi $t4,$t4,1
j w_2

is_prime:
addi $t7,$0,2
w_1: slt $t5,$t7,$a0 
beq $t5,$0,end_1
div $a0,$t7
mfhi $t2
bne $t2,$0,end_if
addi $v0,$0,0
j exit
end_if: addi $t7,$t7,1
j w_1
end_1: addi $v0,$0,1
exit:
jr $ra

end_2: