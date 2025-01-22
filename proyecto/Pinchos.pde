class Pinchos{
  PImage imgPinchos;
  
  int diam = 60;
  int damage = 1;
  int delay = 60;
  int auxDelay = 0;
  
  int x, y;
  int xAtaque, yAtaque;  
  int radAtaque = diam/2;
  int dimension = 80;

  Pinchos(int X, int Y, PApplet p){
    x = X;
    y = Y;
    imgPinchos = p.loadImage("torreta1.png");
    imgPinchos.resize(dimension, dimension);
  }
  
  void dibujar(PApplet p){
    p.image(imgPinchos, x, y);
    xAtaque = x + (dimension/2);
    yAtaque = y + (dimension/2);
    
  }
  
  void ataque(Enemigo e, PApplet p){
    
    auxDelay++;
     if (auxDelay >= delay){
       if (enemigoDentroRango(e)) {
          e.saludEnemigo -= damage;
        }
       radAtaque++;
       p.fill(128,128,128);
       p.triangle(xAtaque-3, yAtaque-radAtaque+4, xAtaque+7, yAtaque-radAtaque+4, xAtaque+2, yAtaque-radAtaque-6); //superior
       p.triangle(xAtaque-3, yAtaque+radAtaque, xAtaque+7, yAtaque+radAtaque, xAtaque+2, yAtaque+radAtaque+10); //inferior
       p.triangle(xAtaque-radAtaque+4, yAtaque-3, xAtaque-radAtaque+4, yAtaque+7, xAtaque-radAtaque-6, yAtaque+2); //izquierda
       p.triangle(xAtaque+radAtaque, yAtaque-3, xAtaque+radAtaque, yAtaque+7, xAtaque+radAtaque+10, yAtaque+2); //derecha
       p.triangle(xAtaque+radAtaque-12, yAtaque-radAtaque+9, xAtaque+radAtaque-5, yAtaque-radAtaque+15, xAtaque+radAtaque-2, yAtaque-radAtaque+4); //superior derecha
       p.triangle(xAtaque+radAtaque-12, yAtaque+radAtaque-5, xAtaque+radAtaque-5, yAtaque+radAtaque-11, xAtaque+radAtaque-2, yAtaque+radAtaque); //inferior derecha
       p.triangle(xAtaque-radAtaque+14, yAtaque-radAtaque+9, xAtaque-radAtaque+7, yAtaque-radAtaque+15, xAtaque-radAtaque+4, yAtaque-radAtaque+4); //superior izquierda
       p.triangle(xAtaque-radAtaque+14, yAtaque+radAtaque-5, xAtaque-radAtaque+7, yAtaque+radAtaque-11, xAtaque-radAtaque+4, yAtaque+radAtaque); //inferior derecha
     if (radAtaque > diam+30){
       radAtaque = diam/2;
       auxDelay = 0;
     } 
     }
     
  }
  
  boolean enemigoDentroRango(Enemigo e) {
    float distancia = dist(xAtaque, yAtaque, e.x + e.size / 2, e.y + e.size / 2);
    return distancia <= radAtaque + 15; // 15 es el incremento adicional en el radio de ataque
    
  }
  
}
