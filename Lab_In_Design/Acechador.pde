
  PImage acechador;
    PImage merodeador;
    
    int probabilidadAcechadorMenor,probabilidadAcechadorMayor;
    float tiempoAcechadorMenor,tiempoAcechadorMayor;
    int oportunidadAcechador;
    int TiempoA;
    
class acechador {
  

  int posAct = 0;
  int x, y, wd, ht;
  boolean camActive;
  float moveTime = 0;
  float tiempoAvance;
  int probAvance;
  float finality;
  int ex=width,ey=height,et=50;
  
  void generar() {

    if (camara == 10) {
      image(acechador, x, y, wd, ht);
    }
  }

  void posicion() {

    switch (posAct) {
      case 0:
        x = width/2-120;
        y = width/4-75;
        wd = 100;
        ht = 100;
        break;
      case 1:
        x = 370;
        y = 550;
        wd = 170;
        ht = 170;
        break;
      case 2:
        x = width / 2;
        y = height / 2;
        wd = 400;
        ht = 400;
        break;
       case 3:
        x = width / 4;
        y = height/4;
        wd = 800;
        ht = 800;
        break;
    }

  }

  void avanzar() {
    if (camActive) {
      tiempoAvance = tiempoAcechadorMenor;
      probAvance = probabilidadAcechadorMenor;
    } else {
      tiempoAvance = tiempoAcechadorMayor;
      probAvance = probabilidadAcechadorMayor;
    }

    moveTime += tiempoAvance;

    if (moveTime >= TiempoA) {
      int momentum = int(random(100)); 
        println("Su momento es  "+momentum);
      if ((momentum < probAvance) && (posAct < 4)) {
        posAct++;
        //println("Avanza NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      } else {
       // println("Permanece JAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJA");
      }
      
      moveTime = 0; 
    }
    if(camarasCerradas || camara!=10){ A.camActive=false;}
    
    println("Tiempo= " + moveTime);
    println("Posición= " + posAct);
    println("Probabilidad= " + probAvance);
    println("Cámara Activa= " + camActive);
  }
  void scare(){
   if(posAct==3){
    finality+=0.1;
    } else { 
    finality=0;
    }
    //println("Jumpscare se acerca  "+finality);
    if(finality>=oportunidadAcechador){
      JS.acechadorJumpscare=true;
      JS.acechadorJS();
    }
    
    
  }
   void iluminar(){
     if(posAct==3){
      fill(220,200,0);
      square(ex,ey,et);
      }
    }
  
} // Fin de la clase



acechador A = new acechador();
