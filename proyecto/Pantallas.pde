class Pantallas {
  PFont font = createFont("Consolas", 72); 
  int opc = -1; // 1:jugar, 2:ayuda
  
  int menu(){
    opc = 0;
    return opc;
  }
  
  void inicio(PApplet p) {
    if(opc <= 0){
      bgInicio = loadImage("inicio1.png");
      bgInicio.resize(1000,800);
      image(bgInicio, 0, 0);
      
      //Titulo
      fill(158,150,175,200);
      rect(width/6, height/6, 4*(width/6), height/(1.5*6));
      fill(255,255,255);
      stroke(255,231,135);
      textFont(font);
      textSize(70);
      textAlign(CENTER);
      text("Sultan's Fortress", width/2, height/4);
      
      //Iniciar juego
      if (hover(mouseX, mouseY, width/3.5, height/2.5, 1.5*(width/3.5), height/(4*2.5))) fill(158,150,175,250);
      else fill(158,150,175,150);
      if(clicked(mouseX, mouseY, width/3.5, height/2.5, 1.5*(width/3.5), height/(4*2.5))) opc = 1;
      rect(width/3.5, height/2.5, 1.5*(width/3.5), height/(4*2.5));
      fill(255,255,255);
      textFont(font);
      textSize(48);
      text("Iniciar juego", width/2, height/2.15);
      
      //Ayuda
      if (hover(mouseX, mouseY, width/3.5, 1.3*(height/2.5), 1.5*(width/3.5), height/(4*2.5))) fill(158,150,175,250);
      else fill(158,150,175,150);
      if(clicked(mouseX, mouseY, width/3.5, 1.3*(height/2.5), 1.5*(width/3.5), height/(4*2.5))) opc = 2;
      rect(width/3.5,1.3*(height/2.5),1.5*(width/3.5),height/(4*2.5));
      fill(255,255,255);
      textFont(font);
      textSize(48);
      text("Ayuda", width/2, height/1.7);
      
      
      //Salir del juego
      if (hover(mouseX, mouseY, width/3.5, 1.6*(height/2.5), 1.5*(width/3.5), height/(4*2.5))) fill(158,150,175,250);
      else fill(158,150,175,150);
      if(clicked(mouseX, mouseY, width/3.5, 1.6*(height/2.5), 1.5*(width/3.5), height/(4*2.5))) opc = 3;
      rect(width/3.5,1.6*(height/2.5),1.5*(width/3.5),height/(4*2.5));
      fill(255,255,255);
      textFont(font);
      textSize(48);
      text("Salir", width/2, height/1.4);
    }
    if(opc == 1) juego(p);
    if(opc == 2) ayuda();
    if(opc == 3) exit();
    if(opc == 4) gameOver();
    
  } 
  
  void ayuda(){
    fill(158,150,175,250);
    rect(width/10, height/10, 8*(width/10), 8*(height/10));
    if (hover(mouseX, mouseY, 3*(width/10), 7.5*(height/10), 4*(width/10),  1*(height/10))) fill(255,150,175,150);
    else fill(188,150,175,250);
    rect(3*(width/10), 7.5*(height/10), 4*(width/10), 1*(height/10));
    fill(255,255,255);
    textFont(font);
    textSize(48);
    textAlign(CENTER);
    text("Cómo jugar", width/2, height/5);
    textAlign(CENTER);
    textSize(20);
    textAlign(LEFT);
    text(
    "- En este juego te convertirás en un sultán que deberá defenderse ante las oleadas de agresivos títeres que buscan infiltrar tu fortaleza\n\n"+
    "- Usa el dinero para construir torretas y defenderte de los enemigos\n\n"+
    "- Elimina a los enemigos antes que éstos lleguen al final del camino\n\n"+
    "- Obtén dinero por eliminar a los enemigos\n\n\n"+
    "- CONTROLES: Selecciona una torreta con el mouse y colócala en los recuadros libres\n\n", width/5, height/4, 3*(width/5), 5*(width/5));
    textSize(40);
    textAlign(CENTER);
    text("Cerrar", width/2, 8.2*(height/10));
    
    if(clicked(mouseX, mouseY, 3*(width/10), 7.5*(height/10), 4*(width/10), 1*(height/10))){
      opc = -1;
    } 
  }
  
  void gameOver() {
    bgGameOver = loadImage("gameOver.jpg");
    bgGameOver.resize(width,height);
    image(bgGameOver,0,0);
    gameOver = loadImage("gameOverTitle.png");
    gameOver.resize(400,315);
    image(gameOver, width/3.2, height/8);
    
    
    if (hover(mouseX, mouseY, 3*(width/10), 7.5*(height/10), 4*(width/10),  1*(height/10))) fill(255,0,0,250);
    else fill(255,0,0,150);
    rect(3*(width/10), 7.5*(height/10), 4*(width/10), 1*(height/10));
    
    textSize(40);
    textAlign(CENTER);
    fill(255,255,255);
    text("Salir del juego", width/2, 8.2*(height/10));
    
    if(clicked(mouseX, mouseY, 3*(width/10), 7.5*(height/10), 4*(width/10), 1*(height/10))){
      exit();
    }
  }
  
  void juego(PApplet p){
    background(100,100,100);
    tint(255, 255); //para que se vea normal, cambiar esta linea por: tint(255, 255);
    image(bg,0,0); //para que este centrado: image(bg, (width/2)-(anchoBG/2),0);
    tint(255, 255);
    
    fill(0);
    stroke(0);
    id = tienda.dibujar(p);
    tablero.mapa(p,id);
    //cuadricula();
    
    spawnEnemigos();
    
    if(salud <=0) {
      opc = 4;
    }
  }
  void victoria(PApplet p){
    image(bgInicio, 0, 0);
    
    //Titulo
    fill(158,150,175,200);
    rect(width/6, height/6, 4*(width/6), height/(1.5*6));
    fill(255,255,255);
    stroke(255,231,135);
    textFont(font);
    textSize(70);
    textAlign(CENTER);
    text("Victoria", width/2, height/4);
    
    textSize(40);
    textAlign(CENTER);
    fill(255,255,255);
    text("Salir del juego", width/2, 8.2*(height/10));
    
    if(clicked(mouseX, mouseY, 3*(width/10), 7.5*(height/10), 4*(width/10), 1*(height/10))){
      exit();
    }
  }
  
  boolean hover(float mouseX, float mouseY, float x,float y,float w, float h){
      return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h;
  }
  boolean clicked(float mouseX, float mouseY, float x,float y,float w, float h){
      return mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h && mousePressed == true;
  }
}
