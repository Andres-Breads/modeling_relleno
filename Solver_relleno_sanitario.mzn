% Cargar datos:
int: n; % Tamaño del mapa
int: m; % Número de ciudades
set of int: REGION = 0..n;
set of int: NCIUDADES = 1..m;
array[NCIUDADES, 1..2] of REGION: ciudades;

% Variables:
var 0..n: relleno_x;
var 0..n: relleno_y;
var 0..n+n: distancia;
var REGION: ciudad_cercana_x;
var REGION: ciudad_cercana_y;

% Restricciones:
constraint distancia = min(i in NCIUDADES)(
  abs(relleno_x - ciudades[i,1]) + abs(relleno_y - ciudades[i,2])
);
constraint forall(i in NCIUDADES)(
  if distancia = abs(relleno_x - ciudades[i,1]) + abs(relleno_y - ciudades[i,2])
  then ciudad_cercana_x = ciudades[i,1] /\ ciudad_cercana_y = ciudades[i,2]
  else true endif
);
/*constraint forall(i in 1..m)(
  if relleno_x == ciudad_cercana_x /\ relleno_y == ciudad_cercana_y then false else true endif
);*/

% Objetivo
solve maximize abs(relleno_x - ciudad_cercana_x) + abs(relleno_y - ciudad_cercana_y);
%solve maximize distancia;