program pruebas;
const
dimF=300;
type
rangoOficinas=1..dimF;

oficina=record
	codigoID:integer;
	dniPropietario:integer;
	expensas:integer;
end;

vectorOficinas=array [rangoOficinas] of oficina;

procedure leerDatosOficina(var o:oficina);
begin
	writeln('Ingrese el codigo de identificacion de la oficina');
	readln(o.codigoID);
	if(o.codigoID<>-1) then begin
		writeln('Ingrese el dni del propietario');
		readln(o.dniPropietario);
		writeln('Ingrese el monto de expensas');
		readln(o.expensas);
	end;
end;

procedure cargarVectorOficinas(var vector:vectorOficinas; var dimlog:integer);
var
o:oficina;
begin
	dimlog:=0;
	leerDatosOficina(o);
	while(o.codigoID<>-1) and (dimlog<=dimf) do begin
		dimlog:=dimlog+1;
		vector[dimlog]:=o;
		leerDatosOficina(o);
	end;
end;

procedure ordenarVector(var vector:vectorOficinas; dimlog:integer);
var
i,j,posicion:integer;
minimo:oficina;
begin
	for i:=1 to dimlog-1 do begin
		posicion:=i;
		for j:=i+1 to dimlog do
			if (vector[j].codigoID<vector[posicion].codigoID) then
				posicion:=j;
		minimo:=vector[posicion];
		vector[posicion]:=vector[i];
		vector[i]:=minimo;
	end;
end;

function busquedaDicotomica(vector:vectorOficinas; datoBuscar:integer;dimlog:integer):boolean;
var
primero,ultimo,medio:integer;
begin
	primero:=1;
	ultimo:=dimlog;
	medio:= (primero+ultimo)/2;
	
end;

var
vector:vectorOficinas;
dimlog:integer;
begin
	cargarVectorOficinas(vector,dimlog);
	writeln('dimension logica: ',dimlog);
	writeln('dimension logica: ',(dimlog/2));
end.
