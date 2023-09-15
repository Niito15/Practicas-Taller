program ejercicio3P3;

type
{registro de las notas de alumnos del registro del primer inciso}
datosfinal=record
codigo:integer;
nota:real;
end;

{lista para almacenar datos de finales rendidos por los alumnos del registro del inciso 1}
listaFinales=^nodofinal;
nodofinal=record
item:datosfinal;
sig:listaFinales;
end;

{registro de alumnos para el primer inciso}
alumno=record
legajo:integer;
dni:integer;
ingreso:integer;
finales:listaFinales;
end;

{arbol de alumnos para el primer inciso}
arbol=^nodo;
nodo=record
dato:alumno;
HI:arbol;
HD:arbol
end;

{registro para guardar los datos del alumno con mayor promedio}
alumnoMaxProm=record;
legajoMax:integer;
promMax:real;

{registro de los datos para la lista de retorno}
datosRetorno=record
dniRetorno:integer;
ingresoRetorno:integer
end;

{lista que retorna los dni menores al dato ingresado con su año de ingreso}
listaRetorno=^nodoRetorno;
nodoRetorno=record
datoRetorno:datosRetorno;
sig:listaRetorno;
end;

procedure leerDatosFinales (var d:datosfinal);
begin
writeln('ingrese el codigo de la materia rendida');
readln(d.codigo);
if (d.codigo<>-1) then begin
writeln('ingrese la nota obtenida');
readln(d.nota);
end;
end;

procedure agregarAdelante (var l:listaFinales;d:datosfinal);
var
nue:listaFinales;
begin
new(nue);
nue^.item:=d;
nue^.sig:=l;
l:=nue;
end;

procedure cargarLista (var l:listaFinales);
var
d:datosfinal;
begin
leerDatosFinales(d);
while (d.codigo<>-1) do begin
agregarAdelante(l,d);
leerDatosFinales(d);
end;
end;


procedure leerDatosAlumno(var a:alumno);
begin
writeln('ingrese el legajo del alumno');
readln(a.legajo);
if (a.legajo<>0) then begin
writeln('ingrese el DNI del alumno');
readln(a.dni);
writeln('ingrese el ingreso del alumno');
readln(a.ingreso);
cargarLista(a.finales);
end;
end;

procedure agregarArbol (var a:arbol; alu:alumno);
begin
if (a=nil) then begin
new(a);
a^.dato:=alu;
a^.HI:=nil;
a^.HD:=nil
end
else
	if ((alu.legajo)<=(a^.dato.legajo)) then
	agregarArbol(a^.HI,alu)
	else
	agregarArbol(a^.HD,alu);
end;

procedure generarArbol (var a:arbol);
var
alu:alumno;
begin
leerDatosAlumno(alu);
while (alu.legajo<>0) do begin
agregarArbol(a,alu);
leerDatosAlumno(alu);
end;
end;


	procedure agregarAdelanteRetorno (var lr:listaRetorno;a:arbol);
	var
	nue:listaRetorno;
	begin
	new(nue);
	nue^.datoRetorno.dniRetorno:=a^.dato.dni;
	nue^.datoRetorno.ingresoRetorno:=a^.dato.ingreso;
	nue^.sig:=lr;
	lr:=nue;
	end;
	
	procedure cargarListaRetorno (var lr:listaRetorno;a:arbol;num:integer);
	begin
	if (a<>nil) then begin
		if ((a^.dato.legajo)<=num) then
		agregarAdelanteRetorno(lr,a);
		cargarListaRetorno(lr,a^.HI,num);
	end;
	end;



procedure crearlistaRetorno (var lr:listaRetorno;a:arbol);
var
num:integer;
begin
writeln('ingrese un numero y se buscara año de ingreso y dni con legajos menores a ese numero');
readln(num);
cargarListaRetorno(lr,a,num);
end;

function MaxLegajo (a:arbol):integer;
begin
if (a=nil) then
MaxLegajo:=-1
else
	if (a^.HD=nil) then
	MaxLegajo:=a^.dato.legajo
	else
	MaxLegajo:=MaxLegajo(a^.HD);
end;

procedure MaxDNI (a:arbol;var max:integer);
begin
if (a<>nil) then
MaxDNI(a^.HI,max);
	if ((a^.dato.dni)>max) then
	max:=a^.dato.dni;
MaxDNI(a^.HD,max);
end;

function Impar (a:arbol);
var
dig:integer;
begin
dig:=a^.dato.legajo mod 10;
 if ((dig mod 2)=0) then
 Impar:=false;
 else
 Impar:=true;
end;

procedure ImparDNI (a:arbol;var cantLegajosImpares:integer);
begin
if (a<>nil) then
ImparDNI(a^.HI,max);
	if (Impar(a)) then
	cantLegajosImpares:=cantLegajosImpares+1;
ImparDNI(a^.HD,max);
end;

procedure MayorPromedio(a:arbol, var am:alumnoMaxProm);
begin
MayorPromedio(a^.HI,am);
	obtenerMaxPromedio(am);
MayorPromedio(a^.HD,am);
end;

procedure recorrerListaFinales (lf:listaFinales);
begin
while (l<>nil) do begin

l:=l^.sig;
end;



procedure MayorPromedio (a:arbol;maxPromedio:integer)
begin
MayorPromedio(a^.HI,maxPromedio);
	
MayorPromedio(a^.HD,maxPromedio);
end;

var
a:arbol; lr:listaRetorno; max:integer; cantLegajosImpares:integer;
begin
cantLegajosImpares:=0;
max:=-1;
lr:=nil;
a:=nil;
generarArbol(a);
crearlistaRetorno(lr,a);
writeln(MaxLegajo(a));
MaxDNI(a,max);
	if max = -1 then
		writeln('No se encontraron alumnos con DNI.')
	else
		writeln('El DNI más grande es ', max);

end.


