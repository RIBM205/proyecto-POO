


class Panel{
int x,y;
boolean panelAbierto;
  void dibujar(){
    if(panelAbierto==false){
     fill(100);
     square(x,y,75);
    } else {
    fill(100);
    square(x/2,y/2,600);
      for(int i=0;i<n;i++){
      C[i].dibujar();
      }
    }
    if(panelAbierto){cerrar();}
  }
   int cerrarX,cerrarY;
    void cerrar(){
      fill(150,0,0);
      square(cerrarX,cerrarY,50);
    }
     Panel(){
    x=width*5;
    y=width*3;
    cerrarX=width*2;
    cerrarY=height;
    }
   
}   
class Palanca extends Estres{
  int x,y;
  float palancaX,palancaY;
  boolean enPalanca;
  boolean bajando=false;
  boolean activada;
  int tiempoActivada=0;
  
    void dibujar(){
      if(enPalanca==false){
        fill(100);
        square(x,y,75);
      } else {
        fill(100);
        square(x/2,y/2,600);
        fill(150,0,0);
        circle(palancaX,palancaY,50);
      }
       if(enPalanca) cerrar();
    }
     int cerrarX,cerrarY;
    void cerrar(){
      fill(150,0,0);
      square(cerrarX,cerrarY,50);
    }
      Palanca(){
      x=width*4;
      y=height*3;
      palancaX=width*5;
      palancaY=height*2.5;
      cerrarX=width+50;
      cerrarY=height;
      } 
     void bajar() {
      if (PL.palancaY >= 600.0) {
        activada = true;
      } else {
        activada = false;
        tiempoActivada=0; 
      }
      if(activada){
          tiempoActivada++;
          if(tiempoActivada>=120){
            palancaY=250;
            activada=false;
            reiniciar();
          }         
      }
    }  
       void reiniciar(){
       if(camarasDesconectadas){
         camarasDesconectadas=false;
         }
       }
}

int n=8;
class Cables {
  int espacioX=500,espacioY=160;
  int cableX,cableY;
  color [] colores={
  color(200,0,0),
  color(200,0,0,20),
  color(0,200,0),
   color(0,200,0,20),
  color(0,0,200),
   color(0,0,200,20),
  color(200,200,0),
  color(200,200,0,20)
  };
  float[] posX = new float[n];
float[] posY = new float[n];
float radio = 75;
    
    void dibujar(){
       
        for(int i=0;i<n;i++){
          cableX=i%2;
          cableY=i/2;
           float cx = (cableX * espacioX) + width/4;
          float cy = (cableY * espacioY) + height/4;

          posX[i] = cx;
          posY[i] = cy;
          
           fill(colores[i]);
          circle((cableX*espacioX)+width/4,(cableY*espacioY)+height/4,75);
        } 

    }
   
        
}

Panel P=new Panel();
Cables C[]= new Cables[n];
Palanca PL= new Palanca();
