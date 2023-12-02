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

function busquedaDicotomica(vector:vectorOficinas; datoBuscar:integer;dimlog:integer):integer;
var
primero,ultimo,medio:integer;
begin
	busquedaDicotomica:=0;
	primero:=1;
	ultimo:=dimlog;
	medio:= (primero+ultimo) div 2;
	while (primero<=ultimo) and (datoBuscar<>vector[medio].codigoID) do begin
		if (datoBuscar<medio) then
			ultimo:=medio-1
		else
			primero:=medio+1;
		medio:=(primero+ultimo) div 2;
	end;
	if (primero<=ultimo) and (datoBuscar=vector[medio].codigoID) then
		busquedaDicotomica:=medio;
end;

function calcularMontoTotal(vector:vectorOficinas;dimlog:integer; var totalExpensas:integer;var i:integer):integer;
begin
	if (i<=dimlog) then begin
		totalExpensas:=vector[i].expensas+totalExpensas;
		i:=i+1;
		calcularMontoTotal(vector,dimlog,totalExpensas,i);
	end;
	calcularMontoTotal:=totalExpensas;0
end;

var
vector:vectorOficinas;
dimlog:integer;
codigoIDparaBuscar, resultadoBusqueda, indice,totalExpensas:integer;
begin
	cargarVectorOficinas(vector,dimlog);
	writeln('dimension logica: ',dimlog);
	{writeln('dimension logica: ',(dimlog/2));}
	ordenarVector(vector,dimlog);
	writeln('Ingrese un codigo de identificacion de oficina para buscarlo: ');
	readln(codigoIDparaBuscar);
	resultadoBusqueda:=busquedaDicotomica(vector,codigoIDparaBuscar,dimlog);
	if (resultadoBusqueda<>0) then
		writeln('El dni del propietario de la oficina ', resultadoBusqueda, ' es: ', vector[resultadoBusqueda].dniPropietario);
	indice:=1;
	totalExpensas:=0;
	writeln('El monto de expensas es ', calcularMontoTotal(vector,dimlog,totalExpensas,indice));
end.
