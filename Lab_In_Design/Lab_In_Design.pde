import processing.sound.*;

PImage cam0,cam1,cam2,bosque;             //Se declaran las diferentes variables para las imagenes de las camaras
PImage eSot,eOfi,eLab;     
int camara,hidden=-1; 
boolean camarasCerradas=true; //Usado para saber si las camaras estan activas o no.

SoundFile pasos,mainMenu,pasosMetal,Jumpscare;
SoundFile respiracion,ambientacion,papel, clickPalanca,silencio;
SoundFile Reloj,persecucion,gas,lucesD;

boolean pasosS=false;

void setup(){
  windowTitle("Lab In Design");
  size(1200,800);
  
   
    
  ventilaciones[0] = new ventilacion(width/4, height/2, 150, 150); // Recepción
  ventilaciones[1] = new ventilacion(width/4, height/2, 150, 150); // Lab3
  ventilaciones[2] = new ventilacion(width/4, height/2, 150, 150); // Baño
  ventilaciones[3] = new ventilacion(width/4, height/2, 150, 150); // Sótano

  GM.llamar();
  
  //Sonidos//
  pasos = new SoundFile(this,"Audio/pasos.mp3");
  mainMenu= new SoundFile(this,"Audio/AñosAtras.mp3");
  ambientacion = new SoundFile(this,"Audio/ambientacion.mp3");
  respiracion = new SoundFile(this,"Audio/respiracion.mp3");
  papel= new SoundFile(this,"Audio/papel.mp3");
  pasosMetal= new SoundFile(this,"Audio/metalPasos.mp3");
  clickPalanca= new SoundFile(this,"Audio/reinicioP.mp3");
  silencio= new SoundFile(this,"Audio/Silencio.mp3");
  Jumpscare = new SoundFile(this,"Audio/Jumpscare.mp3");
  Reloj = new SoundFile(this,"Audio/Reloj.mp3");
  persecucion= new SoundFile(this,"Audio/Persecucion.mp3");
  lucesD= new SoundFile(this,"Audio/Fallo.mp3");
  gas= new SoundFile(this,"Audio/Gas.mp3");
}

void draw(){
background(0,0);
GM.configuracion();

    //println(noches.nocheActual);
   //println(S.espera);
  // println(noches.tiempoJugado);
    //println(pausa);
    //println(tiempoPanel);
  //  println(empiezaTiempo);
// println(estres);
  //println(noches.tiempoJugado/10000);
    //println("Tiempo Real"+noches.tiempoJugado);
   //println("enPanel:  "+ cable.enPanel);
    //println(camara);
  
 if(enCreditos){
    MM.creditos();
  }
   
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
               
               
             if(JS.enJumpscare){
              if (JS.acechadorJumpscare) JS.acechadorJS();
              if (JS.slimeJumpscare) JS.slimeJS();
              if (JS.merodeadorJumpscare) JS.merodeadorJS();
              
              JS.duracionJumpscare();  
              return; 
            }
             

     
         

  noches.enPausa(); 
  
  if(enPartida){
    if(!ambientacion.isPlaying()){
      ambientacion.loop();
    }
  } else {
    if(ambientacion.isPlaying()){
    ambientacion.stop();
    }
  }
  
  
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
    M.caceria();
    M.mostrar();
    M.generar();

  
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
  boolean enJumpscare;
 void slimeJS(){
 if(slimeJumpscare==true){
   enJumpscare=true; 
   fill(0);
   rect(0,0,width,height);
     image(slime,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
       if(!Jumpscare.isPlaying()){
         Jumpscare.play();
       }
   }
 }
  void acechadorJS(){
  if (acechadorJumpscare==true){
      enJumpscare=true; 
      fill(0);
   rect(0,0,width,height);
     image(acechador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
      if(!Jumpscare.isPlaying()){
         Jumpscare.play();
       }
    }
 }
  
  void merodeadorJS(){
  if(merodeadorJumpscare==true){
    enJumpscare=true; 
       fill(0);
   rect(0,0,width,height);
     image(merodeador,x,y,width,height);
       x=int(random(-50,50));
       y=int(random(-50,50));
    if(!Jumpscare.isPlaying()){
         Jumpscare.play();
       }
    }
  }
  
  void duracionJumpscare(){
               if(enJumpscare){
       tiempoJumpscare++;
       
       if(tiempoJumpscare>=60){
         enJumpscare=false;
         merodeadorJumpscare=false;
         acechadorJumpscare=false;
         slimeJumpscare=false;
         noches.derrota=true;
         GM.reset();
         ActiveMenu=true;
         tiempoJumpscare=0;
       }
    
      }
  
  }
}

Jumpscare JS=new Jumpscare();
