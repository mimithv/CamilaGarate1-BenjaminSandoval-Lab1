.data
	mensaje: .asciiz "Ingrese 2 binarios. Presione enter luego de ingresar cada cifra de izquierda a derecha\n\n"
	entrada1: .asciiz "Binario 1: \n\n"
	entrada2: .asciiz "\nBinario 2: \n\n"
	mensajeError: .asciiz "\nError"
	resultado: .asciiz "\nResultado: "
	
.text

	main:
		#Instrucciones de entrada
		li $v0, 4
		la $a0, mensaje
		syscall
		
		#Valores posibles 0 o 1
		addi $t1, $zero, 0
		addi $t2, $zero, 1
	
		#Solicita el primer binario
		li $v0, 4
		la $a0, entrada1
		syscall
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		la $s0, 0x100100a0 #Guarda la dirección elegida en s0
		sb $t0, 0($s0) # guarda t0 en la primera casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 4($s0) # guarda t1 en la segunda casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 8($s0) # guarda t2 en la tercera casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 12($s0) # guarda t3 en la cuarta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 16($s0) # guarda t4 en la quinta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 20($s0) # guarda t5 en la sexta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 24($s0) # guarda t6 en la séptima casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 28($s0) # guarda t7 en la octava casilla
		
		#Solicita el segundo binario
		li $v0, 4
		la $a0, entrada2
		syscall
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		la $s1, 0x100100c0 #Guarda la dirección elegida en s0
		sb $t0, 0($s1) # guarda t0 en la primera casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 4($s1) # guarda t1 en la segunda casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
		
		#se guarda en la dirección especificada
		sb $t0, 8($s1) # guarda t2 en la tercera casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
	
		#se guarda en la dirección especificada
		sb $t0, 12($s1) # guarda t3 en la cuarta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
	
		#se guarda en la dirección especificada
		sb $t0, 16($s1) # guarda t4 en la quinta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
	
		#se guarda en la dirección especificada
		sb $t0, 20($s1) # guarda t5 en la sexta casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
	
		#se guarda en la dirección especificada
		sb $t0, 24($s1) # guarda t6 en la séptima casilla
		
		#Guarda el bit ingresado en $t0
		jal pedirValor
		jal BitApropiado
	
		#se guarda en la dirección especificada
		sb $t0, 28($s1) # guarda t7 en la octava casilla
		
		#Operar
	
		#Guarda las direcciones de memoria de los números ingresados en los registro $a0 y $a1
		move $a0, $s0
		move $a1, $s1
	
		#Carga cada bit en un registro temporal (binario 1)
		lb $t0, 0($a0)
		lb $t1, 4($a0)
		lb $t2, 8($a0)
		lb $t3, 12($a0)
		lb $t4, 16($a0)
		lb $t5, 20($a0)
		lb $t6, 24($a0)
		lb $t7, 28($a0)
		
		#Carga cada bit en un registro temporal (binario 2)
		lb $s0, 0($a1)
		lb $s1, 4($a1)
		lb $s2, 8($a1)
		lb $s3, 12($a1)
		lb $s4, 16($a1)
		lb $s5, 20($a1)
		lb $s6, 24($a1)
		lb $s7, 28($a1)
		
		#Opera cada bit guardando el resultado en los registros temporales
		xor $t0, $t0, $s0
		xor $t1, $t1, $s1
		xor $t2, $t2, $s2
		xor $t3, $t3, $s3
		xor $t4, $t4, $s4
		xor $t5, $t5, $s5
		xor $t6, $t6, $s6
		xor $t7, $t7, $s7
	
		#Carga el resultado en la dirección especificada
		la $a2, 0x100100e0
		sb $t0, 0($a2)
		sb $t1, 4($a2)
		sb $t2, 8($a2)
		sb $t3, 12($a2)
		sb $t4, 16($a2)
		sb $t5, 20($a2)
		sb $t6, 24($a2)
		sb $t7, 28($a2)
	
		#Mensaje resultado
		li $v0, 4
		la $a0, resultado
		syscall
	
		#Imprime el resultado bit a bit
		move $a0, $t0
		jal ValorResultado
	
		move $a0, $t1
		jal ValorResultado
	
		move $a0, $t2
		jal ValorResultado
	
		move $a0, $t3
		jal ValorResultado
	
		move $a0, $t4
		jal ValorResultado
	
		move $a0, $t5
		jal ValorResultado
	
		move $a0, $t6
		jal ValorResultado
	
		move $a0, $t7
		jal ValorResultado
	
	#Fin programa
	li $v0, 10
	syscall
	
	pedirValor:
	
		#pedido
		li $v0, 5
		syscall
	
		jr $ra
	
	CargarEnTemporal:
	
		#guarda el bit en el registro $t0
		move $t0, $v0
	
		jr $ra
		
	BitApropiado:
	
		beq $v0, $t1, CargarEnTemporal
		beq $v0, $t2, CargarEnTemporal
		
		#Imprime un mensaje de error
		li $v0, 4
		la $a0, mensajeError
		syscall
		
		#Fin programa
		li $v0, 10
		syscall

	ValorResultado:
	
		li $v0, 1
		syscall
		
		jr $ra