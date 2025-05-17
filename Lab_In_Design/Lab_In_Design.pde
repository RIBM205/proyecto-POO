import processing.sound.*;

PImage cam0,cam1,cam2,bosque;             //Se declaran las diferentes variables para las imagenes de las camaras
PImage eSot,eOfi,eLab;     
int camara,hidden=-1; 
boolean camarasCerradas=true; //Usado para saber si las camaras estan activas o no.

SoundFile pasos,mainMenu;
boolean pasosS=false;

void setup(){
  windowTitle("Lab In Design");
  size(1200,800);
  
  for(int i=0;i<n;i++){
    C[i]=new Cables();
    }
    
  ventilaciones[0] = new ventilacion(width/4, height/2, 100, 50); // Recepción
  ventilaciones[1] = new ventilacion(width/4, height/2, 100, 50); // Lab3
  ventilaciones[2] = new ventilacion(width/4, height/2, 100, 50); // Baño
  ventilaciones[3] = new ventilacion(width/4, height/2, 100, 50); // Sótano

  GM.llamar();
  
  //Sonidos//
  pasos = new SoundFile(this,"Audio/pasos.mp3");
  mainMenu= new SoundFile(this,"Audio/AñosAtras.mp3");
}

void draw(){
background(0,0);
GM.configuracion();

    //println(noches.nocheActual);
   //println(S.espera);
   //println(noches.tiempoJugado);
    //println(pausa);
    //println(tiempoPanel);
  //  println(empiezaTiempo);
// println(estres);
  //println(noches.tiempoJugado/10000);
    //println("Tiempo Real"+noches.tiempoJugado);
   
    if (empiezaTiempo) {
                  tiempoPanel++;
                   LabStory.tiempoEncuesta();  
            }
       
         if(LabStory.noElegido){
               LabStory.opcionNo();
               return;}
               
                 if(LabStory.siElegido){
               LabStory.opcionSi();
               return;}
               
         
              
              
 

 
  noches.enPausa(); 
  
  
  if(ActiveMenu){
    if(!mainMenu.isPlaying()){
        mainMenu.loop();
      } 
    } else {
       if (mainMenu.isPlaying())
          mainMenu.stop();
    }
  



  if(enPartida==true){
    noches.configuracionNoches();
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
   LabStory.opcionesEncuesta();
   noches.reloj();
  
   numeracion();
     mostrar();
    
    
    if(noches.enTransicion){
      noches.transicionInicial();
    return;
    }
    
    if (noches.entransicionFinal) {
        noches.transicionFinal();
        return;
      }
     
  
    
          
      if (EST.ventilacionCerrada() && estres <= 100) {
        EST.aumentar();  
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
  int tiempoJumpscare;
 void slimeJS(){
 if(slimeJumpscare==true){
   fill(0);
   rect(0,0,width,height);
     image(slime,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
   }
 }
  void acechadorJS(){
  if (acechadorJumpscare==true){
       fill(0);
   rect(0,0,width,height);
     image(acechador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
  
    }
 }
  
  void merodeadorJS(){
  if(merodeadorJumpscare==true){
       fill(0);
   rect(0,0,width,height);
     image(merodeador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
        
    }
  }
}

Jumpscare JS=new Jumpscare();
