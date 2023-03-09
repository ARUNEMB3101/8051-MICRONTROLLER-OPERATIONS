ORG 0000H
SETB P3.7; CONFIGUROING AS INPUT
MOV P0,#0XFF
AGAIN: MOV A,#00H
READ: JB P3.7,$; WAIT TILL SWITCH IS OPEN
JNB P3.7,$; WAIT TILL SWITCH IS CLOSED
CJNE A,#0x0A, EXECUTE
SJMP AGAIN
EXECUTE:MOV DPTR,#9000H
PUSH A 
MOVC A,@A+DPTR
MOV P0,A
POP A
INC A 
SJMP READ

ORG 9000H
DB 0XC0, 0XF9, 0XA4, 0XB0, 0X99, 0X92, 0X82,0XF8,0X80,0X90
END 