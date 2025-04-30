

class merodeador{
  int opciones,opcionA,opcionB,opcionC,opcionD;
  int merodeadorPos;
  float tiempoMerodeador;
  void generar(){
//ESTE CODIGO NO FUNCIONA; NO TIENE SENTIDO LOS MOVIMIENTOS XDDDDDDDDDDD
  image(merodeador,0,0,200,200);
  }
  void mover(){
    switch(escenario){
      case 0:if(escenario==0){
        opcionA=2;
        opcionB=3;
        }
        break;
      case 1:if(escenario==1){
        opcionA=3;
        }
        break;
      case 2:if(escenario==2){
      opcionA=0;
      opcionB=4;
        }
        break;
      case 3:if(escenario==3){
      opcionA=0;
      opcionB=1;
      opcionC=5;
        }
        break;
      case 4:if(escenario==4){
      opcionA=2;
        }
        break;
      case 5:if(escenario==5){
      opcionA=3;
      opcionB=6;
        }
        break;
      case 6:if(escenario==6){
      opcionA=5;
      opcionB=12;
      opcionC=13;
        }
        break;
      case 7:if(escenario==7){
      opcionA=8;
        }
        break;
      case 8:if(escenario==8){
      opcionA=7;
      opcionB=12;
        }
        break;
      case 9:if(escenario==9){
      opcionA=13;
      opcionB=10;
        }
        break;
      case 10:if(escenario==10){
      opcionA=9;
        }
        break;
      case 11:if(escenario==12){
      opcionA=6;
      opcionB=8;
        }
        break;
      case 12:if(escenario==13){
      opcionA=9;
      opcionB=6;
      }
      break;
    }
    tiempoMerodeador+=0.1;
    
    if(tiempoMerodeador>=10){
    opciones=int(random(0,4));
   
    switch(opciones){
    case 0:
    opciones=opcionA;
    break;
    case 1:
    opciones=opcionB;
    break;
    case 2:
    opciones=opcionC;
    break;
    case 3:
    opciones=opcionD;
    break;
      }
    merodeadorPos=opciones;
       tiempoMerodeador=0;
       }
     // println(merodeadorPos);
    //println(tiempoMerodeador);
  }
 
}

merodeador M= new merodeador();
