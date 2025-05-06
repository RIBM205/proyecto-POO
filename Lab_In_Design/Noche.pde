boolean enPartida,normalSetup;


class Noches{
  int tiempoNoche,tiempoJugado;
  int nocheActual=1;
  boolean transicionInicio,transicionFinal;
  int tiempoPausa;
  int inicioPausa;
  boolean pausado = false; 
  
  void inicioNoche(){
    tiempoNoche=millis();
    tiempoJugado=0;
    tiempoPausa=0;
  }
    void tiempoNoche(){
    if(enPartida==true){
    tiempoJugado= millis()-tiempoNoche-tiempoPausa;} 
     if (tiempoJugado >= 570000) { //La duracion total de la noche es de 9 minutos y medio
      println("FIN");
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
}


Noches noches=new Noches();
