class Canon{
  
   int id = 3;
   PImage imgCanon;
   int x, y;
   int area;
   int xInicial = 250;
   int yInicial = 268;
   int xAtaque;
   int yAtaque;
   int delay = 60;
   int auxDelay = 0;
   int dimension = 80;
   int diam = 20;
   int rad = diam/2;
  
   boolean xGolpe = false;
   boolean yGolpe = false;

  
  Canon(int X, int Y, PApplet p) {
    x = X;
    y = Y;
    imgCanon = p.loadImage("canon.png");
    imgCanon.resize(dimension, dimension);
    area = 300;
    xAtaque = x+15;
     yAtaque = y+15;
  }
  
  void dibujar(PApplet p) {
    p.image(imgCanon, x, y); //dibuja desde la esquina superior izquierda de la imagen
  }
  
   void ataque(Enemigo e, PApplet p) {
     if(dist(e.x, e.y, x, y) < area/2){
       auxDelay++;
      if (auxDelay >= delay){
        p.fill(0,0,0);
        p.circle(xAtaque+25,yAtaque+25,diam);
        
        if(e.x+15 > xAtaque)
          xAtaque += 5;
        else if(e.x+15 < xAtaque)
          xAtaque -= 5;
        else
          xGolpe = true;
          
        if(e.y+15 > yAtaque)
          yAtaque += 5;
        else if(e.y+15 < yAtaque)
          yAtaque -= 5;
        else
          yGolpe = true;
          
        if (yGolpe && xGolpe){
          xAtaque = x+15;
          yAtaque = y+15;
          xGolpe = false;
          yGolpe = false;
          e.saludEnemigo-=25;
          auxDelay = 0;
        }
        //auxDelay = 0;
      }
        } 
     
      
    
  }
}
