void keyPressed(){
  if(ActiveMenu==false){
    if(keyCode==ESC){  
      key=0;
      pausa=true;
      
    }
  }
  if(enPartida==true&&hidden==-1){
    if(key=='e'||key=='E'){
    camarasCerradas=!camarasCerradas;
    }
  }
  
  if(enPartida){
    if(  (key=='n'||key=='N')&&noches.nocheActual<5){
    noches.nocheActual++;
    }
    
  }
}

void mouseDragged() {
  if (!PL.activada && PL.enPalanca) {
    if (dist(mouseX, mouseY, PL.x * 1.25, PL.y * 0.9) < 25) {
      PL.bajando = true;
    }

    if (PL.bajando) {
      PL.palancaY += 10;
    }
  }
    if(escenario==9&&VLV.enMinijuego&&VLV.angulo<=2000){
      VLV.angulo+=5;
  }
}



void mousePressed(){
//ESCONDITES
if(camarasCerradas&&enPartida==true){ //ESCONDITES//////////////
   if(escenario==1 && mouseX>hl.x && mouseY>hl.y && mouseX<hl.x+hl.t && mouseY<hl.y+hl.t){ //Si el escenario es 1 (LABORATORIO) y se presiona en la zona marcada, cambias a a imagen para esconderte
       hidden=1;
     }
      if(escenario==9 && !VLV.enMinijuego && mouseX>hs.x && mouseY>hs.y && mouseX<hs.x+hs.t && mouseY<hs.y+hs.t){ //Si el escenario es 9 (SOTANO) y se presiona en la zona marcada, cambias a a imagen para esconderte
     hidden=2;
     }  
     if(escenario==2 && mouseX>ho.x && mouseY>ho.y && mouseX<ho.x+ho.t && mouseY<ho.y+ho.t){ //Si el escenario es 0 (OFICINA) y se presiona en la zona marcada, cambias a a imagen para esconderte
       hidden=0;
     }
        switch(hidden){
       case 0: if(hidden==0&&mouseX>dejaro.x && mouseY>dejaro.y && mouseX<dejaro.x+dejaro.t && mouseY<dejaro.y+dejaro.t){
        hidden=-1; 
       } break;
      case 1: if(hidden==1&&mouseX>dejarl.x && mouseY>dejarl.y && mouseX<dejarl.x+dejarl.t && mouseY<dejarl.y+dejarl.t){
        hidden=-1; 
       }
        case 2:if(hidden==2&&mouseX>dejars.x && mouseY>dejars.y && mouseX<dejars.x+dejars.t && mouseY<dejars.y+dejars.t){
        hidden=-1; 
       }
     }
   }  
  if(ActiveMenu){ ///////////////////////////////MENUS////////////////////////////////////////////
    if(mouseX>MM.playX && mouseY>MM.playY && mouseX<MM.playX+500 && mouseY<MM.playY+100){
    ActiveMenu=false;
    noches.transicion();
    return;
    }
     if(mouseX>MM.exitX && mouseY>MM.exitY && mouseX<MM.exitX+500 && mouseY<MM.exitY+100){
    exit();
  }
 }
 if(pausa){
   if(!enMapa&&mouseX>MM.resX && mouseY>MM.resY && mouseX<MM.resX+500 && mouseY<MM.resY+100){
     pausa=false;
   }
   if(mouseX>MM.mapaX && mouseY>MM.mapaY && mouseX<MM.mapaX+500 && mouseY<MM.mapaY+100){
   enMapa=true;
   }
   if(mouseX>MM.volverX && mouseY>MM.volverY && mouseX<MM.volverX+500 && mouseY<MM.volverY+100){
   enMapa=false;
   }
   
   
   if(!enMapa&&mouseX>MM.mainX && mouseY>MM.mainY && mouseX<MM.mainX+500 && mouseY<MM.mainY+100){
   pausa=false;
   ActiveMenu=true;
   GM.reset();
   }
 } //////////////////////////DEJAR DE ESCONDERSE////////////////////////////////////////////
    
   switch(hidden){
       case 0: if(hidden==0&&mouseX>dejaro.x && mouseY>dejaro.y && mouseX<dejaro.x+dejaro.t && mouseY<dejaro.y+dejaro.t){
        hidden=-1; 
       } break;
      case 1: if(hidden==1&&mouseX>dejarl.x && mouseY>dejarl.y && mouseX<dejarl.x+dejarl.t && mouseY<dejarl.y+dejarl.t){
        hidden=-1; 
       }
        case 2:if(hidden==2&&mouseX>dejars.x && mouseY>dejars.y && mouseX<dejars.x+dejars.t && mouseY<dejars.y+dejars.t){
        hidden=-1; 
       }
   }
   ///ESCENARIOS/////////////////////////
  if (normalSetup==true && enPartida==true) {
    if (mouseX > db.x && mouseY > db.y && mouseX < db.x + db.w && mouseY < db.y + db.h) { //Door Back
      if (escenario == 1) {
        escenario = 0;
        return;
        }
       if(escenario==3){
      escenario=1;
      return;}
      if(escenario==6){
         escenario=8;
       return;}
        if(escenario==7){
         escenario=6;
       return;}
        if(escenario==8){
         escenario=6;
       return;}
       if(escenario==5){
         escenario=9;
         return;
       }
       if(escenario==2){
       escenario=1;
       return;}
       if(escenario==9){
       escenario=5;
       return;}
       if(escenario==10||escenario==11||escenario==12||escenario==13||escenario==14||escenario==15){
       escenario=2;
       return;
       }
    }
     if(mouseX > dd.x && mouseY > dd.y && mouseX < dd.x + dd.w && mouseY < dd.y + dd.h){
      if (escenario == 0 ) {
        escenario = 1;
        return;
       }
       if(escenario==6){
         escenario=7;
       return;}
    }
    
    if (escenario == 1 && mouseX > descaleras.x && mouseY > descaleras.y && mouseX < descaleras.x + descaleras.w && mouseY < descaleras.y + descaleras.h) {
      escenario = 3;
      pasosS=true;
      return;
    }  
    
    
    if (escenario == 1 && mouseX > dPasilloSec.x && mouseY >dPasilloSec.y && mouseX < dPasilloSec.x + dPasilloSec.w && mouseY < dPasilloSec.y + dPasilloSec.h) {
      escenario = 2;
      return;
    }
    
      
      if(escenario==3){
         if(mouseX >darriba.x && mouseY >darriba.y && mouseX < darriba.x + darriba.w && mouseY < darriba.y +darriba.h){
          escenario=4;
        return;}
        if(mouseX >dabajo.x && mouseY >dabajo.y && mouseX < dabajo.x + dabajo.w && mouseY <dabajo.y +dabajo.h){
        escenario=5;
        return;}
      }
      
      if(escenario==4){
        if(mouseX >descanso.x && mouseY >descanso.y && mouseX < descanso.x + descanso.w && mouseY < descanso.y +descanso.h){
        escenario=6;
        return;}
          if(mouseX >volverEsc.x && mouseY >volverEsc.y && mouseX < volverEsc.x + volverEsc.w && mouseY <volverEsc.y +volverEsc.h){
          escenario=3;
           return; }        
      }
      if(escenario==6  &&  mouseX >bajar.x && mouseY >bajar.y && mouseX < bajar.x + bajar.w && mouseY <bajar.y +bajar.h){
         escenario=4;
         return;
           }
   if(escenario == 5 && mouseX > descaleras.x && mouseY > descaleras.y && mouseX < descaleras.x + descaleras.w && mouseY < descaleras.y + descaleras.h){
     escenario=3;
     return;
     }
     
     if(escenario==2){
       if(mouseX >lab1.x && mouseY >lab1.y && mouseX < lab1.x + lab1.w && mouseY <lab1.y +lab1.h){
         escenario=10;
         return;
       }
         if(mouseX >lab2.x && mouseY >lab2.y && mouseX < lab2.x + lab2.w && mouseY <lab2.y +lab2.h){
         escenario=11;
         return;
       }
         if(mouseX >lab3.x && mouseY >lab3.y && mouseX < lab3.x + lab3.w && mouseY <lab3.y +lab3.h){
         escenario=12;
         return;
       }
         if(mouseX >lab4.x && mouseY >lab4.y && mouseX < lab4.x + lab4.w && mouseY <lab4.y +lab4.h){
         escenario=13;
         return;
       }
         if(mouseX >lab5.x && mouseY >lab5.y && mouseX < lab5.x + lab5.w && mouseY <lab5.y +lab5.h){
         escenario=14;
         return;
       }
        if(mouseX >lab6.x && mouseY >lab6.y && mouseX < lab6.x + lab6.w && mouseY <lab6.y +lab6.h){
         escenario=15;
         return;
       }
     
     }
    
    /////////////////////FIN ESCENARIOS///////////////////////////////////////

  }//Sin Camaras, Ni Menu, ni escondido
          if(enPartida==true){
            if(A.posAct==3&&camara==10&&mouseX > A.ex && mouseY > A.ey && mouseX < A.ex + A.et && mouseY < A.ey + A.et)
            A.posAct=int(random(2));
      
            ventilacion Vactual = ventilaciones[S.ventilacionActual];
            
                if (!VLV.enMinijuego && mouseX > Vactual.x && mouseY > Vactual.y && mouseX < Vactual.x + Vactual.w && mouseY < Vactual.y + Vactual.h) {
                  if (escenario == 0 || escenario == 7 || escenario == 9 || escenario == 12) {
                    Vactual.conductosActivos = 1;
                  }
                }
                
                if (Vactual.conductosActivos == 1) {
                  if (mouseX > Vactual.rx && mouseY > Vactual.ry && mouseX < Vactual.rx + Vactual.rw && mouseY < Vactual.ry + Vactual.rh) {
                    Vactual.conductosActivos = 0;
                    return;
                  }
                  if (!VLV.enMinijuego && mouseX > Vactual.vx && mouseY > Vactual.vy && mouseX < Vactual.vx + Vactual.vw && mouseY < Vactual.vy + Vactual.vh) {
                    Vactual.cerrado = true;
                    return;
                  }
                  if (Vactual.cerrado && mouseX > Vactual.abrirX && mouseY > Vactual.abrirY && mouseX < Vactual.abrirX + Vactual.abrirT && mouseY < Vactual.abrirY + Vactual.abrirT) {
                    Vactual.cerrado = false;
                    return;
                  }
                }  
                
           if(escenario==8){
            if(mouseX>P.x&&mouseX<P.x+50&&mouseY>P.y&&mouseY<P.y+50&&normalSetup==true)
              P.panelAbierto=true;
              
              for (int i = 0; i < n; i++) {
              float d = dist(mouseX, mouseY, C[i].posX[i],  C[i].posY[i]);
              if (d <  C[i].radio / 2) {
                println("Hiciste clic en el círculo #" + i);
              }
            }
              
           if(mouseX>PL.x&&mouseX<PL.x+75&&mouseY>PL.y&&mouseY<PL.y+75&&normalSetup==true){
              PL.enPalanca=true;
            }
            if(PL.enPalanca==true&&mouseX>PL.cerrarX&&mouseX<PL.cerrarX+50&&mouseY<PL.cerrarY+50&&mouseY>PL.cerrarY){
            PL.enPalanca=false;
            }
            if(P.panelAbierto==true&&mouseX>P.cerrarX&&mouseX<P.cerrarX+50&&mouseY<P.cerrarY+50&&mouseY>P.cerrarY){
            P.panelAbierto=false;
            }
           }
           
           if(escenario==6){
           if(!cafe.enCafetera && !inspeccionando){ 
          if(mouseX>cafe.cafeX&&mouseY>cafe.cafeY&&mouseX<cafe.cafeX+300&&mouseY<cafe.cafeY+200){
            cafe.enCafetera=true;
            return;
          } 
        }  
        
          if(cafe.enCafetera==true){
            if(!cafe.llenando&&cafe.granosRestantes>0&&!cafe.cafeListo&&mouseX>cafe.granosX&&mouseY>cafe.granosY&&mouseX<cafe.granosX+50&&mouseY<cafe.granosY+50){
              cafe.llenar();
              cafe.llenando=true;
              cafe.granosRestantes--;
            }
            if(cafe.cafeListo){
              if(mouseX>cafe.tazaX&&mouseY>cafe.tazaY&&mouseX<cafe.tazaX+50&&mouseY<cafe.tazaY+50){
                estres-=10;
                cafe.cafeListo=false;   
              }  
            }
            if(mouseX>cafe.cerrarX&&mouseY>cafe.cerrarY&&mouseX<cafe.cerrarX+75&&mouseY<cafe.cerrarY+75){
              cafe.enCafetera=false;
            }
          }

           
           } //Si el escenario es 6
             if(escenario==10&&mouseX>cafe.bolsaX&&mouseY>cafe.bolsaY&&mouseX<cafe.bolsaX+300&&mouseY<cafe.bolsaY+300){
              if(cafe.granosRestantes<3){
              cafe.granosRestantes++;             
             } else {
               fill(0);
               text("No deberia de llevar mas granos",width/2,height/1.5);
             }
            }
            if(escenario==9){
              if(!VLV.enMinijuego&&ventilaciones[2].conductosActivos==0){
              if(mouseX>VLV.x&&mouseY>VLV.y&&mouseX<VLV.x+150&&mouseY<VLV.y+150){
                VLV.enMinijuego=true;
              } 
            } else {
              if(mouseX>VLV.cerrarX&&mouseY>VLV.cerrarY&&mouseX<VLV.cerrarX+50&&mouseY<VLV.cerrarY+50){
              VLV.enMinijuego=false;
              VLV.angulo=0;
              }
            }
            
            }
         }  //Si estas en partida
         
         
         
         
         //////////////////////////////// PARA TODOS LOS INPUTS RELACIONADO A LA NARRATIVA        /////////////////////////////////////////
         if(enPartida){
           if(inspeccionando==true){
             if(mouseX>LabStory.cerrarX&&mouseY>LabStory.cerrarY&&mouseX<LabStory.cerrarX+75&&mouseY<LabStory.cerrarY+75){
               inspeccionando=false;
             }
           }
           
          if(!inspeccionando){ 
           if(mouseX>LabStory.assetX&&mouseY>LabStory.assetY&&mouseX<LabStory.assetX+100&&mouseY<LabStory.assetY+100){
                 if(escenario==15 || escenario==7 || escenario==3){
                 inspeccionando=true;
                 }
             }
             
             if(escenario==0&&mouseX>Plan.assetX&&mouseY>Plan.assetY&&mouseX<Plan.assetX+200&&mouseY<Plan.assetY+100){
             inspeccionando=true;
             }
             
             if(escenario==6&&mouseX>LibroS.assetX&&mouseY>LibroS.assetY&&mouseX<LibroS.assetX+200&&mouseY<LibroS.assetY+200&&!cafe.enCafetera){
                 inspeccionando=true;
                 }
                 
                 if(noches.nocheActual==1){
                   if(escenario==13&&mouseX>OrdenA.assetX&&mouseY>OrdenA.assetY&&mouseX<OrdenA.assetX+100&&mouseY<OrdenA.assetY+200){
                     inspeccionando=true;
                   }
                 
                 }
                 
                 if(noches.nocheActual==2){
                   if(escenario==12&&mouseX>ProwlerRep.assetX&&mouseY>ProwlerRep.assetY&&mouseX<ProwlerRep.assetX+100&&mouseY<ProwlerRep.assetY+200){
                     inspeccionando=true;
                   }
                   
                   if(escenario==8&&mouseX>Despido.assetX&&mouseY>Despido.assetY&&mouseX<Despido.assetX+150&&mouseY<Despido.assetY+200){
                   inspeccionando=true;}
                   
                 } //Para la noche 2
                 
                 if(noches.nocheActual==3){
                   if(escenario==14&&mouseX>WOW.assetX&&mouseY>WOW.assetY&&mouseX<WOW.assetX+100&&mouseY<WOW.assetY+200){
                     inspeccionando=true;
                   }
                 if(escenario==10&&mouseX>PPiel.assetX&&mouseY>PPiel.assetY&&mouseX<PPiel.assetX+200&&mouseY<PPiel.assetY+200){
                inspeccionando=true;
                }
                 if(escenario==12&&mouseX>ProgressM.assetX&&mouseY>ProgressM.assetY&&mouseX<ProgressM.assetX+100&&mouseY<ProgressM.assetY+200){
                   inspeccionando=true;
                 }
                 
                 }//Para la noche 3
                 
                if(noches.nocheActual==4){ 
              if(escenario==8&&mouseX>CartaDoc.assetX&&mouseY>CartaDoc.assetY&&mouseX<CartaDoc.assetX+150&&mouseY<CartaDoc.assetY+200){
                  inspeccionando=true;
                }
                if(escenario==11&&mouseX>VecinosP.assetX&&mouseY>VecinosP.assetY&&mouseX<VecinosP.assetX+200&&mouseY<VecinosP.assetY+100){
                  inspeccionando=true;
                }
                
                
              } //Si la noche actual es 4
              
              if(noches.nocheActual==5){
                if(escenario==9&&mouseX>Observa.assetX&&mouseY>Observa.assetY&&mouseX<Observa.assetX+100&&mouseY<Observa.assetY+200){
                  inspeccionando=true;
                }
                if(escenario==12&&mouseX>Will.assetX&&mouseY>Will.assetY&&mouseX<Will.assetX+200&&mouseY<Will.assetY+100){
                  inspeccionando=true;
                }
              } //Para la noche 5
              
              if(noches.nocheActual==4){
                if(escenario==14&&mouseX>PPensar.assetX&&mouseY>PPensar.assetY&&mouseX<PPensar.assetX+200&&mouseY<PPensar.assetY+200){
                inspeccionando=true;
                }
              }
           } // Si no se esta inspeccionando
           
           
         } //En Partida
         
         if(encuestaActiva){
              if(!mostrandoResultado){           
             if(mouseX>LabStory.siX&&mouseY>LabStory.siY&&mouseX<LabStory.siX+430&&mouseY<LabStory.siY+180){
               LabStory.siElegido=true;
                 LabStory.noElegido=false;
                 mostrandoResultado=true;
                 empiezaTiempo=true;
                 
             
             }
             if(mouseX>LabStory.noX&&mouseY>LabStory.noY&&mouseX<LabStory.noX+430&&mouseY<LabStory.noY+180){
                LabStory.noElegido=true;
                  LabStory.siElegido=false;
                    mostrandoResultado=true;
                    empiezaTiempo=true;
                   
             }  
            }
            if(tiempoCumplido && mouseX>LabStory.continuarX&&mouseY>LabStory.continuarY&&mouseX<LabStory.continuarX+100&&mouseY<LabStory.continuarY+100){
                encuestaActiva=false;
                LabStory.noElegido=false;
                  LabStory.siElegido=false;
                  LabStory.silencioPanel=false;
                  LabStory.cuentaPanel=false;
                  LabStory.listoPanel=false;
                  mostrandoResultado=false;
                  tiempoCumplido=false;
                  empiezaTiempo=false;
                  tiempoPanel=0;
                  noches.FinDeNoche();
                  
            }
         }
         
         if(enPartida){ ///////////////////////////// CAMARAS ////////////////////////////////////
           if(!camarasCerradas && !camarasDesconectadas){
             if(mouseX>CAM0.x&&mouseY>CAM0.y&&mouseX<CAM0.x+CAM0.w&&mouseY<CAM0.y+CAM0.h){
               camara=0;
             }
              if(mouseX>CAM1.x&&mouseY>CAM1.y&&mouseX<CAM1.x+CAM1.w&&mouseY<CAM1.y+CAM1.h){
               camara=1;
             }
              if(mouseX>CAM2.x&&mouseY>CAM2.y&&mouseX<CAM2.x+CAM2.w&&mouseY<CAM2.y+CAM2.h){
               camara=2;
             }
              if(mouseX>CAM3.x&&mouseY>CAM3.y&&mouseX<CAM3.x+CAM3.w&&mouseY<CAM3.y+CAM3.h){
               camara=3;
             }
              if(mouseX>CAM4.x&&mouseY>CAM4.y&&mouseX<CAM4.x+CAM4.w&&mouseY<CAM4.y+CAM4.h){
               camara=4;
             }
              if(mouseX>CAM5.x&&mouseY>CAM5.y&&mouseX<CAM5.x+CAM5.w&&mouseY<CAM5.y+CAM5.h){
               camara=5;
             }
              if(mouseX>CAM6.x&&mouseY>CAM6.y&&mouseX<CAM6.x+CAM6.w&&mouseY<CAM6.y+CAM6.h){
               camara=6;
             }
              if(mouseX>CAM7.x&&mouseY>CAM7.y&&mouseX<CAM7.x+CAM0.w&&mouseY<CAM7.y+CAM7.h){
               camara=7;
             }
              if(mouseX>CAM8.x&&mouseY>CAM8.y&&mouseX<CAM8.x+CAM8.w&&mouseY<CAM8.y+CAM8.h){
               camara=8;
             }
              if(mouseX>CAM9.x&&mouseY>CAM9.y&&mouseX<CAM9.x+CAM9.w&&mouseY<CAM9.y+CAM9.h){
               camara=9;
             }
              if(mouseX>CAM10.x&&mouseY>CAM10.y&&mouseX<CAM10.x+CAM10.w&&mouseY<CAM10.y+CAM10.h){
               camara=10;
             }
              if(mouseX>CAM11.x&&mouseY>CAM11.y&&mouseX<CAM11.x+CAM11.w&&mouseY<CAM11.y+CAM11.h){
               camara=11;
             }
              if(mouseX>CAM12.x&&mouseY>CAM12.y&&mouseX<CAM12.x+CAM12.w&&mouseY<CAM12.y+CAM12.h){
               camara=12;
             }
           }
         }
             
}//Fin de la funcion
