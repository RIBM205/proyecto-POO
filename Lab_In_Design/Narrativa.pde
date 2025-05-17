PImage proyectAngerona1,proyectAngerona2,proyectAngerona3;
PImage cartaDespido,ordenArresto;
PImage huyeTexto, acechadorTexto;
PImage merodeadorReporte,progresoM;
PImage cartaDoctor;
PImage Libro_Leyenda,libroCerrado;
PImage Planeta;
PImage wow;
PImage cartaIl,postIl,papelIl;
PImage postPensar, postPiel;
PImage puedeVerme,voluntad;
PImage entreNosotros;
PImage vecinos,mapaPlan;

PImage silencioEncuesta,cuentaEncuesta,listoEncuesta;

    boolean inspeccionando;
    boolean generado;
    boolean encuestaActiva;
    boolean activarEncuesta;
    boolean puedeEncuesta;
    boolean mostrandoResultado;
    boolean tiempoCumplido;
    boolean empiezaTiempo;
    int tiempoPanel=0;  
    

class Lab_Mysteries extends Estres{
    int probabilidad;

    boolean visibles;
    
    
    boolean siElegido;
    boolean noElegido;
    
    float assetX,assetY;
    int botonX,botonY;
    int cerrarX,cerrarY;
    int siX,siY;
    int noX,noY;
    int x,y;
    int continuarX,continuarY;
    
    boolean listoPanel,silencioPanel,cuentaPanel;
    
    int probAlucinacion;
    
