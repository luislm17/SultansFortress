//Este es el nuevo

//Objetos de tienda y torretas
Tienda tienda;
Imagenes imagenes;
ArrayList<Canon> torresCanones;
ArrayList<Pinchos> torresPinchos;
ArrayList<Glaciar> torresGlaciar;
ArrayList<Mortero> torresMortero;

//Imagenes de torretas en campo
PImage bg;
PImage basura;

//Dimensiones de campo de batalla
public static int anchoBG = 1000;
public static int altoBG = 618;

//Salud y dinero
public static int salud = 100;
public static int dinero = 50;

//Variables de mapa
Bloque bloque[][];
Tablero tablero;
int id;
boolean edoMortero;
boolean procesado = true;

//Variables de enemigos
Enemigo[] enemigos = new Enemigo[26];
public int cdSpawn = 100, delay = 0;
public int spawnI;
public int rondas[] = {3, 5, 8, 10}; // ctd de enemigos x ronda
public int rondasI = 0;
public int ctdInGame; // ctd de enemigos en pantalla

//Pantallas
Pantallas p;
PImage bgInicio;
PImage bgGameOver;
PImage gameOver;
int opc = -1;

void setup() {
  size(1000, 800);
  
  bg = loadImage("fondo.png");
  bg.resize(anchoBG,altoBG);
  torresCanones = new ArrayList<Canon>();
  torresPinchos = new ArrayList<Pinchos>();
  torresGlaciar = new ArrayList<Glaciar>();
  torresMortero = new ArrayList<Mortero>();
  
  tienda = new Tienda(this);
  imagenes = new Imagenes(this);  
  tablero = new Tablero();
  
  //Generar enemigos
  for(int i = 0; i < enemigos.length; i++){
    enemigos[i] = new Enemigo();
  }
  ctdInGame = rondas[0];
  
  p = new Pantallas();
}

void draw() {
  if(salud != 0){
    p.inicio(this);
    //torretasColocadas();
  }
  if(salud <= 0)
    p.gameOver();
}




void spawnEnemigos () {
  int maxEnemigos = rondas[rondasI];
    if(delay >= cdSpawn && spawnI < maxEnemigos && ctdInGame > 0){
      enemigos[spawnI] = new Enemigo();
      enemigos[spawnI].spawn(spawnI);
      if(enemigos[spawnI].inGame) {
        enemigos[spawnI].dibujar();
      }
      spawnI+=1;
      delay = 0;
    }
    delay += 1;
    
    for(int i = 0; i < enemigos.length; i++){
      if(enemigos[i].inGame && enemigos[i].saludEnemigo > 0){
        enemigos[i].walk();
        torretasColocadas(enemigos[i]);
      }else {
        torretasPuestas();
        
      }
    }
    // cambio de ronda
    if(ctdInGame < 1){
      rondasI++;
      spawnI =0;
      if(rondasI >= rondas.length) {
        p.victoria(this);
       }
      else ctdInGame = rondas[rondasI];
      
    } 
}

void torretasColocadas(Enemigo e){

  for (Canon tc : torresCanones) {
        tc.dibujar(this);
        if(e.inGame && e.saludEnemigo > 0){
          tc.ataque(e,this);
        }
        if(e.saludEnemigo <=0){
          ctdInGame--;
          dinero += 50;
        }
        //tc.ataque(this);
  }
  for (Pinchos tp : torresPinchos) {
        tp.dibujar(this);
        if(e.inGame && e.saludEnemigo > 0){
          tp.ataque(e, this);
        }
        if(e.saludEnemigo <=0){
          ctdInGame--;
          dinero += 50;
        }
        
  }
  for (Glaciar tg : torresGlaciar) {
        tg.dibujar(this);
        if(e.inGame && e.saludEnemigo > 0){
          tg.ataque(e, this);
        }
        if(e.saludEnemigo <=0){
          ctdInGame--;
          dinero += 50;
        }
  }
  for (Mortero tm : torresMortero) {
        tm.dibujar(this);
        edoMortero = tm.apuntar(this);
        if(edoMortero && e.inGame && e.saludEnemigo > 0)
          tm.atacar(e,this);
        if(e.saludEnemigo <=0){
          ctdInGame--;
          dinero += 50;
        }
  }
}

void torretasPuestas(){

  for (Canon tc : torresCanones) {
        tc.dibujar(this);
  }
  for (Pinchos tp : torresPinchos) {
        tp.dibujar(this);        
  }
  for (Glaciar tg : torresGlaciar) {
        tg.dibujar(this);
  }
  for (Mortero tm : torresMortero) {
        tm.dibujar(this);
  }
}

//debug
void mouseCoord() { 
  fill(255,255,255);
  textSize(15);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );
}
