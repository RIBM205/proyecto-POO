  

class hide{ //Para todos los "botones" o zonas para esconerse
int x,y,t;
  void esconder(){
  noStroke();
  fill(120,0,0);
  square(x,y,t);
  
    if(hidden==0){
      image(escondido,0,0,width,height); //Si estamos escondidos en la oficina, muestra la imagen del escondido, cambiando a variable escondido a 0
      dejaro.dejar();
      }
      if(hidden==1){
      image(escondido,0,0,width,height); //Si estamos escondidos en la oficina, muestra la imagen del escondido, cambiando a variable escondido a 1
      dejarl.dejar();
      }
      if(hidden==2){
      image(escondido,0,0,width,height); //Si estamos escondidos en la oficina, muestra la imagen del escondido, cambiando a variable escondido a 1
      dejars.dejar();
      }
      
      if(hidden!=-1){
        if(!respiracion.isPlaying()){
          respiracion.loop();
        }
      } else {
        if(respiracion.isPlaying()){
          respiracion.stop();
        }
      }
      
     
  }
  hide(int a, int b){ //Constructor de la clase
  x=a;
  y=b;
  t=75; //Tamaño
  }
  
  void dejar(){
    switch(hidden){
      case 0: if(hidden==0){
      image(tacha,x,y,t,t); }
      break;
      case 1: if(hidden==1){
      image(tacha,x,y,t,t); }
    break;
      case 2: if(hidden==2){
       image(tacha,x,y,t,t);}
    break;
    }
  }
}

hide hl=new hide (width*4+50,height*4);
hide hs=new hide (width*5,width*4+50);
hide ho=new hide (width*6,height*5+50);

hide dejarl=new hide (width,height);
hide dejars=new hide (width,height);
hide dejaro=new hide (width,height);


PImage conductos;


class ventilacion{
  int x,y,w,h;
  int vx,vy,vw,vh;
  int rx,ry,rw,rh;
  int conductosActivos;
  int abrirX,abrirY,abrirT;
  boolean cerrado;

    void dibujar(){
      if(conductosActivos==0){
     image(ventil,x,y,w,h);
    } 
    if(conductosActivos==1){
    image(conductos,0,0,width,height);
    if(ventilacionFallando){
        image(humo,0,0,width,height);
      }
      
    cerrar();
    regresar();
    
      
    }
  }
   void regresar(){
    strokeWeight(1);
    fill(100,70);
    rect(rx,ry,rw,rh);
    }
    void cerrar(){
    if(cerrado==false){
      stroke(10);
      strokeWeight(6);
      fill(150);
      rect(vx,vy,vw,vh);
    } else if(cerrado==true) {
    image(vents,0,0,width,height);
    image(tacha,abrirX,abrirY,abrirT,abrirT);
   
    }
    
    }
   ventilacion(int a,int b, int c, int d){
    x=a;
    y=b;
    w=c;
    h=d;
    rx=width/4;
    ry=height-200;
    rw=width/2;
    rh=height/8;
    
    vx=width/2+200;
    vy=height/4+100;
    vw=width/4;
    vh=height/4;
    
    abrirX=width/12;
    abrirY=height/8;
    abrirT=50;
    }

}

ventilacion[] ventilaciones = new ventilacion[4];
