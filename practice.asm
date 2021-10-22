global _start

print:
  mov eax, 4
  mov ebx, 1
  mov ecx, [esp+4]
  mov edx, [esp+8]
  int 0x80
  ret

section .data
  num1 db 0 


section .text
_start: 
  
test:
  push 1
  add byte[num1], 48
  push num1
  call print
  sub byte[num1], 48
  inc byte[num1]
  add esp, 8
  cmp byte[num1], 10
  jl test


  mov eax, 1 ;exit with status code 0
  mov ebx, 0
  int 0x80
