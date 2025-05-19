
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
       image(fondo,0,0,width,height);  
        fill(100);
        square(x/2,y/2,600);
        if(!activada){
        image(palancaU,palancaX,palancaY,350,250);
        } else {
        image(palancaD,palancaX,palancaY,350,250);
        }
       
      }
       if(enPalanca) cerrar();
    }
     int cerrarX,cerrarY;
    void cerrar(){
      fill(150,0,0);
      image(tacha,cerrarX,cerrarY,75,75);
    }
      Palanca(){
      x=width*4;
      y=height*3;
      palancaX=width*3;
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
         estres-=10;
         if(!clickPalanca.isPlaying()){
             clickPalanca.play();
           }
         }
       }
}



class Valvula{
  float x,y;
  float angulo;
  boolean enMinijuego;
  int  cerrarX;
   int cerrarY;
  
  void dibujar(){
    if(!enMinijuego){
      fill(120,0,0,50);
      square(x,y,125);
    } else {
     image(fondo,0,0,width,height);  
      pushMatrix();
      translate(x,y);
      rotate(radians(angulo));
      imageMode(CENTER);
      image(valvula,0,0,500,500);
      imageMode(CORNER);
      popMatrix();
       cerrar();
       reinicio();
    }
  }
  void cerrar(){
   if(enMinijuego){ 
    
    image(tacha,cerrarX,cerrarY,75,75);
    }
  }
     void reinicio(){
      if(angulo>=2000){
        if(ventilacionFallando){
          ventilacionFallando=false;
          estres-=10;
        }
      }
    
    }
  
  Valvula(){
    x=width*6.3;
    y=height*4.7;
    cerrarX=width;
    cerrarY=height;
  }
  
}

Valvula VLV= new Valvula();
Palanca PL= new Palanca();

int n = 8;
class Cable {
  float x, y;
  color c;
  boolean conectado = false;
  Cable conectadoA = null;
  float radio = 75;

  Cable(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void dibujar() {
    noStroke();
    fill(c);
    circle(x, y, radio);
  }

  boolean estaDentro(float mx, float my) {
    return dist(mx, my, x, y) < radio / 2;
  }

  void conectar(Cable otro) {
    conectado = true;
    conectadoA = otro;
  }

  void dibujarConexion() {
    if (conectado && conectadoA != null) {
      stroke(red(c), green(c), blue(c));
      strokeWeight(20);
      line(x, y, conectadoA.x, conectadoA.y);

     
    }

  }
}

class Cables {
  int n = 8;
  int espacioX = 500, espacioY = 120;
  float ancho, alto;
  Cable[] cables = new Cable[n];
  int seleccionado = -1;
  boolean arrastrando = false;
  boolean enPanel;
  int panelX,panelY;
  int cerrarX,cerrarY;

  Cables() {
    crearCables();
    panelX=width*4;
    panelY=height*3;
    cerrarX=width;
    cerrarY=height;
  }
  
  void abrir(){
    if(!enPanel){
      fill(150);
      square(panelX,panelY,50);
    } else {
        image(fondo,0,0,width,height);  
        fill(100);
        square(width/4,height/4,600);
        image(tacha,cerrarX,cerrarY,100,100);
    }
  }
  
  void clicsPanel(){
    if(!enPanel && !inspeccionando && enPartida){
      if(mouseX>panelX&&mouseY>panelY&&mouseX<panelX+50&&mouseY<panelY+50){
        enPanel=true;
      }
    }
    if(enPanel){
      if(mouseX>cerrarX&&mouseY>cerrarY&&mouseX<cerrarX+100&&mouseY<cerrarY+100){
      enPanel=false;
       reiniciarConexiones();
       arrastrando = false;
      seleccionado = -1;
      }
    }
  
  }

  void crearCables() {
    color[] colores = {
      color(200, 0, 0), color(200, 0, 0, 20),
      color(0, 200, 0), color(0, 200, 0, 20),
      color(0, 0, 200), color(0, 0, 200, 20),
      color(200, 200, 0), color(200, 200, 0, 20)
    };

    for (int i = 0; i < n; i++) {
      int col = i % 2;
      int row = i / 2;
      float x = (col * espacioX) + ancho / 4 + 300;
      float y = (row * espacioY) + alto / 4 + 200;
      cables[i] = new Cable(x, y, colores[i]);
    }
  }

  void dibujar() {
    // Dibujar conexiones
    for (Cable c : cables) {
      c.dibujarConexion();
    }

    // Dibujar círculos
    for (Cable c : cables) {
      c.dibujar();
    }

    // Línea en curso
    if (arrastrando && seleccionado != -1) {
      stroke(red(cables[seleccionado].c), green(cables[seleccionado].c), blue(cables[seleccionado].c));
      strokeWeight(4);
      line(cables[seleccionado].x, cables[seleccionado].y, mouseX, mouseY);
      noStroke();
    }
  }

  void mousePresionado(float mx, float my) {
    if (!enPanel) return;
    
    for (int i = 0; i < n; i++) {
      if (!cables[i].conectado && cables[i].estaDentro(mx, my)) {
        seleccionado = i;
        arrastrando = true;
        break;
      }
    }
  }

  void mouseSoltado(float mx, float my) {
    if (!enPanel) return;
    if (seleccionado == -1) return;

    for (int i = 0; i < n; i++) {
      if (i != seleccionado && !cables[i].conectado && cables[i].estaDentro(mx, my)) {
        // Comparar color sin transparencia
        color c1 = sinAlpha(cables[i].c);
        color c2 = sinAlpha(cables[seleccionado].c);

        if (c1 == c2) {
          cables[seleccionado].conectar(cables[i]);
          cables[i].conectar(cables[seleccionado]);
        }
      }
    }

    arrastrando = false;
    seleccionado = -1;
    
        if (todosConectados()) {
        reinicio();     
        enPanel = false; 
         reiniciarConexiones();
         arrastrando = false;
      }
  }

  // Remueve alpha del color para comparación
    color sinAlpha(color c) {
    return color(red(c), green(c), blue(c));
    }
    boolean todosConectados() {
    for (Cable c : cables) {
      if (!c.conectado) {
        return false;
      }
    }
    return true;
  }
  
  void reiniciarConexiones() {
    for (Cable c : cables) {
      c.conectado = false;
      c.conectadoA = null;
    }
    seleccionado = -1;
    arrastrando = false;
  }
  
  void reinicio(){
    if(lucesDesconectadas){
      lucesDesconectadas=false;
      estres-=10;
    }
  }

}

 Cables cable = new Cables();
 
