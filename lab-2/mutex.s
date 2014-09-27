	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
        ldr r1,=locked @lock data
    .L1:
        ldrex r2,[r0] @load r0 exslusive
        cmp r2,#0    @if(r2 load form [r0])
           strexeq r2,r1,[r0]  @store [r0] to r1
           cmpeq r2,#0
           bne .L1   @not successful
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        ldr r1,=unlocked @unlock data
        str r1,[r0]     @store [r0] to r1
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
