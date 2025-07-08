PImage img0, img1, img2, img3, cono, usuario;

PFont fuente1, fuente2, fuente3, fuente4;

Button goToMiEquipo;
Button goToPizarra;
Button goToResultados;
Button goToGuardados;
Button goToSobreNosotros;

Button save, newPlayer;
Button b1,b2;
Button close;
Button reset;

Pines p;
Table t;
Player p1;
Player p2;
Player p3;

Select entrenamiento,competicion;
Select mediaPista, pistaEntera;


Guardado guardado1;
Guardado guardado2;

int i=0;
int j=0;
int k=0;
int nConos=0;

float ancho= 500;
float alto = ancho*0.62;
float margenVertical = 110;

boolean logged = false;
TextField nombre, posicion1, dayn, monthn, yearn, ndorsal;
TextField nSaved, dSaved, mSaved, ySaved;

TextField s1_1, s1_2, s2_1, s2_2, s3_1, s3_2, s4_1, s4_2, s5_1, s5_2;

int longInfo;

String hability1, hability2, hability3, hability4, hability5;
String s;

int pantalla = 0;

boolean halfB = false;
boolean training = true;

// Número de files (capçalera inclosa) i columnes de la taula
int files = 20, columnes = 3;

// Títols de les columnes 
String[] headers = {"Dorsal", "Nombre", "Posición"};
String[] jugadores = {"", "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8"};
int nPlayers =jugadores.length;

// Amplades de les columnes
//han de sumar 100
float[] colWidths = {10,70,20};
float[] colWidthsPlayers = {20,40,40};

String[][] informacionJugadores;
String [][] infoPartido;
String [] infoPosicion;

int xPosicion = width/2;
int yPosicion = 200;

Resultado r1, r2, r3, r4, r5, r6, r7;

// tu equipo - equipo contrario - set 1 equipo- set 1equipo contrario - set 2 equipo...
int [][] resultados  = {
    {0, 3, 25, 19, 25, 21, 22, 25, 24, 26, 0, 0},
    {1, 3, 25, 19, 22, 25, 24, 26, 15, 25, 0, 0},
    {2, 3, 25, 19, 25, 21, 22, 25, 24, 26,10,15},
    {1, 3, 25, 19, 22, 25, 24, 26, 22, 25, 0, 0},
    {0, 3, 25, 19, 25, 21, 22, 25, 24, 26, 0, 0},
    {1, 3, 25, 19, 22, 25, 24, 26, 15, 25, 0, 0},
    {2, 3, 25, 19, 25, 21, 22, 25, 24, 26,20,25},
    {1, 3, 25, 19, 22, 25, 24, 26, 22, 25, 0, 0},
    {0, 3, 25, 19, 25, 21, 22, 25, 24, 26, 0, 0},
    {1, 3, 25, 19, 22, 25, 24, 26, 15, 25, 0, 0},
    {2, 3, 25, 19, 25, 21, 22, 25, 24, 26,20,25},
    {1, 3, 25, 19, 22, 25, 24, 26, 22, 25, 0, 0},
};
String [] equipos = {"Equipo A", "Equipo B", "Equipo C","Equipo D", "Equipo E", "Equipo F","Equipo G", "Equipo B", "Equipo C","Equipo A", "Equipo B", "Equipo C","Equipo A", "Equipo B", "Equipo C","Equipo X", "Equipo Y", "Equipo Z"};

//formato DD/MM/AAAA
int[][] fecha={
    {10, 02, 2021},
    {13, 03, 2022},
    {10, 02, 2021},
    {13, 03, 2022},
    {10, 02, 2021},
    {13, 03, 2022},
    {10, 02, 2021},
    {13, 03, 2022},
    {10, 02, 2021},
    {13, 03, 2022},
    {10, 02, 2021},
    {13, 03, 2022},
};

Cone cono1;

color currentCol;

Button next, prev, guardarJugador;

ListaPaginada e;

boolean menuDisplayed = false;
PImage [] conos;