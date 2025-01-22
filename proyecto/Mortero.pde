class Mortero{
  PImage imgMortero;
  
  int x, y;
  int xFoco, yFoco;
  int diamFoco = 20;
  int diamBala = 350;
  int dimension = 180;
  int tamExplosion = 250;
  int tamMax = 400;
  int damage = 35;
  int delayMira = 15;
  int auxDelay = 0;
  int delaySigDisparo = 2000; //en milisegundos
  int xDisparo = 0;
  int yDisparo = 0;
  
  //variables utiles para el delay
  long tiempoActual;
  long ultimoTiempoRegistrado;
  
  boolean listo = true;
  boolean apuntando = false;
  boolean atacar = false;
  
  PImage imgMira;
  PImage imgExplosion;
  
  Mortero(int X, int Y, PApplet p){
    x = X;
    y = Y;
    xFoco = x + 55;
    yFoco = y + 25;
    imgMortero = p.loadImage("baseMortero.png");
    imgMira = p.loadImage("mira.png");
    imgExplosion = p.loadImage("explosion.png");
    imgMortero.resize(dimension,dimension);
    imgMira.resize(dimension/2,dimension/2);
    imgExplosion.resize(tamExplosion, tamExplosion);
  }
  
  void dibujar(PApplet p){
    p.image(imgMortero, x, y);
    if (listo == true && apuntando == false && auxDelay == 0) // apuntado disponible
      p.fill(50,205,50); 
    else{ 
      p.fill(255,0,0);
      auxDelay += 5;
      if(auxDelay >= delaySigDisparo){
        auxDelay = 0;
        listo = true;
      }  
    }
    p.circle(xFoco , yFoco, diamFoco);
    
  }
  
  boolean apuntar(PApplet p){
    float distancia = dist(p.mouseX, p.mouseY, xFoco, yFoco);
    if (distancia <= diamFoco / 2 && p.mousePressed && listo && !procesado){
      procesado = true;
      apuntando = true;
    }
    if (apuntando == true){
      auxDelay = 1;
      p.fill(255,0,0);
      p.circle(xFoco , yFoco, diamFoco);
      p.image(imgMira,p.mouseX-(dimension/4),p.mouseY-(dimension/4));
      if(p.mousePressed && !procesado){ 
        procesado = true;
        atacar = true;
        apuntando = false;
        xDisparo = p.mouseX;
        yDisparo = p.mouseY;
        return atacar;
      }
      return atacar; 
    }
    return atacar; 
  }
  
  boolean atacar(Enemigo e, PApplet p){
    if(diamBala > 10){
      p.fill(0,0,0);
      p.circle(xDisparo,yDisparo,diamBala);
      diamBala -= 5;
    }
    if(diamBala <= 10){
      p.image(imgExplosion,xDisparo-(tamExplosion/2),yDisparo-(tamExplosion/4));
      tamExplosion += 8;
      imgExplosion.resize(tamExplosion, tamExplosion/2);
      if(enemigoDentroRango(e) && e.explotado == false){
           e.saludEnemigo -= damage;
           e.explotado = true;
       }
      if(tamExplosion >= tamMax && tamExplosion < tamMax + 10){  
        if(enemigoDentroRango(e) && e.explotado == true){
           e.explotado = false;
        }
        tamExplosion++;
      }
      if(tamExplosion >= tamMax + 10){
         atacar = false;
         reset();
         listo = false;
         return atacar;
      }
    }
    return atacar; 
  }
  
  boolean enemigoDentroRango(Enemigo e) {
    float distancia = dist(xDisparo, yDisparo, e.x + e.size / 2, e.y + e.size / 2);
    return distancia <= tamExplosion / 2;
  }
  
  void reset(){
    tamExplosion = 150;
    diamBala = 350;  
  }
  
  void mouseReleased(){
    procesado = false;
  }
  
}
