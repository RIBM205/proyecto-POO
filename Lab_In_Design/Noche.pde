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
  
  int horas,duracionHoras;
  int minutos;
  int duracionMinutos;
  
  void reloj(){

   
   duracionMinutos= tiempoJugado/1187;

  horas=21+(duracionMinutos/60);
  minutos=duracionMinutos%60;
  
    if (horas >= 24) {
      horas -= 24; 
      }   
    //println(horas,minutos);

  }
  
  void mostrarReloj(){
    if(!camarasCerradas){
    fill(200,0,0);
    text(nf(horas, 2) + ":" + nf(minutos, 2), 50, 50);
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
     probabilidadAcechadorMenor=30; //Probabilidad de Avanzar cuando esta siendo observado
    tiempoAcechadorMenor=0.8;        //Tiempo de Avanzar cuando las camaras esta siendo observado
    
    probabilidadAcechadorMayor=50;     //Probabilidad de avanzar con las camaras cerradas
    tiempoAcechadorMayor=1.6;         //Tiempo de avanzar con las camaras cerradas
    
    oportunidadAcechador=540;         //El tiempo que tiene el jugador para regresar al acechador en su ultima posicion
    TiempoA=200;                      //El tiempo en el que el acechador comprobara si puede moverse o no
    
    //Dificultad del Merodeador 
    M.dificultad=1;           //Dificultad del merodeador, determina que tan constantemente se puede mover.
    M.intervalo=420;         //El intervalo de movimientos
    
    //Dificultad del Slime 
    difSlime=0;               // El tiempo que tarda en comprobar si puede aparecer o no
        probAparecer=0;       // Probabilidad de aparecer
    velocidadAvance=0;        //Velocidad a la que avanza el Slime una vez aparece en las ventilaciones
    tiempoEspera=0;           //Tiempo maximo que tiene el jugador para cerrar la ventilación.
    
    //Aumento de la barra de estres
    aumentoEstres=0.01;         //Que tanto aumenta el estres
    EST.tiempoMaximo=1800;     //El tiempo con el que se comrpueba el nivel de estres para el fallo de los sistemas
      }
     break;
     
     case 2:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 2
    //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    TiempoA=5;
    //Dificultad del Merodeador DESACTIVADO EN NOCHE UNO
    M.dificultad=0;
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
     
      case 3:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 3
  //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    TiempoA=5;
    //Dificultad del Merodeador DESACTIVADO EN NOCHE UNO
    M.dificultad=0;
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
     
      case 4:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 4
  //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    TiempoA=5;
    //Dificultad del Merodeador DESACTIVADO EN NOCHE UNO
    M.dificultad=0;
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
     
      case 5:{ ////////////////////////////////////////////////////////////////////////////////NOCHE 5
  //Dificultad del Acechador
     probabilidadAcechadorMenor=30;
    tiempoAcechadorMenor=0.02;    
    
    probabilidadAcechadorMayor=70;
    tiempoAcechadorMayor=0.06;
    
    oportunidadAcechador=4;
    TiempoA=5;
    //Dificultad del Merodeador DESACTIVADO EN NOCHE UNO
    M.dificultad=0;
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
     
     
    } //Fin del Switch
  } //Fin de la Funcion
} //Fin de la Clase


Noches noches=new Noches();
