static class Imagenes{
  public static PImage Canon;
  public static PImage Pinchos;
  public static PImage Glaciar;
  public static PImage Area;
  public static PImage Mortero;
  
  public static int tamCanon = 80;
  public static int tamPinchos = 80;
  public static int anchoGlaciar = 180;
  public static int altoGlaciar = 130;
  public static int tamMortero = 180;
  
  Imagenes(PApplet p){
    Canon = p.loadImage("canon.png");
    Canon.resize(tamCanon, tamCanon);
    Glaciar = p.loadImage("Glaciar.png");
    Area = p.loadImage("areaGlaciar.png");
    Glaciar.resize(anchoGlaciar,altoGlaciar);
    Area.resize(anchoGlaciar*3,altoGlaciar*3);
    Mortero = p.loadImage("baseMortero.png");
    Mortero.resize(tamMortero,tamMortero);
    Pinchos = p.loadImage("torreta1.png");
    Pinchos.resize(tamPinchos, tamPinchos);
  }
}
