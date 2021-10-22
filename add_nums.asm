global _start

add:
  mov eax, [esp+4]
  add eax, [esp+8]
  ret 

section .data
  msg1 db "Enter your first number", 0x0a
  len1 equ $-msg1
  msg2 db "Enter your second number", 0x0a
  len2 equ $-msg2
  msg db "Your result is "
  len equ $-msg

section .bss
  n1 resd 4
  n2 resd 4
  res resd 4

section .text
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, len1
  int 0x80
  
  mov eax, 3
  mov ebx, 0
  mov ecx, n1
  mov edx, 4
  int 0x80
  sub [n1], dword 48

  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 0x80
    
  mov eax, 3
  mov ebx, 0
  mov ecx, n2
  mov edx, 4
  int 0x80
  sub [n2], dword 48

  push dword [n1]
  push dword [n2]
  call add
  mov [res], eax
  add [res], dword 48

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, res
  mov edx, 4
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
