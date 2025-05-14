boolean enPartida,normalSetup;


class Noches{
  int tiempoNoche,tiempoJugado;
  int nocheActual=1;
  boolean enTransicion;
  int transicion; //0 - Inicio. 1- Final
  int tiempoTransicion;
   int tiempoTransicionFinal;
  int tiempoPausa;
  int inicioPausa;
  boolean pausado = false; 
  int aumento;
  boolean entransicionFinal;
  boolean nocheTerminada;
  
  void inicioNoche(){
    tiempoNoche=millis();
    tiempoJugado=0;
    tiempoPausa=0;
    enPartida=true;
  }
  
    void tiempoNoche(){
      if(enTransicion || entransicionFinal) return;
      
    if(enPartida==true&&!nocheTerminada){
    tiempoJugado= millis()-tiempoNoche-tiempoPausa;} 
     if (tiempoJugado >= 570000) { //La duracion total de la noche es de 9 minutos y medio
     //   println("FIN");
      enPartida = false;
      entransicionFinal = true;
      tiempoTransicion = 0;
      nocheTerminada=true;
     
    }   
  }

void enPausa() {
  if (pausa==true && pausado==false) {
    inicioPausa = millis();
    pausado = true;
  } 
  else if (pausa==false && pausado) {
    
    tiempoPausa += millis() - inicioPausa;
    pausado = false;
  }
  }
  void transicionInicial(){
  
    if(enTransicion){ 
    tiempoTransicion++;
     
   
    if(tiempoTransicion<=100){
      fill(0);
    rect(0,0,width,height);
    fill(255);
    switch(nocheActual){
    case 1:text("Noche uno",width/3,height/2);
    break;
    case 2:text("Noche Dos",width/3,height/2);
    break;
    case 3:text("Noche Tres",width/3,height/2);
    break;
    case 4: text("Noche cuatro",width/3,height/2);
    break;
    case 5: text("Noche Cinco",width/3,height/2);
    break;
    }
     fill(0);
      noStroke();
    rect(width/3+aumento,height/2.5,500,100);
    aumento+=7;
    } else if(tiempoTransicion>100){
      enTransicion=false;
      inicioNoche();
      tiempoTransicion=0;
      aumento=0;
    }
  
   }
  }
  
    void transicionFinal(){
  
    if(entransicionFinal){ 
    tiempoTransicionFinal++;
    
   
    if(tiempoTransicionFinal<=100){
      fill(0);
      rect(0,0,width,height);
      fill(255);
      text("Noche Terminada",width/3,height/2);
       fill(0);
      noStroke();
    rect(width/3.5+aumento,height/2.5,900,300);
    aumento+=10;
    } else if(tiempoTransicionFinal>100){
    
      entransicionFinal=false;
      activarEncuesta=false;
     puedeEncuesta=true;
     
        if(puedeEncuesta && !generado){
      LabStory.encuesta();
      puedeEncuesta=false;
      }
    }
   }
  }
  
  void transicion(){
    enTransicion=true;
    tiempoTransicion=0;
    aumento=0;
    enPartida=false;
    pausa=false;
  }
  
  void FinDeNoche(){
    nocheActual++;
    tiempoTransicionFinal = 0;
    aumento = 0;
    nocheTerminada = false;
    GM.reset();
    ActiveMenu = true;
    tiempoJugado = 0;
  generado=false;
  }
  
  void configuracionNoches(){
    switch(nocheActual){
    case 1:  { ////////////////////////////////////////////////////////////////////////////////NOCHE 1
    //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    TiempoA=5;
    //Dificultad del Merodeador DESACTIVADO EN NOCHE UNO
    M.dificultad=10;
    M.intervalo=120;
    
    //Dificultad del Slime
    difSlime=10;
    probAparecer=90;
    velocidadAvance=10;
    tiempoEspera=20;
    
    //Aumento de la barra de estres
    aumentoEstres=0.5;
    EST.tiempoMaximo=10;
      }
     break;
     
     case 2:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 2
         //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    //Dificultad del Merodeador
    M.dificultad=10;
    M.intervalo=120;
    
    //Dificultad del Slime
    difSlime=10;
    probAparecer=90;
    velocidadAvance=10;
    tiempoEspera=20;
    
    //Aumento de la barra de estres
    aumentoEstres=0.5;
     }
     break;
     
      case 3:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 3
         //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    //Dificultad del Merodeador
    M.dificultad=10;
    M.intervalo=120;
    
    //Dificultad del Slime
    difSlime=10;
    probAparecer=90;
    velocidadAvance=10;
    tiempoEspera=20;
    
    //Aumento de la barra de estres
    aumentoEstres=0.5;
     }
     break;
     
      case 4:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 4
         //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    //Dificultad del Merodeador
    M.dificultad=10;
    M.intervalo=120;
    
    //Dificultad del Slime
    difSlime=10;
    probAparecer=90;
    velocidadAvance=10;
    tiempoEspera=20;
    
    //Aumento de la barra de estres
    aumentoEstres=0.5;
     }
     break;
     
      case 5:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 5
         //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    //Dificultad del Merodeador
    M.dificultad=10;
    M.intervalo=120;
    
    //Dificultad del Slime
    difSlime=10;
    probAparecer=90;
    velocidadAvance=10;
    tiempoEspera=20;
    
    //Aumento de la barra de estres
    aumentoEstres=0.5;
     }
     break;
     
     
    } //Fin del Switch
  } //Fin de la Funcion
} //Fin de la Clase


Noches noches=new Noches();
