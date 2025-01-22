void cargarDatos(){ //archivo txt 
  try{
    String lineas[] = loadStrings("mapa.txt");
    int rows = lineas.length;
    int cols = int(split(lineas[0]," ")).length;
    
    int mapa[][] = new int[rows][cols]; 
    
    //println("hay "+ rows + " lineas y "+ cols +" columnas en el documento mapa.txt");
    for(int y = 0; y < rows; y++) {
      int map[] = int(split(lineas[y]," "));
      for(int x = 0; x < map.length; x++) {
        //bloque[y][x].groundId = map[x];
        mapa[y][x] = map[x];
        bloque[y][x].value = mapa[y][x];
        //print(mapa[y][x]);
      }
      //print("\n");
    }
  } catch (Exception e) {
    print("no se pudo cargar el archivo txt del mapa: ");
    e.printStackTrace();
  }
  
}
