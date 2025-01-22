class Enemigo {
  PImage imgE = loadImage("enemigo1.png");
  int saludEnemigo = 50;
  int x = 50, y = 50;
  int xC, yC;
  int mobId = -1;
  int size = 50;
  int mobWalk = 0;
  int up = 0, down = 1, right = 2, left = 3;
  int dir = down;
  boolean isUp = false;
  boolean isDown = false;
  boolean isLeft = false;
  boolean isRight = false;
  boolean inGame = false;
  boolean explotado = false;
  float walkFrame = 0, walkSpeed = 100;
  float movementSpeed = 2;


  
  public void spawn(int mobId) {
    for(int i = 0; i<bloque[0].length; i++){
      if(bloque[0][i].value == Valores.path){
        rect(bloque[0][i].x, bloque[0][i].y, size, size);
        x = bloque[0][i].x;
        y = bloque[0][i].y;
        xC = i;
        yC = 0;
      }
    }
    this.mobId = mobId;
    inGame = true;
  }
  
  //movimiento
  void walk() {
    if(walkSpeed > walkFrame) {
      if(dir == down) {
        y += movementSpeed;
      } else if (dir == up) {
        y -= movementSpeed;
      } else if (dir == right) {
        x += movementSpeed;
      } else if (dir == left) x -= movementSpeed;
      
      mobWalk += movementSpeed;
      if(mobWalk >= tablero.bloqueTam){
        if(dir == down) {
          yC += 1;
          isDown = true;
        } else if (dir == up) {
          yC -= 1;
          isUp = true;
        } else if (dir == right) {
          xC += 1;
          isRight = true;
        } else if (dir == left) {
          xC -= 1;
          isLeft = true;
        }  
        
        // Llega al final del camino 
        if(bloque[yC][xC].value == Valores.fin && inGame){
          inGame = false;
          salud -= 20;
          ctdInGame--;
          return;
        }
        
        if(bloque[yC+1][xC].value == Valores.path && !isUp) {
          dir = down;
        } else if(bloque[yC-1][xC].value == Valores.path && !isDown) {
          dir = up;
        } else if(bloque[yC][xC+1].value == Valores.path && !isLeft) {
          dir = right;
        } else if(bloque[yC][xC-1].value == Valores.path && !isRight) {
          dir = left;
        }
        isUp = false;
        isDown = false;
        isLeft = false;
        isRight = false;
        mobWalk = 0;
      }
      
      dibujar();
        
      walkFrame = 0;
    } 
     walkFrame +=1;
    
  }
  
    
  void dibujar() {
    if(inGame) {
      imgE.resize(50,50);
      image(imgE,x,y);
      fill(0,150,0);
      textSize(15); 
      text(saludEnemigo,x+15,y-10);
    }
  }
  
}
