% Cargar datos:
int: m; % Número de ciudades
int: n; % Tamaño del mapa
set of int: REGION = 0..n;
set of int: NCIUDADES = 1..m;
array[NCIUDADES, 1..2] of REGION: ciudades;

% Variables:
var 0..n: x_relleno;
var 0..n: y_relleno;
var 0..n+n: min_distance;
var REGION: x_ciudad_cercana;
var REGION: y_ciudad_cercana;
min_distance = min(i in NCIUDADES)(
  abs(x_relleno - ciudades[i,1]) + abs(y_relleno - ciudades[i,2])
);

% Restricciones:
/*constraint forall(i in NCIUDADES)(
  x_relleno != ciudades[i,1] /\ y_relleno != ciudades[i,2]
);*/
constraint forall(i in NCIUDADES)(
  if min_distance = abs(x_relleno - ciudades[i,1]) + abs(y_relleno - ciudades[i,2])
  then x_ciudad_cercana = ciudades[i,1] /\ y_ciudad_cercana = ciudades[i,2]
  else true endif
);

% Objetivo
solve maximize abs(x_relleno - x_ciudad_cercana) + abs(y_relleno - y_ciudad_cercana);