class Enemy {
  int dificultad;
  int nodoActual;
  int nodoAnterior;
  int posMerodeador;
  boolean mostrarMerodeador;
  int movimiento = 0;
  int intervalo = 120;
  
  //Para la logica de persecucion
  boolean enPersecucion;
  int delay;
  int tiempoEspera;
  int tiempoSeguir=120;
  boolean jugadorHuyo;
  int finality;
  boolean teletransportado;
  


  Enemy(int difi, int inicio) {
    dificultad = difi;
    nodoActual = inicio;
    nodoAnterior = inicio;
  }


    int[][] adyacentes = {
      {1},                    // 0
      {0, 2, 3},              // 1
      {1, 10, 11, 12, 13, 14, 15}, // 2
      {1, 4, 5},              // 3
      {3, 6},                 // 4
      {3, 9},                 // 5
      {4, 7, 8},              // 6
      {6},                   // 7
      {6},                   // 8
      {5},                   // 9
      {2},                   // 10
      {2},                   // 11
      {2},                   // 12
      {2},                   // 13
      {2},                   // 14
      {2}                    // 15
    };

  
  int getNodo() {
    return nodoActual;
  }

 
  void update() {
    if(!enPartida || !mostrarMerodeador) return;
    
    movimiento++;
  if (movimiento >= intervalo) {
    movimiento = 0;
    
    
    int number = int(random(0, 20));

    if (number < dificultad) {
    
      int[] vecinos = adyacentes[nodoActual];
      int elegido = int(random(vecinos.length));
      nodoAnterior = nodoActual;
      nodoActual = vecinos[elegido];
    } else if (number > dificultad) {

      if (nodoAnterior != nodoActual) {
        int temp = nodoActual;
        nodoActual = nodoAnterior;
        nodoAnterior = temp;
        
      }
    }
   } 
  }
  void generar(){
 
  if(nodoActual==escenario && mostrarMerodeador){
     image(merodeador,width/2,height/2);
    }
  }
  
  void mostrar() {
    int[] vecinos = adyacentes[nodoActual];
  
    if (vecinos != null && vecinos.length > 0) {
      boolean puedeMoverse = false;
  
      for (int v : vecinos) {
        if (v != nodoAnterior) {
          puedeMoverse = true;
          break;
        }
      }
  
      if (puedeMoverse) {
        mostrarMerodeador = true;
      }
    }
  }
  
  
  void caceria(){
    //println(nodoAnterior);
    
    if(nodoActual==escenario){
    enPersecucion=true;
    jugadorHuyo=false;
    tiempoEspera=0;
    finality++;
    
 
    
    if(finality>=tiempoSeguir){
    if(hidden==-1){
      configJumpscare();
     } 
    }
   } else if(enPersecucion&&jugadorHuyo){
     delay++;
     finality=0;
     
     if(delay>tiempoSeguir){
     nodoActual=escenario;
     delay=0;
     
     if(hidden==-1){
      configJumpscare();
     } else if(hidden!=-1){
       enPersecucion=false;
       jugadorHuyo=false;
       finality=0;
       delay=0;
       nodoActual=12;
     }
   }
   } 
      if(enPersecucion&&nodoActual!=escenario){
      jugadorHuyo=true;
    }
   
     if(jugadorHuyo&&!persecucion.isPlaying()){
       persecucion.play();
     } else {
     if(!jugadorHuyo){
       if(persecucion.isPlaying()){
       persecucion.stop();
       }
     }
  }
  }
  
  void configJumpscare(){
     JS.merodeadorJS();
    JS.merodeadorJumpscare=true;
    JS.enJumpscare = true;
    JS.acechadorJumpscare = false;
    JS.slimeJumpscare = false;
    jugadorHuyo=false;
    enPersecucion=false;
    finality=0;
    delay=0;
    nodoActual=12;
  }
 } 


Enemy M= new Enemy(10,12);
