 void seleccionCuatroEspacios(int i, int j, int ID, int tableroW, int bloqueTam, PApplet p){
    int filaSuperior;
    int bloqueDerecho;
    int precio;
    boolean verticalDisponible;
    boolean horizDisponible;
    
    if(ID == 0)
      precio = 40;
    else
      precio = 50;
    if(i == 0){
      filaSuperior = i;
      verticalDisponible = false;  
    }
    else{
      filaSuperior = i - 1;
      verticalDisponible = true;  
    }
    if(j == tableroW - 1){
      bloqueDerecho = tableroW - 1;
      horizDisponible = false;  
    }
    else{
      bloqueDerecho = j + 1;
      horizDisponible = true;  
    }
    if(ID == 0){
      p.fill(0, 0);
      p.image(Imagenes.Canon, (bloque[filaSuperior][j].x + bloqueTam) - (Imagenes.tamCanon/2), (bloque[i][bloqueDerecho].y) - (Imagenes.tamCanon/2));
      p.circle(bloque[filaSuperior][j].x + (Imagenes.tamCanon/2), bloque[filaSuperior][j].y + (Imagenes.tamCanon/2), 300); //se dibuja desde el centro del circulo
    }
    if(ID == 1)
      p.image(Imagenes.Pinchos, (bloque[filaSuperior][j].x + bloqueTam) - (Imagenes.tamPinchos/2), (bloque[i][bloqueDerecho].y) - (Imagenes.tamPinchos/2));
    
    
    if(bloque[i][j].value == Valores.free && bloque[i][bloqueDerecho].value == Valores.free && bloque[filaSuperior][j].value == Valores.free && bloque[filaSuperior][bloqueDerecho].value == Valores.free &&
      verticalDisponible == true && horizDisponible == true){
        fill(0,255,0,25);
        rect(bloque[filaSuperior][j].x, bloque[filaSuperior][j].y, bloque[i][j].w*2, bloque[i][j].h*2);
        if(mousePressed && !procesado && dinero >= precio){
          if(ID == 0){
            bloque[i][j].value = Valores.canon; //Se establece la coordenada i,j como ocupada por el cañon o pinchos
            torresCanones.add(new Canon((bloque[i][j].x + bloqueTam) - (Imagenes.tamCanon/2), bloque[i][j].y - (Imagenes.tamCanon/2), p));
          }
          if(ID == 1){
            bloque[i][j].value = Valores.pinchos; //Se establece la coordenada i,j como ocupada por el cañon
            torresPinchos.add(new Pinchos((bloque[i][j].x + bloqueTam) - (Imagenes.tamPinchos/2), bloque[i][j].y - (Imagenes.tamPinchos/2), p));  
          }
            
          dinero -= precio; //Se resta el valor de la torre al dinero
          bloque[i][bloqueDerecho].value =Valores.occup;//Se establecen los demas cuadros como ocupados
          bloque[filaSuperior][j].value = Valores.occup;
          bloque[filaSuperior][bloqueDerecho].value = Valores.occup;
          procesado = true;
        }
    }
    else{
        fill(255,0,0,25);
        if(i == 0)
          rect(bloque[filaSuperior][j].x, bloque[filaSuperior][j].y, bloque[i][j].w*2, bloque[i][j].h);
        else
          rect(bloque[filaSuperior][j].x, bloque[filaSuperior][j].y, bloque[i][j].w*2, bloque[i][j].h*2);        
    }

  }
  
  void seleccionGlaciar(int i, int j, int tableroW, int bloqueTam, PApplet p){
    int filaSuperior1;
    int filaSuperior2;
    int bloqueDerecho1;
    int bloqueDerecho2;
    int bloqueDerecho3;
    int precio = 80;
    int limDerecho = tableroW - 1;
    boolean verticalDisponible;
    boolean horizDisponible;
    
    if(i == 0 || i == 1){
      filaSuperior1 = 0;
      filaSuperior2 = 0;
      verticalDisponible = false;
    }
    else{
      filaSuperior1 = i - 1;
      filaSuperior2 = i - 2;
      verticalDisponible = true;
    }
    if(j == limDerecho || j == limDerecho - 1){
      bloqueDerecho1 = limDerecho; 
      bloqueDerecho2 = limDerecho; 
      bloqueDerecho3 = limDerecho;
      horizDisponible = false;
    }
    else if(j == limDerecho - 2){
      bloqueDerecho1 = limDerecho - 1;
      bloqueDerecho2 = limDerecho;
      bloqueDerecho3 = limDerecho;
      horizDisponible = false;
    }
    else{
      bloqueDerecho1 = j + 1;
      bloqueDerecho2 = j + 2;
      bloqueDerecho3 = j + 3;  
      horizDisponible = true;
    }
    
    
    if(bloque[i][j].value == Valores.free && bloque[i][bloqueDerecho1].value == Valores.free && bloque[i][bloqueDerecho2].value == Valores.free && bloque[i][bloqueDerecho3].value == Valores.free &&
       bloque[filaSuperior1][j].value == Valores.free && bloque[filaSuperior1][bloqueDerecho1].value == Valores.free && bloque[filaSuperior1][bloqueDerecho2].value == Valores.free && bloque[filaSuperior1][bloqueDerecho3].value == Valores.free &&
       bloque[filaSuperior2][j].value == Valores.free && bloque[filaSuperior2][bloqueDerecho1].value == Valores.free && bloque[filaSuperior2][bloqueDerecho2].value == Valores.free && bloque[filaSuperior2][bloqueDerecho3].value == Valores.free &&
       verticalDisponible == true && horizDisponible == true){         
        fill(0,255,0,25);
        rect(bloque[filaSuperior2][j].x, bloque[filaSuperior2][j].y, bloque[i][j].w*4, bloque[i][j].h*3);
        if(mousePressed && !procesado && dinero >= precio){
          torresGlaciar.add(new Glaciar((bloque[i][j].x + (bloqueTam*2)) - (Imagenes.anchoGlaciar/2), (bloque[i][j].y - (bloqueTam/2)) - (Imagenes.altoGlaciar/2), p));
          
          bloque[i][j].value = Valores.glaciar; //Se establece la coordenada i,j como ocupada por el glaciar
          dinero -= precio; //Se resta el valor de la torre al dinero
          bloque[i][bloqueDerecho1].value = Valores.occup; //Se establece el resto de los cuadros de la linea como ocupados. Fila "cero"
          bloque[i][bloqueDerecho2].value = Valores.occup;
          bloque[i][bloqueDerecho3].value = Valores.occup;
          bloque[filaSuperior1][j].value =Valores.occup;//Se establecen los demas cuadros como ocupados. Fila superior 1
          bloque[filaSuperior1][bloqueDerecho1].value = Valores.occup;
          bloque[filaSuperior1][bloqueDerecho2].value = Valores.occup;
          bloque[filaSuperior1][bloqueDerecho3].value = Valores.occup;
          bloque[filaSuperior2][j].value =Valores.occup;//Se establecen los demas cuadros como ocupados. Fila superior 2
          bloque[filaSuperior2][bloqueDerecho1].value = Valores.occup;
          bloque[filaSuperior2][bloqueDerecho2].value = Valores.occup;
          bloque[filaSuperior2][bloqueDerecho3].value = Valores.occup;
          
          procesado = true;
        }
    }
    else{
        fill(255,0,0,25);
        if(i == 0)
          rect(bloque[filaSuperior2][j].x, bloque[filaSuperior2][j].y, bloque[i][j].w*4, bloque[i][j].h);
        else if(i == 1)
          rect(bloque[filaSuperior2][j].x, bloque[filaSuperior2][j].y, bloque[i][j].w*4, bloque[i][j].h*2);
        else
          rect(bloque[filaSuperior2][j].x, bloque[filaSuperior2][j].y, bloque[i][j].w*4, bloque[i][j].h*3);
    }
    
    p.image(Imagenes.Glaciar, (bloque[i][j].x + (bloqueTam*2)) - (Imagenes.anchoGlaciar/2), (bloque[i][j].y - (bloqueTam/2)) - (Imagenes.altoGlaciar/2));
    p.tint(255, 80);
    p.image(Imagenes.Area, (bloque[i][j].x + (bloqueTam*2)) - (Imagenes.anchoGlaciar/2) - (Imagenes.anchoGlaciar), (bloque[i][j].y - (bloqueTam/2)) - (Imagenes.altoGlaciar/2) - (Imagenes.altoGlaciar));
    p.tint(255, 255);    
     
  }
  
  void seleccionMortero(int i, int j, int tableroW, int bloqueTam, PApplet p){
    int filaSuperior1;
    int filaSuperior2;
    int filaSuperior3;
    int bloqueDerecho1;
    int bloqueDerecho2;
    int bloqueDerecho3;
    int limDerecho = tableroW - 1;
    int precio = 100;
    boolean verticalDisponible;
    boolean horizDisponible;
    
    if(i == 0 || i == 1){
      filaSuperior1 = 0;
      filaSuperior2 = 0;
      filaSuperior3 = 0;
      verticalDisponible = false;
    }
    else if(i == 2){
      filaSuperior1 = i - 1;
      filaSuperior2 = i - 1;
      filaSuperior3 = i - 2;
      verticalDisponible = false;
    }
    else{
      filaSuperior1 = i - 1;
      filaSuperior2 = i - 2;
      filaSuperior3 = i - 3;
      verticalDisponible = true;
    }
    if(j == limDerecho || j == limDerecho - 1){
      bloqueDerecho1 = limDerecho; 
      bloqueDerecho2 = limDerecho; 
      bloqueDerecho3 = limDerecho;
      horizDisponible = false;
    }
    else if(j == limDerecho - 2){
      bloqueDerecho1 = limDerecho - 1;
      bloqueDerecho2 = limDerecho;
      bloqueDerecho3 = limDerecho;
      horizDisponible = false;
    }
    else{
      bloqueDerecho1 = j + 1;
      bloqueDerecho2 = j + 2;
      bloqueDerecho3 = j + 3;  
      horizDisponible = true;
    }
  
  
  if(bloque[i][j].value == Valores.free && bloque[i][bloqueDerecho1].value == Valores.free && bloque[i][bloqueDerecho2].value == Valores.free && bloque[i][bloqueDerecho3].value == Valores.free &&
       bloque[filaSuperior1][j].value == Valores.free && bloque[filaSuperior1][bloqueDerecho1].value == Valores.free && bloque[filaSuperior1][bloqueDerecho2].value == Valores.free && bloque[filaSuperior1][bloqueDerecho3].value == Valores.free &&
       bloque[filaSuperior2][j].value == Valores.free && bloque[filaSuperior2][bloqueDerecho1].value == Valores.free && bloque[filaSuperior2][bloqueDerecho2].value == Valores.free && bloque[filaSuperior2][bloqueDerecho3].value == Valores.free &&
       bloque[filaSuperior3][j].value == Valores.free && bloque[filaSuperior3][bloqueDerecho1].value == Valores.free && bloque[filaSuperior3][bloqueDerecho2].value == Valores.free && bloque[filaSuperior3][bloqueDerecho3].value == Valores.free &&
       verticalDisponible == true && horizDisponible == true){         
        fill(0,255,0,25);
        rect(bloque[filaSuperior3][j].x, bloque[filaSuperior3][j].y, bloque[i][j].w*4, bloque[i][j].h*4);
        if(mousePressed && !procesado && dinero >= precio){
          torresMortero.add(new Mortero((bloque[i][j].x + (bloqueTam*2)) - (Imagenes.tamMortero/2), (bloque[i][j].y - bloqueTam) - (Imagenes.tamMortero/2), p));
          
          bloque[i][j].value = Valores.mortero; //Se establece la coordenada i,j como ocupada por el mortero
          dinero -= precio; //Se resta el valor de la torre al dinero
          bloque[i][bloqueDerecho1].value = Valores.occup;//Se establece el resto de los cuadros de la linea como ocupados. Fila "cero"
          bloque[i][bloqueDerecho2].value = Valores.occup;
          bloque[i][bloqueDerecho3].value = Valores.occup;
          bloque[filaSuperior1][j].value =Valores.occup;//Se establecen los demas cuadros como ocupados. Fila superior 1
          bloque[filaSuperior1][bloqueDerecho1].value = Valores.occup;
          bloque[filaSuperior1][bloqueDerecho2].value = Valores.occup;
          bloque[filaSuperior1][bloqueDerecho3].value = Valores.occup;
          bloque[filaSuperior2][j].value =Valores.occup;//Se establecen los demas cuadros como ocupados. Fila superior 2
          bloque[filaSuperior2][bloqueDerecho1].value = Valores.occup;
          bloque[filaSuperior2][bloqueDerecho2].value = Valores.occup;
          bloque[filaSuperior2][bloqueDerecho3].value = Valores.occup;
          bloque[filaSuperior3][j].value =Valores.occup;//Se establecen los demas cuadros como ocupados. Fila superior 3
          bloque[filaSuperior3][bloqueDerecho1].value = Valores.occup;
          bloque[filaSuperior3][bloqueDerecho2].value = Valores.occup;
          bloque[filaSuperior3][bloqueDerecho3].value = Valores.occup;
          
          procesado = true;
        }
    }
    else{
        fill(255,0,0,25);
        if(i == 0)
          rect(bloque[filaSuperior3][j].x, bloque[filaSuperior3][j].y, bloque[i][j].w*4, bloque[i][j].h);
        else if(i == 1)
          rect(bloque[filaSuperior3][j].x, bloque[filaSuperior3][j].y, bloque[i][j].w*4, bloque[i][j].h*2);
        else if(i == 2)
          rect(bloque[filaSuperior3][j].x, bloque[filaSuperior3][j].y, bloque[i][j].w*4, bloque[i][j].h*3);
        else
          rect(bloque[filaSuperior3][j].x, bloque[filaSuperior3][j].y, bloque[i][j].w*4, bloque[i][j].h*4);
    }
   
   p.image(Imagenes.Mortero, (bloque[i][j].x + (bloqueTam*2)) - (Imagenes.tamMortero/2), (bloque[i][j].y - bloqueTam) - (Imagenes.tamMortero/2));
   
  }
  
  void mouseReleased(){
    procesado = false;
  }
