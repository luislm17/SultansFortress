class Glaciar{
   PImage imgGlaciar;
   PImage imgArea;
   
   int x, y;
   int ancho = 180;
   int alto = 130;
   int transparencia = 50;
 
  Glaciar(int X, int Y, PApplet p){
    x = X;
    y = Y;
    imgGlaciar = p.loadImage("Glaciar.png");
    imgArea = p.loadImage("areaGlaciar.png");
    imgGlaciar.resize(ancho,alto);
    imgArea.resize(ancho*3,alto*3);
  }
  
  void dibujar(PApplet p){
    p.image(imgGlaciar, x, y);
    p.tint(255, transparencia);
    //p.image(imgArea,x-(ancho/2),y-(alto/2));
    //p.tint(255, 255);
  }
  
  void ataque(Enemigo e, PApplet p){
    if(dist(float(e.x), float(e.y), float(x), float(y)) < ancho){
      e.movementSpeed = 1;
    }
    else e.movementSpeed = 2;
  }
  
  
}
