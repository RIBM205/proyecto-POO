int escenario=0; 
/*0 - Recepcion                4=  Escaleras Planta Alta  8=Oficina      12= Lab 3      16=Sala Secreta
1= Pasillo de entrada          5= Escaleras Sotano        9=sotano.       13=Lab 4
2= Pasillo Secundario          6= Sala de Descanso        10= Lab 1        14=Lab 5
3= Escaleras Planta Baja       7=Baño                      11= Lab 2        15=Lab 6
*/   
PImage oficina,pasilloSecundario,sotano,mainHall, twoHall, cleaning, twoLab, stairs, restRoom, recepcion, SR;
PImage stairsS, stairsR; //Usado para la zona de escaleras del sotano y de arriba.
PImage laboratorio1,laboratorio2,laboratorio3,laboratorio4,laboratorio5,laboratorio6;


class doors{ //Para todas las zonas que al dar clic cambias de escenario
int x,y,h,w;
  void dibujar(){
  noStroke();
  fill(200,110,110,50);
  rect(x,y,w,h); 
  }
  doors(int a, int b, int c, int d){ //Constructor de la clase
  x=a;
  y=b;
  h=c; //Alto
  w=d; //Ancho
  }
}
doors db=new doors(width*3,height*6+50,width*2,width*6);   //puerta situada abajo
doors descaleras=new doors(width*4+30,height+70,width+50,height+50); 
doors darriba= new doors(width*6,height/3,width*5,height*4);
doors dabajo= new doors(width,height,width*3,height*3);
doors dd=new doors(width*9+50,height+30,width*8,height*2);   //Puerta situada a la derecha de la pantalla
doors dPasilloSec=new doors(width*7+20,height/3-30,height*6,width*4-63); //Puerta para el pasillo drecho
doors descanso= new doors(width*3,0,width*3-30,height*5);
doors dejarRest= new doors(width,height,height,width);
doors volverEsc=new doors(0,height*4,height*3,width*5);
doors bajar=new doors(width*3,height*3,height*3,width*2);

doors lab1=new doors(width*2,height*3,height*3+50,width/2);
doors lab2=new doors(width*3-15,height*2+25,height*3+30,width/3);
doors lab3=new doors(width*3+30,height+75,height*3,width/4);
doors lab4=new doors(width*9,height+75,height*3,width/5-5);
doors lab5=new doors(width*9+25,height*2+30,height*3+50,width/3);
doors lab6=new doors(width*10-20,height*3,height*3+75,width/2-5);


void escenarios(){
    switch(escenario){
        case 0:{
         image(recepcion,0,0,width,height); //Recepcion
           dd.dibujar();
           
            if(!inspeccionando) 
              ventilaciones[0].dibujar();
              S.ventilacionActual = 0;
            
           if (ventilaciones[0].conductosActivos == 0)
            Plan.generar();
       }
       break;
       
       case 1:{
         image(mainHall,0,0,width,height); //Pasillo Principal
         descaleras.dibujar();
         dPasilloSec.dibujar();
          db.dibujar();
          
         if(noches.nocheActual==2) 
          WithUs.generar();
      }
      break; 
      case 2:{
       image(pasilloSecundario,0,0,width,height); //Pasillo Secundario
      lab1.dibujar();
      lab2.dibujar();
      lab3.dibujar();
      lab4.dibujar();
      lab5.dibujar();
      lab6.dibujar();
      db.dibujar();
      }
      break;
      case 3:{
        image(stairs,0,0,width,height);
       darriba.dibujar();
       dabajo.dibujar();
       db.dibujar();
       LabStory.generar();
       }
      break;
      
      case 4:{
      image(stairsR,0,0,width,height);
      descanso.dibujar();
      volverEsc.dibujar();
      }
      break;
       case 5:{
      image(stairsS,0,0,width,height);
        db.dibujar();
        descaleras.dibujar();
      }
      break;
      case 6:{
      image(restRoom,0,0,width,height);    
      db.dibujar();
      dd.dibujar();
      bajar.dibujar();
      cafe.dibujar();
      cafe.tomarCafe();   
      LibroS.generar();
      }
      break;
        case 7:{
      image(cleaning,0,0,width,height);
       db.dibujar();
           ventilaciones[1].dibujar();
              S.ventilacionActual = 1;
       LabStory.generar();
      }
      break;
      
      case 8:{
      image(oficina,0,0,width,height);
      db.dibujar();
      P.dibujar();
      PL.dibujar();
     
     if(!PL.enPalanca && !P.panelAbierto) 
      EST.feedback();
      
      
      if(noches.nocheActual==2)
      Despido.generar();
      
      if(noches.nocheActual==4)
      CartaDoc.generar();
      }
      break;
      
      case 9:{
      image(sotano,0,0,width,height); //Si estamos en este escenario, se mostrara la oppcion de esconderse para ese escenario. 
      db.dibujar();
      hs.esconder();
      
           ventilaciones[2].dibujar();
              S.ventilacionActual = 2;
              
         VLV.dibujar();
         Observa.generar();
      }
      break;
      
      case 10:{
      image(laboratorio1,0,0,width,height);
      db.dibujar();
      cafe.recogerGranos();
      
      if(noches.nocheActual==3)
      PPiel.generar();
      
      }
      break;
      
      case 11:{
      image(laboratorio2,0,0,width,height);
      db.dibujar();
      
      if(noches.nocheActual==4)
      VecinosP.generar();
      
      } 
      break;
      
      case 12:{
      image(laboratorio3,0,0,width,height);
      db.dibujar();
      
         ventilaciones[3].dibujar();
              S.ventilacionActual = 3;
        
        if(noches.nocheActual==2)
        ProwlerRep.generar();
        
        if(noches.nocheActual==5)
          Will.generar();
          
         if(noches.nocheActual==3)
         ProgressM.generar();
      }
      break;
      
      case 13:{
      image(laboratorio4,0,0,width,height);
      db.dibujar();
      
        if(noches.nocheActual==1)
          OrdenA.generar();
          
      }
      break;
      
      case 14:{
      image(laboratorio5,0,0,width,height);
      db.dibujar();
     if(noches.nocheActual==3)
      WOW.generar();
      
      if(noches.nocheActual==4)
      PPensar.generar();
      
    
      }
      break;
      
      case 15:{
      image(laboratorio6,0,0,width,height);
      db.dibujar();
      LabStory.generar();
      }
      break;
      
    }//FIN DEL SWITCH


  
}
