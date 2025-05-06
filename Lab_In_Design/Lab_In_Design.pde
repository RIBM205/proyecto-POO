import processing.sound.*;

PImage cam0,cam1,cam2,bosque;             //Se declaran las diferentes variables para las imagenes de las camaras
PImage eSot,eOfi,eLab;     
int camara,hidden=-1; 
boolean camarasCerradas=true; //Usado para saber si las camaras estan activas o no.
SoundFile pasos;
boolean pasosS=false;

void setup(){
  windowTitle("Lab In Design");
  size(1200,800);
  
  for(int i=0;i<n;i++){
    C[i]=new Cables();
    }

  GM.llamar();
  
  //Sonidos//
  pasos = new SoundFile(this,"Audio/pasos.mp3");
}

void draw(){
background(0,0);
GM.configuracion();
 //println(S.espera);
 //println(noches.tiempoJugado);
 
  noches.enPausa(); 
  println(estres);


  if(enPartida==true){
    A.avanzar();
    escenarios();
    A.scare();
    sonidos();
    S.generar();
    PL.bajar();
    noches.tiempoNoche();
    M.update();
    M.getNodo();
    M.generar();
    M.caceria();
    cafe.llenar();
    EST.dificultad();
    
    if(cerrado&&estres<=100){
     EST.aumentar();
   }

 if(camarasCerradas==false){
   if(!camarasDesconectadas){
  image(cam1,0,0,width,height); // Se abre a camara 1
  
  if(camara==2)
  image(cam2,0,0,width,height); //Camara 2
  
  if(camara==3){ 
  image(bosque,0,0,width,height); 
  A.camActive=true;
  A.generar();
  A.posicion();//Camara 3
  I.dibujar();
  }
  else{
  A.camActive=false;}
  } else {
    println("Camaras Desconectadas");
    }
  }
 } 
 
 
    
      
       
}
int Tpasos;

void sonidos(){
  if(pasosS==true){
    Tpasos++;
  if(!pasos.isPlaying()){ 
      pasos.cue(1);
      pasos.play();
         }   
  }
  if(pasosS==false&&pasos.isPlaying()){
    pasos.pause();
    Tpasos=0;
  }
   if(Tpasos>=30){
   pasosS=false;
   }
}


class Jumpscare{
  boolean slimeJumpscare, acechadorJumpscare,merodeadorJumpscare;
  int x,y;
 void slimeJS(){
 /*if(slimeJumpscare==true){
     image(slime,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
   }*/
 }
  void acechadorJS(){
  /*if (acechadorJumpscare==true){
     image(acechador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
  
    }*/
 }
  
  void merodeadorJS(){
  /*if(merodeadorJumpscare==true){
     image(merodeador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
  
    }*/
  }
}

Jumpscare JS=new Jumpscare();
