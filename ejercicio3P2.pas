program ejercicio3P2;
type
lista=^nodo;
nodo=record
dato:integer;
sig:lista
end;

{procedure insertarOrdenado (var l:lista;num:integer);
var
nue, ant, act:lista;
begin
new (nue);
nue^.dato:=num;
nue^.sig:=nil;
if (l=nil) then
l:=nue
else begin
ant:=l;
act:=l;
end;
while (act<>nil) and ((act^.dato)<(nue^.dato)) do begin
ant:=act;
act:=act^.sig;
if act=l then begin
nue^.sig:=l;
l:=nue;
end
else if (act<>nil) then begin
		ant^.sig:=nue;
		nue^.sig:=act;
		end;
end;
end;}

procedure agregaradelante (var l:lista; num:integer);
var
nue:lista;
begin
new (nue);
nue^.dato:=num;
nue^.sig:=l;
l:=nue;
end;

procedure cargarlista (var l:lista);
var
num:integer;
begin
readln(num);
while (num<>0) do begin
{insertarOrdenado(l,num);}
agregaradelante(l,num);
readln(num);
end;
end;

procedure buscarminimo(l:lista; var min:integer);
begin
if (l<>nil) and (l^.dato<min) then begin
min:=l^.dato;
l:=l^.sig;
buscarminimo(l,min);
end;
end;

procedure buscarmaximo(l:lista; var max:integer);
begin
if (l<>nil) and (l^.dato>max) then begin
max:=l^.dato;
l:=l^.sig;
buscarmaximo(l,max);
end;
end;

function buscarValor(l:lista;dato:integer):boolean;
begin
buscarValor:=false;
if (l<>nil) and (l^.dato=dato) then
buscarValor:=true
else
if (l<>nil) then begin
l:=l^.sig;
buscarValor(l,dato);
end;
end;


var
l:lista; min:integer; max:integer;dato:integer;
begin
max:=-1;
min:=100;
cargarlista(l);
buscarminimo(l,min);
buscarmaximo(l,max);
writeln(min);
writeln(max);
writeln('Ingrese un valor a buscar');
readln(dato);
writeln(buscarValor(l,dato));
end.
