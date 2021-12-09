//Programa de inyeccion de combustible
MOV R1,#30 //Espacio de memoria 30
MOV R2,#5 //Inyeccion de combustible para más de 1000RPM
MOV R3,#6 //Inyeccion de combustible para más de 2000RPM
MOV R4,#7 //Inyeccion de combustible para más de 4000RPM
MOV R5,#8 //Inyeccion de combustible para más de 6000RPM
LOOP INP R0,2 //El sensor de cigüeñal lee las RPM
STR R0,(R1) //Se almacena en memoria principal
JMS ECU //Manda la señal a la ECU y lo procesa
JMS INYECTORES //La ECU manda la señal a los inyectores de cuanta gasolina
inyectar a la camara de combustion
SALIDA ADD R1,#1 //Sumamos una localidad de memoria para almacenar el siguiente dato
BRA LOOP
ECU
CMP R0,#1 //Subrutina de ECU
BEQ RPM1
CMP R0,#2
BEQ RPM2
CMP R0,#3
BEQ RPM3
CMP R0,#4Francisco Rocha Juárez. A01730560. Avance 3
BEQ RPM4
RET
INYECTORES NOP //Subrutina de inyectores
RPM1
OUT R2,4
BRA SALIDA
RPM2
OUT R3,4
BRA SALIDA
RPM3
OUT R4,4
BRA SALIDA
RPM4
OUT R5,4
BRA SALIDA
RET
HLT //Nunca termina, ya que en todo momento con el auto en marcha se inyecta
combustible
