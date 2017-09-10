__author__ = 'Arjun Balakrishnan'

import os
import re
import binascii
import codecs

regex = r'\s'
r = ['ADD','SUB','AND','OR','NOR']
l = ['BEQ','BNE','BLT','JMP']
table = {
    "ADD"  : ['00','10'],
    "SUB"  : ['00','11'],
    "AND"  : ['00','12'],
    "OR"   : ['00','13'],
    "NOR"  : ['00','14'],
    "ADDI" : "01",
    "SUBI" : "02",
    "ANDI" : "03",
    "ORI"  : "04",
    "SHL"  : "05",
    "SHR"  : "06",
    "LW"   : "07",
    "SW"   : "08",
    "BLT"  : "09",
    "BEQ"  : "0A",
    "BNE"  : "0B",
    "JMP"  : "0C",
    "HAL"  : "3F"
}

labels = []
pos = []
shamt = "00000"

#line = 'LABEL: ADDI R1,R2,R3'
#line = 'LABEL: ADDI R1,R2,0x00A2'
#line = 'LABEL: ADDI R1,R2,LABEL'

def addlabel(line,i):
    global labels
    if line.find(":") != -1:
        label = line.split(":")
        labels.append(label[0])
        pos.append(i)
    return 1

def replacereg(reg):
    dummy = reg.split("R")
    if len(dummy) == 1:
        use = dummy[0]
    else:
        use = dummy[1]
    return bin(int(use,16))[2:].zfill(5)

def replaceopcode(op):
    return bin(int(op, 16))[2:].zfill(6)

def replacefunc(func):
    return bin(int(func, 16))[2:].zfill(6)

def replaceimm(imm):
    return bin(int(imm, 16))[2:].zfill(16)

def parser(filename):
    file = open(filename,'r')
    #file = codecs.open(filename, 'r', 'utf-8-sig')
    textfile = open('C:/Users/Arjun/Desktop/output.txt','w')
    i=0
    for line in file:
        str = ""
        labelfound = 0
        parts = line.split(" ")
        if len(parts) == 3:
            #global labelfound
            addlabel(line,i)
            #thing = parts[0].split(":")
            parts[0] = parts[1]
            parts[1] = parts[2]
        opcode = parts[0]
        if len(parts)!=1:
            operands = parts[1].split(",")
        else:
            pass
        if opcode in table:
            if opcode in r:
                bin_val = table[opcode]
                op = bin_val[0]
                func = bin_val[1]
                #if labelfound == 1:
                    #str = str + labels[pos.index(i)]
                str = str + replaceopcode(op) + replacereg(operands[0]) + replacereg(operands[1]) + replacereg(operands[2]) + shamt + replacefunc(func)
            else:
                global labels
                op = table[opcode]
                if opcode in l:
                    str = str + replaceopcode(op) + replacereg(operands[0]) + replacereg(operands[1])
                    operands[2] = operands[2].strip('\n')
                    if operands[2] in labels:
                        imm_pos = labels.index(operands[2])
                        imm = pos[imm_pos]
                        if (opcode != "JMP") :
                            imm = (i+1)-imm
                        imm = bin(imm)[2:].zfill(16)
                        str = str + imm
                    else:
                        imm = operands[2]
                        str = str + replaceopcode(op) + replacereg(operands[0]) + replacereg(operands[1]) + replaceimm(imm)
                else:
                    if opcode == "HAL":
                        str = str + replaceopcode(op) + replaceimm("0x00")
                    else:
                        imm = operands[2]
                        str = str + replaceopcode(op) + replacereg(operands[0]) + replacereg(operands[1]) + replaceimm(imm)

        i = i + 1
        str =  "\"" + str+ "\""
        textfile.write(line.strip('\n') + "\t" + str + '\n')
        textfile.write(",")

parser('C:/Users/Arjun/Desktop/assembly.txt')