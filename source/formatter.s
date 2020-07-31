s* * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
* *                                                 * *
* * M U S T   B E   O N   P A G E   B O U N D A R Y * *
* *                                                 * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
* ORG $7800
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
*                                                     *
*  ProDOS DISK ][ Formatter Device Driver             *
*                                                     *
*  Copyright Apple Computer, Inc., 1982, 1983         *
*                                                     *
*  Enter with ProDOS device number in A-register:     *
*         Zero    = bits 1, 2, 3, 4                   *
*         Slot No.= bits 4, 5, 6                      *
*         Drive 1 = bit 7 off                         *
*         Drive 2 = bit 7 on                          *
*                                                     *
*  Error codes returned in A-register:                *
*         $00 : Good completion                       *
*         $27 : Unable to format                      *
*         $2B : Write-Protected                       *
*         $33 : Drive too SLOW                        *
*         $34 : Drive too FAST                        *
*         NOTE: Carry flag is set if error occured.   *
*                                                     *
*  Uses zero page locations $D0 thru $DD              *
*                                                     *
* * * * * * * * * * * * * * * * * * * * * * * * * * * *
	JSR	*+$3A
	CMP	#$00
	BNE	*+$04
	CLC
	RTS
	CMP	#$02
	BNE	*+$07
	LDA	#$2B
	JMP	*+$12
	CMP	#$01
	BNE	*+$07
	LDA	#$27
	JMP	*+$09
	CLC
	ADC	#$30
	JMP	*+$03
	SEC
	RTS
	ASL	A
	ASL	*+$400
	STA	*+$40F
	TXA
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	TAY
	LDA	*+$406
	JSR	*+$193
	LSR	*+$3EE
	RTS
	TAX
	AND	#$70
	STA	*+$3E6
	TXA
	LDX	*+$3E2
	ROL	A
	LDA	#$00
	ROL	A
	BNE	*+$08
	LDA	$C08A,X
	JMP	*+$06
	LDA	$C08B,X
	LDA	$C089,X
	LDA	#$D7
	STA	$DA
	LDA	#$50
	STA	*+$3C8
	LDA	#$00
	JSR	*-$3E
	LDA	$DA
	BEQ	*+$08
	JSR	*+$2D2
	JMP	*-$07
	LDA	#$01
	STA	$D3
	LDA	#$AA
	STA	$D0
	LDA	*+$3AA
	CLC
	ADC	#$02
	STA	$D4
	LDA	#$00
	STA	$D1
	LDA	$D1
	LDX	*+$39F
	JSR	*-$64
	LDX	*+$399
	LDA	$C08D,X
	LDA	$C08E,X
	TAY
	LDA	$C08E,X
	LDA	$C08C,X
	TYA
	BPL	*+$07
	LDA	#$02
	JMP	*+$5A
	JSR	*+$2C1
	BCC	*+$10
	LDA	#$01
	LDY	$D4
	CPY	*+$374
	BCS	*+$04
	LDA	#$04
	JMP	*+$47
	LDY	$D4
	CPY	*+$368
	BCS	*+$07
	LDA	#$04
	JMP	*+$3B
	CPY	*+$35F
	BCC	*+$07
	LDA	#$03
	JMP	*+$31
	LDA	*+$357
	STA	*+$357
	DEC	*+$354
	BNE	*+$07
	LDA	#$01
	JMP	*+$21
	LDX	*+$348
	JSR	*+$8C
	BCS	*-$10
	LDA	$D8
	BNE	*-$14
	LDX	*+$33C
	JSR	*+$1D
	BCS	*-$1C
	INC	$D1
	LDA	$D1
	CMP	#$23
	BCC	*-$73
	LDA	#$00
	PHA
	LDX	*+$329
	LDA	$C088,X
	LDA	#$00
	JSR	*-$DF
	PLA
	RTS
	LDY	#$20
	DEY
	BEQ	*+$5E
	LDA	$C08C,X
	BPL	*-$03
	EOR	#$D5
	BNE	*-$0A
	NOP
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$AA
	BNE	*-$0C
	LDY	#$56
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$AD
	BNE	*-$17
	LDA	#$00
	DEY
	STY	$D5
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$96
	BNE	*+$32
	LDY	$D5
	BNE	*-$0E
	STY	$D5
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$96
	BNE	*+$23
	LDY	$D5
	INY
	BNE	*-$0E
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$96
	BNE	*+$15
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$DE
	BNE	*+$0C
	NOP
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$AA
	BEQ	*+$5E
	SEC
	RTS
	LDY	#$FC
	STY	$DC
	INY
	BNE	*+$06
	INC	$DC
	BEQ	*-$0B
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$D5
	BNE	*-$0E
	NOP
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$AA
	BNE	*-$0C
	LDY	#$03
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$96
	BNE	*-$17
	LDA	#$00
	STA	$DB
	LDA	$C08C,X
	BPL	*-$03
	ROL	A
	STA	$DD
	LDA	$C08C,X
	BPL	*-$03
	AND	$DD
	STA	$D7,Y
	EOR	$DB
	DEY
	BPL	*-$17
	TAY
	BNE	*-$47
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$DE
	BNE	*-$50
	NOP
	LDA	$C08C,X
	BPL	*-$03
	CMP	#$AA
	BNE	*-$5A
	CLC
	RTS
	STX	*+$271
	STA	*+$26D
	CMP	*+$258
	BEQ	*+$5E
	LDA	#$00
	STA	*+$265
	LDA	*+$24E
	STA	*+$260
	SEC
	SBC	*+$259
	BEQ	*+$39
	BCS	*+$09
	EOR	#$FF
	INC	*+$23E
	BCC	*+$07
	ADC	#$FE
	DEC	*+$237
	CMP	*+$248
	BCC	*+$05
	LDA	*+$243
	CMP	#$0C
	BCS	*+$03
	TAY
	SEC
	JSR	*+$1F
	LDA	*+$14A,Y
	JSR	*+$136
	LDA	*+$232
	CLC
	JSR	*+$15
	LDA	*+$149,Y
	JSR	*+$129
	INC	*+$224
	BNE	*-$41
	JSR	*+$121
	CLC
	LDA	*+$207
	AND	#$03
	ROL	A
	ORA	*+$214
	TAX
	LDA	$C080,X
	LDX	*+$20D
	RTS
	JSR	*+$1E0
	LDA	$C08D,X
	LDA	$C08E,X
	LDA	#$FF
	STA	$C08F,X
	CMP	$C08C,X
	PHA
	PLA
	NOP
	LDY	#$04
	PHA
	PLA
	JSR	*+$5F
	DEY
	BNE	*-$06
	LDA	#$D5
	JSR	*+$56
	LDA	#$AA
	JSR	*+$51
	LDA	#$AD
	JSR	*+$4C
	LDY	#$56
	NOP
	NOP
	NOP
	BNE	*+$05
	JSR	*+$1AC
	NOP
	NOP
	LDA	#$96
	STA	$C08D,X
	CMP	$C08C,X
	DEY
	BNE	*-$0E
	BIT	$00
	NOP
	JSR	*+$199
	LDA	#$96
	STA	$C08D,X
	CMP	$C08C,X
	LDA	#$96
	NOP
	INY
	BNE	*-$0F
	JSR	*+$1E
	LDA	#$DE
	JSR	*+$19
	LDA	#$AA
	JSR	*+$14
	LDA	#$EB
	JSR	*+$0F
	LDA	#$FF
	JSR	*+$0A
	LDA	$C08E,X
	LDA	$C08C,X
	RTS
	NOP
	PHA
	PLA
	STA	$C08D,X
	CMP	$C08C,X
	RTS
	SEC
	LDA	$C08D,X
	LDA	$C08E,X
	BMI	*+$60
	LDA	#$FF
	STA	$C08F,X
	CMP	$C08C,X
	PHA
	PLA
	JSR	*+$5A
	JSR	*+$57
	STA	$C08D,X
	CMP	$C08C,X
	NOP
	DEY
	BNE	*-$0E
	LDA	#$D5
	JSR	*+$5A
	LDA	#$AA
	JSR	*+$55
	LDA	#$96
	JSR	*+$50
	LDA	$D3
	JSR	*+$3A
	LDA	$D1
	JSR	*+$35
	LDA	$D2
	JSR	*+$30
	LDA	$D3
	EOR	$D1
	EOR	$D2
	PHA
	LSR	A
	ORA	$D0
	STA	$C08D,X
	LDA	$C08C,X
	PLA
	ORA	#$AA
	JSR	*+$2A
	LDA	#$DE
	JSR	*+$26
	LDA	#$AA
	JSR	*+$21
	LDA	#$EB
	JSR	*+$1C
	CLC
	LDA	$C08E,X
	LDA	$C08C,X
	RTS
	PHA
	LSR	A
	ORA	$D0
	STA	$C08D,X
	CMP	$C08C,X
	PLA
	NOP
	NOP
	NOP
	ORA	#$AA
	NOP
	NOP
	PHA
	PLA
	STA	$C08D,X
	CMP	$C08C,X
	RTS
	BRK
	BRK
	BRK
	LDX	#$11
	DEX
	BNE	*-$01
	INC	$D9
	BNE	*+$04
	INC	$DA
	SEC
	SBC	#$01
	BNE	*-$0E
	RTS
	DFB	$01,$30,$28
	DFB	$24,$20,$1E
	DFB	$1D,$1C,$1C
	DFB	$1C,$1C,$1C
	DFB	$70,$2C,$26
	DFB	$22,$1F,$1E
	DFB	$1D,$1C,$1C
	DFB	$1C,$1C,$1C
	LDA	*+$BE
	STA	$D6
	LDY	#$80
	LDA	#$00
	STA	$D2
	JMP	*+$05
	LDY	$D4
	LDX	*+$B0
	JSR	*-$C8
	BCC	*+$05
	JMP	*+$93
	LDX	*+$A5
	JSR	*-$153
	INC	$D2
	LDA	$D2
	CMP	#$10
	BCC	*-$19
	LDY	#$0F
	STY	$D2
	LDA	*+$92
	STA	*+$92
	STA	*+$90,Y
	DEY
	BPL	*-$04
	LDA	$D4
	SEC
	SBC	#$05
	TAY
	JSR	*+$6C
	JSR	*+$69
	PHA
	PLA
	NOP
	NOP
	DEY
	BNE	*-$0B
	LDX	*+$74
	JSR	*-$248
	BCS	*+$3E
	LDA	$D8
	BEQ	*+$15
	DEC	$D4
	LDA	$D4
	CMP	*+$60
	BCS	*+$31
	SEC
	RTS
	LDX	*+$5D
	JSR	*-$25F
	BCS	*+$1C
	LDX	*+$55
	JSR	*-$2CA
	BCS	*+$14
	LDY	$D8
	LDA	*+$4E,Y
	BMI	*+$0D
	LDA	#$FF
	STA	*+$47,Y
	DEC	$D2
	BPL	*-$1E
	CLC
	RTS
	DEC	*+$3D
	BNE	*-$25
	DEC	$D6
	BNE	*+$04
	SEC
	RTS
	LDA	*+$2F
	ASL	A
	STA	*+$2E
	LDX	*+$29
	JSR	*-$293
	BCS	*+$08
	LDA	$D8
	CMP	#$0F
	BEQ	*+$09
	DEC	*+$1D
	BNE	*-$11
	SEC
	RTS
	LDX	#$D6
	JSR	*-$03
	JSR	*-$06
	BIT	$00
	DEX
	BNE	*-$09
	JMP	*-$B4
	DFB	$13,$19,$03
	DFB	$10,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
	DFB	$00,$00,$00
