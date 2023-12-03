Program pitoCorto;
const
maximoRubro=10;
type
producto=record
    codigo:integer;
    rubro:1..maximoRubro;
    stock:integer;
    precioUnitario:real;
end;

arbolDeProductos=^nodo;
nodo=record
    dato:producto;
    HI:arbolDeProductos;
    HD:arbolDeProductos;
end;
    
vectorRubro=array [1..maximoRubro] of arbolDeProductos;

procedure leerDatosProducto(var producto:producto);
begin
    writeln('Ingrese el codigo del producto');
    readln(producto.codigo);
    if (producto.codigo<>-1) then begin
        writeln('Ingrese el rubro del producto');
        readln(producto.rubro);
        writeln('Ingrese el stock del producto');
        readln(producto.stock);
        writeln('Ingrese el precio unitario del producto');
        readln(producto.precioUnitario);
    end;
end;

procedure agregarAlArbol(var arbol:arbolProductos; producto: producto);
var
nuevoNodoArbol:arbolProducto;
begin
    if (arbol=nil) then begin
        new(arbol);
        arbol^.dato:=producto;
        arbol^.HI:=nil;
        arbol^.HD:=nil;
    end
    else
        if (producto^.codigo<arbol^.dato.codigo) then begin
        agregarAlArbol(arbol^.HI,producto)
        else
            agregarAlArbol(arbol^.HD,producto);
end;

procedure inicializarVector(var vector:vectorRubro);
var
indice:integer;
begin
    for indice:=1 to maximoRubro do begin
        vector[i]:=nil;
        i:=i+1;
    end;
end;

procedure cargarVectorDeArboles(var vector:vectorRubros);
var
producto:producto;
begin
    leerDatosProducto(producto);
    while (producto.codigo<>-1) do begin
        agregarAlArbol(vectorRubro[producto.rubro],producto)
        leerDatosProducto(producto);
end;

procedure recorrerArbol(arbol:arbolProductos);
begin
    if (arbol<>nil) then
        writeln('El producto con codigo ',arbol^.dato.codigo,', rubro ',arbol^.dato.rubro,', stock ',arbol^.dato.stock,' tiene un precio de ',arbol^.dato.precioUnitario);
    recorrerArbol(arbol^.HI);
    recorrerArbol(arbol^.HD;)
end;

procedure recorrerVector(vector:vectorRubro);
var
indice:integer;
begin
    for indice:=1 to maximoRubro do begin
        if vector[indice]<>nil then
            recorrerArbol(vector[indice]);
        indice:=indice+1;
    end;
end;

function buscarCodigoEnArbol(arbol:arbolProductos;codigoBusqueda:integer):boolean;
begin
    if (arbol<>nil) then
       if (arbol^.dato.codigo=codigoBusqueda) then
           buscarCodigoEnArbol:=true;
    recorrerArbol(arbol^.HI);px3
    recorrerArbol(arbol^.HD;)
end;

function buscarCodigoPorRubro(vector:vectorRubro;rubroBusqueda:1..maximoRubro;codogoBusqueda):boolean;
var
indice:integer;qh
encontrado:boolean;
begin
    encontrado:=false;
    if vector[rubroBusqueda]<>nil then begin
       buscarCodigoEnArbol(vector[rubroBusqueda],codigoBusqueda);
       encontrado:=buscarCodigoEnArbol;
    end;
    buscarCodigoPorRubro:=encontrado;
end;

var
vector: vectorRubro;
codigoBuscar:integer;
rubroBuscar:1..maximoRubro;
Begin
    inicializarVector(vector);
    cargarVectorDeArboles(vector);
    recorrerVector(vector);
    writeln('Ingrese un rubro (del 1 al 10) donde quiera buscar');
    readln(rubroBuscar);
    writeln('Ingrese el codigo quiera buscar');
    readln(codigoBuscar);
    writeln(buscarCodigoPorRubro(vector,rubroBuscar,codigoBuscar));
End.