    void generar(){
      if(inspeccionando){
       image(fondo,0,0,width,height);  
        fill(#A02828);
        square(cerrarX,cerrarY,75);
      }
      
      if(escenario==0){
      if(!inspeccionando){ 
        image(papelIl,assetX,assetY,200,100);
      } else {
        image(mapaPlan,width/3,0,800,600);
      }
     } 
      
      if(noches.nocheActual==1){
        if(escenario==15){
          if(!inspeccionando){
            fill(0,0,150,50);
          rect(assetX,assetY,100,100);  
          }
          
         if(inspeccionando){
           image(proyectAngerona1,width/4,height/5,600,600);   
         }       
        }
               if(escenario==6){
           if(!inspeccionando){
             image(libroCerrado,assetX,assetY,200,200);
           } else {
             image(Libro_Leyenda,width/3,0,800,600);
           }
         }
         
           if(escenario==13){
             if(!inspeccionando){
               image(cartaIl,assetX,assetY,100,200);
             } else {
               image(ordenArresto,width/3,0,600,800); 
             }
           }
      
      } // Para la noche uno
      
          if(noches.nocheActual==2){
            if(escenario==12){
              if(!inspeccionando){
                image(papelIl,assetX,assetY,100,200);    
              } else {
                image(merodeadorReporte,width/3,0,600,800);
              }
            }
            if(escenario==8){
              if(!inspeccionando){
              image(cartaIl,assetX,assetY,150,200);
              } else {
              image(cartaDespido,width/3,0,600,800);
              }
            }
           if(escenario==1){ 
            if(!inspeccionando){
              image(entreNosotros,assetX,assetY,400,500);
           } 
          }
         } 
      
         if(noches.nocheActual==3){
        if(escenario==7){
          if(!inspeccionando){
          fill(0,150,0,50);
          rect(assetX,assetY,100,100);  
          }
          
         if(inspeccionando){
           image(proyectAngerona2,width/4,height/5,600,600);   
         }
         
        }
        
        if(escenario==14){
          if(!inspeccionando){
            image(papelIl,assetX,assetY,100,200);
          } else {
            image(wow,width/6,height/8,800,600);
          }
        
        }
        
        if(escenario==10){
         if(!inspeccionando){
            image(postIl,assetX,assetY,200,200);
          } else {
            image(postPiel,width/6,height/8,700,700);
          }
        
        }
        if(escenario==12){
          if(!inspeccionando){
          image(cartaIl,assetX,assetY,100,200);
          } else {
            image(progresoM,width/3,0,600,800);
          }
        }
      
      }    //Para la noche tres
      
        if(noches.nocheActual==4){ //Para la noche cuatro
          if(escenario==8){
            if(!inspeccionando){
              image(cartaIl,assetX,assetY,150,200);
            } else {
              image(cartaDoctor,width/3,0,500,700);
            }
          
          }
            if(escenario==14){
          if(!inspeccionando){
            image(postIl,assetX,assetY,200,200);
          } else {
            image(postPensar,width/3,height/3,600,600);
          }
        }
          
          if(escenario==11){
            if(!inspeccionando){
              image(papelIl,assetX,assetY,200,100);
            } else {
              image(vecinos,width/4,height/4,800,600);
            }
          }
        
        
        }//Para la noche cuatro
      
         if(noches.nocheActual==5){
        if(escenario==3){
          if(!inspeccionando){
          fill(150,0,150,50);
          rect(assetX,assetY,100,100);  
          }
          
         if(inspeccionando){
           image(proyectAngerona3,width/4,height/5,600,600);   
         }
         
        }
        if(escenario==9){
          if(!inspeccionando){
            image(papelIl,assetX,assetY,100,200);
          } else {
          image(puedeVerme,width/4,height/8,800,600);
          }
        }
        
        if(escenario==12){
          if(!inspeccionando){ 
            image(papelIl,assetX,assetY,200,100);
          } else {
            image(voluntad,width/4,height/8,800,600);
          }
        }
      }  //Para la noche cinco
      
    
    }
    
    
    
    
    
    void encuesta(){
      activarEncuesta=true;
      generado=true;
      

        int generacion=int(random(100));
         println(generacion);
        
      if(generacion<99){
        int panel=int(random(3));
        encuestaActiva=true;
        
        
        switch(panel){
          case 0: {listoPanel=true;}
          break;
          
          case 1: {  cuentaPanel=true;}
          break;
          
          case 2: { silencioPanel=true; }
          break;
        }
        
        
      } else {
        noches.FinDeNoche();
      }
      
      }
      
      void opcionesEncuesta(){
   if (encuestaActiva) {
     
      if (LabStory.noElegido || LabStory.siElegido) return;
      
      
        if (silencioPanel) {
          image(silencioEncuesta, 0, 0, width, height);
        } else if (cuentaPanel) {
          image(cuentaEncuesta, 0, 0, width, height);
        } else if (listoPanel) {
          image(listoEncuesta, 0, 0, width, height);
        }
               fill(200,0,0,50);
       rect(siX,siY,430,180);
       rect(noX,noY,430,180);
        return;
      }

      }
      
      
      
      void tiempoEncuesta(){
       
        
        if(tiempoPanel>=180){
          tiempoCumplido=true;
        }
        
      
          
        
      
      }
      
      void opcionSi(){
        
        if(silencioPanel){
           image(proyectoAngerona,0,0,width/2,height);
        }
         if(cuentaPanel){ 
            
        }
         if(listoPanel){ 
          image(MundoCruel,0,0,width/2,height);
        }
            if (tiempoCumplido && empiezaTiempo) {
              fill(150, 0, 0);
              square(LabStory.continuarX, LabStory.continuarY, 100);
          }
      }
      
      int trs;


       void opcionNo(){
 
         if(silencioPanel){
          image(Angerona,x,y,width,height);
          x=int(random(-100,100));
           y=int(random(-100,100));
        } else if(cuentaPanel){
           image(poema,0,0,width,height);
        }  else if(listoPanel){
            fill(0,255-trs);
            rect(0,0,width,height);
           image(planeta,0,0,width,height); 
           trs--;
        }
               if (tiempoCumplido && empiezaTiempo) {
              fill(150, 0, 0);
              square(LabStory.continuarX, LabStory.continuarY, 100);
          }
      
     } 
    
    
    boolean alucinando;
    int alucinacion;
    
    void glitch(){
      if(estres>=90){
        probAlucinacion=40;
        
      } else if(estres>=70){;
        probAlucinacion=30;
        
      } else if(estres>=30){
        probAlucinacion=20;
      
      }  else if(estres>=10){
        probAlucinacion=10;
      }  else if(estres<9){
        probAlucinacion=0;
      }
      
      if(!camarasCerradas && !alucinando){
        alucinando=true;
        
        int material=int(random(100));
        
        if(material<probAlucinacion){
           
        
        } else {
          alucinando=false;
        }
        
      }
      
      
    }
    
    Lab_Mysteries(float x, float y){
        assetX=x;
        assetY=y;
        
        cerrarX= width;
        cerrarY= height;
        
        siX=width+30;
        siY=height*4;
        
        noX=width*6+50;
        noY=height*4;
        
        continuarX=width*11;
        continuarY=0;
    }

}


Lab_Mysteries LabStory= new Lab_Mysteries(width*5,width*2);
Lab_Mysteries LibroS= new Lab_Mysteries(width*8,height*3);
Lab_Mysteries CartaDoc = new Lab_Mysteries(width*9,height*2);
Lab_Mysteries ProwlerRep= new Lab_Mysteries(width, height*3);
Lab_Mysteries  WOW= new Lab_Mysteries(width*10,height*5);
Lab_Mysteries Observa= new Lab_Mysteries(width*10,height*2);
Lab_Mysteries PPensar = new Lab_Mysteries(width*5,height*3);
Lab_Mysteries PPiel = new Lab_Mysteries(width*2,height*5);
Lab_Mysteries Despido = new Lab_Mysteries(width*7,height*2);
Lab_Mysteries Plan= new Lab_Mysteries(width*4,height);
Lab_Mysteries Will = new Lab_Mysteries(width*2,height*5);
Lab_Mysteries WithUs = new Lab_Mysteries(width*4,height*3);

Lab_Mysteries OrdenA = new Lab_Mysteries(width*2,height*4);

Lab_Mysteries ProgressM = new Lab_Mysteries(width*6,height*3);
Lab_Mysteries VecinosP = new Lab_Mysteries(width*8,height*5);
