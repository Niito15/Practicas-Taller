program ejercicio3P1;
const
dimf=300;
type

oficinas=record
cod_ident:integer;
dni:integer;
expensas:real;
end;

vector=array [0..dimf] of oficinas;

procedure leerDatos (var o:oficinas);
begin
writeln('Ingrese el codigo de identificacion');
readln(o.cod_ident);
if (o.cod_ident<>-1) then begin
writeln('Ingrese el dni del propietario');
readln(o.dni);
writeln('Ingrese las expensas');
readln(o.expensas);
end;
end;

procedure cargarVector (var v:vector;var diml:integer);
var
dato:oficinas;
begin
diml:=0;
leerDatos(dato);
while (diml<dimf) and (dato.cod_ident<>-1) do begin
diml:=diml+1;
v[diml]:=dato;
leerDatos(dato);
end;
end;

{procedure ordenarSeleccion (var v:vector; diml:integer);
var
i,j,pos:integer;
dato:oficinas;
begin
for i:=1 to diml-1 do begin
pos:=i;
	for j:=i+1 to diml do
		if ((v[j].cod_ident)<(v[pos].cod_ident)) then
		pos:=j;
dato:=v[pos];
v[pos]:=v[i];
v[i]:=dato;
end;
end;}

procedure ordenarInsercion (var v:vector; diml:integer);
var
i,j:integer;
actual:oficinas;
begin
for i:=2 to diml do begin
actual:=v[i];
j:=i-1;
	while ((j>0)and((v[j].cod_ident)>(actual.cod_ident))) do begin
	v[j+1]:=v[j];
	j:=j-1;
	end;
v[j+1]:=actual;
end;
end;

procedure imprimirVector(v:vector;diml:integer);
var
i:integer;
begin
for i:=1 to diml do begin
writeln(v[i].cod_ident);
writeln(v[i].dni);
writeln(v[i].expensas);
end;
end;

var
v:vector;diml:integer;
begin
cargarVector(v,diml);
{ordenarSeleccion(v,diml);}
ordenarInsercion(v,diml);
imprimirVector(v,diml);
end.

