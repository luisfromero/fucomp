# Formato de Instrucciones en RISC-V

## Tipos de Formato de Instrucción

### Formato R (Register)
```plaintext
| opcode | rd | funct3 | rs1 | rs2 | funct7 |
|--------|----|--------|-----|-----|--------|
```
**Ejemplo:** `ADD rd, rs1, rs2`

### Formato I (Immediate)
```plaintext
| opcode | rd | funct3 | rs1 | imm[11:0] |
|--------|----|--------|-----|-----------|
```
**Ejemplo:** `ADDI rd, rs1, imm`

### Formato S (Store)
```plaintext
| opcode | imm[4:0] | funct3 | rs1 | rs2 | imm[11:5] |
|--------|---------|--------|-----|-----|-----------|
```
**Ejemplo:** `SW rs2, offset(rs1)`

### Formato B (Branch)
```plaintext
| opcode | imm[11] | imm[4:1] | funct3 | rs1 | rs2 | imm[10:5] | imm[12] |
|--------|--------|----------|--------|-----|-----|----------|---------|
```
**Ejemplo:** `BEQ rs1, rs2, offset`

### Formato U (Upper Immediate)
```plaintext
| opcode | rd | imm[31:12] |
|--------|----|------------|
```
**Ejemplo:** `LUI rd, imm`

### Formato J (Jump)
```plaintext
| opcode | rd | imm[20] | imm[10:1] | imm[11] | imm[19:12] |
|--------|----|---------|----------|--------|------------|
```
**Ejemplo:** `JAL rd, offset`

## Notas
- `opcode`: Código de operación (7 bits)
- `rd`: Registro destino (5 bits)
- `rs1`, `rs2`: Registros fuente (5 bits cada uno)
- `funct3`, `funct7`: Campos de función para definir variantes de instrucciones
- `imm`: Valor inmediato de longitud variable según el tipo de instrucción

Este esquema cubre los formatos básicos de las instrucciones en RISC-V.
