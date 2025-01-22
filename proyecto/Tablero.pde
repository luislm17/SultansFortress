class Tablero {
  public int bloqueTam = 50;
  int tableroH = 13;//altoBG/bloqueTam;
  int tableroW = 21;//width/bloqueTam;
  boolean seleccionCuatroBloques;
  boolean seleccionGlaciar;
  boolean seleccionMortero;
  boolean izquierda;
  boolean arriba;
  boolean disponible;
  boolean ponerTorre;
  
  Tablero() {
    definir();
    cargarDatos();
    dibujar();
  }
  
  void definir(){
    bloque = new Bloque[tableroH][tableroW];
    for(int y = 0; y<bloque.length; y++){
      for(int x = 0; x<bloque[0].length; x++){
        bloque[y][x] = new Bloque(x * bloqueTam, y * bloqueTam, bloqueTam, bloqueTam);
      }
    }
  }
  
  void dibujar(){
    for(int y = 0; y<bloque.length; y++){
      for(int x = 0; x<bloque[0].length; x++){
        bloque[y][x].dibujar();
      }
    }
  }
  
  void mapa(PApplet p, int idSeleccion){
    for(int i = 0; i<bloque.length; i++){
      for(int j = 0; j<bloque[0].length; j++){
        if(!bloque[i][j].hover(mouseX, mouseY)){
        } else { //Si el mouse esta sobre el campo de batalla
            if(idSeleccion == 0 || idSeleccion == 1){
              seleccionCuatroEspacios(i,j,idSeleccion, tableroW, bloqueTam, p);
            }
            if(idSeleccion == 2){
              seleccionMortero(i,j,tableroW,bloqueTam,p);
            }
            if(idSeleccion == 3){
              seleccionGlaciar(i,j,tableroW,bloqueTam,p);
            }
          }
    }
  } 
 }
}
  
