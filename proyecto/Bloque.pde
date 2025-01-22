class Bloque {
  int x, y;
  int w, h;
  int value;
  
  Bloque(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void dibujar(){ 
    if(value == Valores.free) fill(100);
    else fill(200);
    
  }
  
  boolean hover(float mouseX, float mouseY){
      return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
  
  
}
