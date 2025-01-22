static class Tienda{

  int elementos = 5;
  int btnTamano = 100;
  int iconoTamano = 65;
  int espacio = 15;
  int espacioInterior = 10;
  public static int xCeldas;
  public static int yCeldas;
  public static int xIconos;
  public static int yIconos;
  int btnID[] = {0,1,2,3};
  int seleccionadoID = 4;
  PImage celda;
  PImage celdaSeleccionada;
  PImage saludIcono;
  PImage dineroIcono;
  PImage canonIcono;
  PImage pinchosIcono;
  PImage morteroIcono;
  PImage glaciarIcono;
  PImage basura;
  boolean seleccionado = false;
  
  
  Tienda(PApplet p){
    xCeldas = ((p.width/2) - ((elementos*btnTamano)/2));
    yCeldas = (altoBG+(((p.height-altoBG)/2)-btnTamano/2));
    xIconos = ((p.width/2) - (anchoBG/2) + espacio*2);
    yIconos = (altoBG+(((p.height-altoBG)/3)-iconoTamano/2));
    
    celda = p.loadImage("celdaDefault.png");
    celda.resize(btnTamano,btnTamano);
    
    celdaSeleccionada = p.loadImage("celdaSeleccionada.png");
    celdaSeleccionada.resize(btnTamano,btnTamano);
    
    saludIcono = p.loadImage("salud.png");
    saludIcono.resize(btnTamano/2, btnTamano/2);    
    
    dineroIcono = p.loadImage("dinero.png");
    dineroIcono.resize(btnTamano/2, btnTamano/2);
    
    canonIcono = p.loadImage("canonIcono.png");
    canonIcono.resize(iconoTamano, iconoTamano);
    
    pinchosIcono = p.loadImage("pinchosIcono.png");
    pinchosIcono.resize(iconoTamano, iconoTamano);
    
    morteroIcono = p.loadImage("morteroIcono.png");
    morteroIcono.resize(iconoTamano, iconoTamano);
    
    glaciarIcono = p.loadImage("glaciarIcono.png");
    glaciarIcono.resize(iconoTamano, iconoTamano);
    
    basura = p.loadImage("basura.png");
    basura.resize(iconoTamano, iconoTamano);
  }
  
  int dibujar(PApplet p){
    for (int i=0; i<elementos; i++){
      p.image(celda, xCeldas + (i*btnTamano) + (i*espacio), yCeldas);
      if(p.mouseX >= xCeldas + (i*btnTamano) + (i*espacio) && p.mouseX < (xCeldas + (i*btnTamano) + (i*espacio))+btnTamano && p.mouseY >= yCeldas && p.mouseY < yCeldas+btnTamano)
        p.image(celdaSeleccionada, xCeldas + (i*btnTamano) + (i*espacio), yCeldas);
      if(i == 0)
        p.image(canonIcono, xCeldas + (i*btnTamano) + (i*espacio) + ((btnTamano-iconoTamano)/2), yCeldas + ((btnTamano-iconoTamano)/2));
      if(i == 1)
        p.image(pinchosIcono, xCeldas + (i*btnTamano) + (i*espacio) + ((btnTamano-iconoTamano)/2), yCeldas + ((btnTamano-iconoTamano)/2));
      if(i == 2)
        p.image(morteroIcono, xCeldas + (i*btnTamano) + (i*espacio) + ((btnTamano-iconoTamano)/2), yCeldas + ((btnTamano-iconoTamano)/2));
      if(i == 3)
        p.image(glaciarIcono, xCeldas + (i*btnTamano) + (i*espacio) + ((btnTamano-iconoTamano)/2), yCeldas + ((btnTamano-iconoTamano)/2));
      if(i == 4)
        p.image(basura, xCeldas + (i*btnTamano) + (i*espacio) + ((btnTamano-iconoTamano)/2), yCeldas + ((btnTamano-iconoTamano)/2));
      
      if(p.mouseX >= xCeldas + (i*btnTamano) + (i*espacio) && p.mouseX < (xCeldas + (i*btnTamano) + (i*espacio))+btnTamano && p.mouseY >= yCeldas && p.mouseY < yCeldas+btnTamano && p.mousePressed){
        seleccionado = true;
        seleccionadoID = i;
      }
      
    }
    //Salud y dinero
    p.image(saludIcono,xIconos,yIconos);
    p.image(dineroIcono,xIconos,yIconos+iconoTamano+espacio);   
    p.fill(255,255,255);
    p.textFont(p.createFont("Arial Bold", 40)); // Fuente Courier New
    p.text(salud,xIconos+iconoTamano+espacio, yIconos+(iconoTamano/2)+10);
    p.text(dinero,xIconos+iconoTamano+espacio, yIconos+(iconoTamano*2)-10);
    
    if(seleccionadoID != 4)
      return seleccionadoID;
    return 4; //Id de la basura, que no hace nada
  }
}
