program ejercicio4P1;
const dimf=8;
type
rangoCodRub=1..8;

producto=record
codProducto:integer;
codRubro:rangoCodRub;
precio:real;
end;

lista=^nodo;
nodo=record
dato:producto;
sig:lista;
end;

vector=array [rangoCodRub] of lista;

procedure leerDatos(var p:producto);
begin
readln (p.precio);
if precio<>0 do begin
readln (p.codProeducto);
readln (p.codRubro);
end;
end;

procedure insertarOrdenado (var l:lista;dato:producto);
var
nue,actual,ant:lista;
begin
new (nue);
nue^.dato:=dato;
nue^.sig:=nil;
	if (l:=nil) then
	l:=nue;
	else begin
	actual:=l;
	ant:=l;
	end;
		while (actual<>nil) and ((actual^.dato)<(nue^.dato)) do begin
		ant:=actual;
		actual:=actual^.sig;
		end;
			if (actual:=l) then begin
			nue^.sig:=l;
			l:=nue;
			end
			else if (actual<>nil) then begin
			ant^.sig:=nue;
			nue^.sig:=actual;
			end;
end;

procedure cargarlista(var l:lista);
var
p:producto;
begin
repeat
leerDatos(p);
insertarOrdenado(l,p);
until (l^.precio:=0);
end;

procedure cargarVector (var v:vector, l:lista,var diml:integer);
var
i:integer
begin
while (l<>nil) do begin
v[l^.dato.codRubro]:=l;

v[l^.dato.codRubro]^.sig:=l;
l:=l^.sig;
end;
end;










