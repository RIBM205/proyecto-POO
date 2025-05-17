PImage cam3,cam4,cam5,cam6,cam7,cam8,cam9,cam10,cam11,cam12;

class BotonCamaras{
  
  int x,y,w,h;
  
    void dibujar(){
     noStroke(); 
      fill(255,0,0,50);
      rect(x,y,w,h);
    
    }
    
    
    BotonCamaras(int _x,int _y,int _w,int _h){
      x=_x;
      y=_y;
      w=_w;
      h=_h;
    }



}

void mostrar(){
  if(!camarasCerradas){
  CAM0.dibujar();
  CAM1.dibujar();
  CAM2.dibujar();
  CAM3.dibujar();
  CAM4.dibujar();
  CAM5.dibujar();
  CAM6.dibujar();
  CAM7.dibujar();
  CAM8.dibujar();
  CAM9.dibujar();
  CAM10.dibujar();
  CAM11.dibujar();
  CAM12.dibujar();
  }
}

void numeracion(){
 if(camarasCerradas==false){
   if(!camarasDesconectadas){ 

      switch(camara){
          case 0: image(cam0,0,0,width,height); break;
          case 1: image(cam1,0,0,width,height); break; 
          case 2: image(cam2,0,0,width,height); break;
          case 3: image(cam3,0,0,width,height); break;
          case 4: image(cam4,0,0,width,height); break;
          case 5: image(cam5,0,0,width,height); break;
          case 6: image(cam6,0,0,width,height); break;
          case 7: image(cam7,0,0,width,height); break;
          case 8: image(cam8,0,0,width,height); break;
          case 9: image(cam9,0,0,width,height); break;
          case 10: if(camara==10){ 
            image(cam10,0,0,width,height); 
             A.camActive=true;
              A.generar();
              A.posicion();
              A.iluminar();
              } else {
               A.camActive=false;
              }
          break;
         case 11:image(cam11,0,0,width,height); break;
         case 12:image(cam12,0,0,width,height); break;
      }
    } else {
      image(noCam,0,0,width,height);
    }
         image(mapaCam,0,0,width,height);
         noches.mostrarReloj();
  }
}

BotonCamaras CAM0= new BotonCamaras(width+53,height*7+40,width/2+13,height/2-14); //RECEPCION
BotonCamaras CAM1= new BotonCamaras(width+53,height*6+19,width/2-20,height+20); //PASILLO PRINCIPAL
BotonCamaras CAM2= new BotonCamaras(width*2-16,height*6+59,width-4,height/2-12);   //PASILLO SECUNDARIO
BotonCamaras CAM3= new BotonCamaras(width*2-16,height*7-2,width/2-18,height/2-11); //LABORATORIO 4
BotonCamaras CAM4= new BotonCamaras(width*2+15,height*7-2,width/2-19,height/2-11); //LABORATORIO 5
BotonCamaras CAM5= new BotonCamaras(width*2+49,height*7-2,width/2-19,height/2-11); //LABORATORIO 6
BotonCamaras CAM6= new BotonCamaras(width*2-16,height*6+21,width/2-19,height/2-11); //LABORATORIO 1
BotonCamaras CAM7= new BotonCamaras(width*2+15,height*6+21,width/2-19,height/2-11);  //LABORATORIO 2
BotonCamaras CAM8= new BotonCamaras(width*2+49,height*6+21,width/2-19,height/2-11); //LABORATORIO 3
BotonCamaras CAM9= new BotonCamaras(width+52,height*5+73,width+27,height/2-3);   //ESCALERAS PB
BotonCamaras CAM10= new BotonCamaras(width*2-9,height*5+16,width/2-14,height/2-24); //BOSQUE
BotonCamaras CAM11= new BotonCamaras(0+12,height*6,width+17,height/2+16); //SOTANO
BotonCamaras CAM12= new BotonCamaras(width*3,height*6,width,height-16); //DESCANSO
