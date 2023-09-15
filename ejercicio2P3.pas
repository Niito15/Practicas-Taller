program ejercicio2P3;

type
ventas=record
cod_producto:integer;
fecha:integer;
cant_uniVendidas:integer;
end;

arbol=^nodo;
nodo=record
dato:ventas;
HI:arbol;
HD:arbol;
end;

producto=record
codigo:integer;
cantTotalVendido:integer;
end;

arbol2=^nodo2;
nodo2=record
dato2:producto;
HI2:arbol2;
HD2:arbol2;
end;


procedure leerDatos (var v:ventas);
begin
writeln('Ingrese un codigo de producto');
readln(v.cod_producto);
if(v.cod_producto<>0) then begin
writeln('Ingrese fecha de venta');
readln(v.fecha);
writeln('Ingrese cantidad total vendida');
readln(v.cant_uniVendidas);
end;
end;

procedure agregar (var a:arbol;v:ventas);
begin
if (a=nil) then begin
new(a);
a^.dato:=v;
a^.HI:=nil;
a^.HD:=nil;
end
else
if ((v.cod_producto)<=(a^.dato.cod_producto)) then
agregar(a^.HI,v)
else
agregar(a^.HD,v);
end;

procedure crearArbol (var a:arbol);
var
v:ventas;
begin
leerDatos(v);
while (v.cod_producto<>0) do begin
agregar(a,v);
leerDatos(v);
end;
end;

{procedure crearOtroArbol (var a2:arbol2;a:arbol);
begin
if (a<>nil) then begin
	new(a2);
	if (a2=nil) then begin
	a2^.dato2.codigo:=a^.dato.cod_producto;
	a2^.dato2.cantTotalVendido:=0+a^.dato.cant_uniVendidas;
	a^.HI:=nil;
	a^.HD:=nil;
	end
	else
		if ((a^.dato.cod_producto)<(a2^.dato2.codigo))then
		crearOtroArbol(a2^.HI2,a^.HI)
		else
		crearOtroArbol(a2^.HD2,a^.HD);
end;
end;}

procedure agregarArbol2(var a2:arbol2;a:arbol);
begin
if (a2=nil) then begin
	new(a2);
	a2^.dato2.codigo:=a^.dato.cod_producto;
	a2^.dato2.cantTotalVendido:=a^.dato.cant_uniVendidas;
	a2^.HI2:=nil;
	a2^.HD2:=nil;
	end
	else
		if ((a^.dato.cod_producto)=(a2^.dato2.codigo)) then
		a2^.dato2.cantTotalVendido:=(a2^.dato2.cantTotalVendido)+(a^.dato.cant_uniVendidas)
		else
			if ((a^.dato.cod_producto)<=(a2^.dato2.codigo)) then
			agregarArbol2(a2^.HI2,a^.HI)
			else
			agregarArbol2(a2^.HD2,a^.HD);
end;



procedure imprimirArbol (a2:arbol2);
begin
imprimirArbol(a2^.HI2);
writeln(a2^.dato2.codigo);
writeln(a2^.dato2.cantTotalVendido);
imprimirArbol(a2^.HD2);
end;

var
a:arbol;a2:arbol2;
begin
a:=nil;
a2:=nil;
crearArbol(a);
agregarArbol2(a2,a);
imprimirArbol(a2);
end.
