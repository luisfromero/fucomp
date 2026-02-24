3*4
a=3+a
a=4
print(a*3)

x=3


import sys # Para obtener los argumentos de entrada al script
import numpy as np # Librería matemática, para binary_repr
a=3
a
print(np.binary_repr(23))

#Con len() obtengo la longitud del array de cadenas argv
# argv contiene el nombre del script como primera cadena
# las siguientes cadenas son los parámetros de entrada al script
if (len(sys.argv) != 2): #Si no hay un parámetro de entrada lo pido por pantalla
  num = input("Inserte un número: ") #El número se almacena en num en formato cadena
  num = int(num)                     #Lo convierto a entero con int
else: #Si el número se pasó como argumento a ejemplo.py lo leo de argv
  #Imprimo por pantalla con print
  print ("Ejecutando %s %s" % (sys.argv[0], sys.argv[1]))
  #Alternativa de uso de print
  #print ("Ejecutando", sys.argv[0], sys.argv[1])
  num = int(sys.argv[1]) # argv contiene cadenas, paso argv[1] a entero

#Aquí ya tengo el valor de num y puedo operar con él
print("El número introducido es %d, en decimal" % num)
print("%d tiene %d bits" % (num,num.bit_length())) #Obtengo el número de bits de num
numbin = np.binary_repr(num) #Obtengo num en representación binaria (como cadena de caracteres)
print("En binario: %s" % numbin)

