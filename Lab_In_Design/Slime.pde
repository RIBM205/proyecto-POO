PImage slime;
int difSlime=10,probAparecer=90,velocidadAvance=10;  //Estos valores son para prueba, se modificaran a la hora de añadir dificultad
int tiempoEspera=20;  //Estos valores son para prueba, se modificaran a la hora de añadir dificultad

class slime{
    int ventilacionActual; //0=Recepcion  1=LaboratorioTres 2= Baño      3=Sotano
    int posSlime=-1;
    float tiempoMov;
     boolean enVentilacion=false;
     boolean aparicion=false;
     
     int avance=0;
      int SX,SY,SW,SH;
      float tiempoAvance;
      
  void mostrar(){
  if(ventilaciones[ventilacionActual].conductosActivos == 1){
    image(slime,SX,SY,SW,SH);
    }
    
      
      switch(avance){
      case 0: {
      SX=width/3+50;
      SY=height/3+50;
      SW=width/4;
      SH=height/4;}
      break;
      case 1: {
      SX=width/3;
      SY=height/3+50;
      SW=width/3;
      SH=height/3;}
      break;
      case 2: {
      SX=width/4+50;
      SY=height/3+50;
      SW=width/2;
      SH=height/2;}
      break;
      }

    
    
   
  } //Fin de la funcion mostrar
  
  void generar(){
      tiempoMov+=0.1;
  if(tiempoMov>=difSlime&&!enVentilacion){
  
    int momentum=int(random(100));
    //println(momentum);
    if(momentum<probAparecer){
    enVentilacion=true;
    aparicion=false;
    }
    tiempoMov=0;
  }
  
  if(enVentilacion==true&&aparicion==false){
    posSlime=int(random(4));
    aparicion=true;
      if(!pasosMetal.isPlaying()){
      pasosMetal.play();
      }
    }  
    if(aparicion==true){
      tiempoMov=0;
      tiempoAvance+=0.1;
      
      if (tiempoAvance > velocidadAvance * 2) {
        avance = 2;
      } else if (tiempoAvance > velocidadAvance) {
        avance = 1;
      } else {
        avance = 0;
      }
      }
  
 /* println("Tiempo de Movimiento "+tiempoMov);
  println("Esta en ventilacion "+posSlime);
  println("Esta en las ventilaciones? "+enVentilacion);*/
  
  
      if(posSlime==ventilacionActual){
      mostrar();
      }
      if(enVentilacion==true&&aparicion==true){
      bloquear();
      }
  }//Fin de la funcion generar
  int espera;
  
  void bloquear(){
  if(avance==2){
       espera++;
       println("SE VIENE  "+espera);
     if(espera>=tiempoEspera){    
        if(ventilaciones[ventilacionActual].cerrado){
        aparicion=false;
        enVentilacion=false;
        tiempoAvance=0;
        espera=0;
        posSlime=-1;
        avance=0;
        println("BLOQUEADO");
        } else {        
        JS.slimeJS();
        JS.slimeJumpscare=true;
        posSlime=-1;
        espera=0;
        JS.enJumpscare = true;
        JS.acechadorJumpscare = false;
      JS.merodeadorJumpscare = false;
        }
      }
  
    } else {
    espera=0;
    }
 
  
  } //Fin de la funcion Bloquear
} //Fin de la Clase


slime S=new slime();
