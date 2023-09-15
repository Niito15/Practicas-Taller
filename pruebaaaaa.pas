program prueba;

type
alumno=record
legajo:integer;
dni:integer;
ingreso:integer;
end;

arbol=^nodo;
nodo=record
dato:alumno;
HI:arbol;
HD:arbol;
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

{procedure MaxDNI (a:arbol;var max:integer);
begin
if (a<>nil) then
begin
MaxDNI(a^.HI,max);
	if ((a^.dato.dni)>max) then
	max:=a^.dato.dni;
MaxDNI(a^.HD,max);
end;
end;
}
function Impar (a:arbol):boolean;
var
dig:integer;
begin
if (a<>nil) then begin;
	dig:=a^.dato.legajo mod 10;
		if ((dig mod 2)=0) then
		Impar:=false
		else
		Impar:=true;
end
else
Impar:=false;
end;

procedure ImparDNI (a:arbol;var cantLegajosImpares:integer);
begin
if (a<>nil) then
ImparDNI(a^.HI,cantLegajosImpares);
	if (Impar(a)) then
	cantLegajosImpares:=cantLegajosImpares+1;
ImparDNI(a^.HD,cantLegajosImpares);
end;

var
a:arbol; {max:integer;} cantImpares:integer;
{num:integer;}
begin
cantImpares:=0;
{max:=-1;}
a:=nil;
generarArbol(a);
{MaxDNI(a,max);}
ImparDNI(a,cantImpares);
 if (cantImpares=0) then
 writeln ('No hay DNI impar')
 else
 writeln('La cant de dnis impares es de',cantImpares);
{readln(num);
writeln(num mod 10);
writeln (num div 10);
writeln ((num mod 10) mod 2)
}
end.
