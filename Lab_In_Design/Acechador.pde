class iluminar{
    int ex=width,ey=height,et=50;
      void dibujar(){
     if(A.posAct==3){
      fill(220,200,0);
      square(ex,ey,et);
      }
    }
}
  PImage acechador;
    PImage merodeador;
    
class acechador {
  

  int posAct = 0;
  int x, y, wd, ht;
  boolean camActive;
  float moveTime = 0;
  float tiempoAvance;
  int probAvance;
  float finality;
  
  void generar() {

    if (camara == 3) {
      image(acechador, x, y, wd, ht);
    }
  }

  void posicion() {

    switch (posAct) {
      case 0:
        x = 480;
        y = 565;
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
      tiempoAvance = 0.02;
      probAvance = 30;
    } else {
      tiempoAvance = 0.06;
      probAvance = 70;
    }

    moveTime += tiempoAvance;

    if (moveTime >= 5) {
      int momentum = int(random(100));

      if ((momentum < probAvance) && (posAct < 4)) {
        posAct++;
        //println("Avanza NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
      } else {
       // println("Permanece JAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJAJA");
      }
      
      moveTime = 0; 
    }
    if(camarasCerradas){ A.camActive=false;}
    
   /* println("Tiempo= " + moveTime);
    println("Posición= " + posAct);
    println("Probabilidad= " + probAvance);
    println("Cámara Activa= " + camActive);*/
  }
  void scare(){
   if(posAct==3){
    finality+=0.1;
    } else { 
    finality=0;
    }
    //println("Jumpscare se acerca  "+finality);
    if(finality>=4){
      JS.acechadorJumpscare=true;
      JS.acechadorJS();
    }
    
    
  }
  
} // Fin de la clase


iluminar I= new iluminar();
acechador A = new acechador();
