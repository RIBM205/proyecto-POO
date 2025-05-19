    float estres,aumentoEstres;
    boolean camarasDesconectadas,lucesDesconectadas,ventilacionFallando;
    
class Estres{

    int probabilidadFallo;
    float tiempoComprobacion;
    int tiempoMaximo=1200;
     color nivelEstres;
     int barraX,barraY;
    
    boolean coolDown;
    int tiempoCooldown=6000;
    int contadorCooldown;


      void aumentar() {
        int cerradas = 0;
      
        for (int i = 0; i < ventilaciones.length; i++) {
          if (ventilaciones[i].cerrado) {
            cerradas++;
          }
        }
      
        estres += aumentoEstres * cerradas;
      }
      
      boolean ventilacionCerrada() {
          for (int i = 0; i < ventilaciones.length; i++) {
            if (ventilaciones[i].cerrado) {
              return true;
            }
          }
          return false;
        }
        
        
        void feedback(){
      
      if (estres <= 25) {
        nivelEstres = color(75, 185, 79); 
      } else if (estres <= 50) {
        nivelEstres = color(229, 192, 0); 
      } else if (estres <= 75) {
        nivelEstres = color(220, 130, 40); 
      } else {
        nivelEstres = color(206, 25, 28); 
      }
      
       fill(nivelEstres);
        rect(barraX, barraY, 300, 80);
        
          fill(255);
          textSize(20);
          text("Estres: " +  String.format("%.2f",estres), width/2-100, height/4);
     }
    
    void dificultad(){
      if (estres >= 90) {
        probabilidadFallo = 70;
        
      } else if (estres >= 70) {
        probabilidadFallo = 50;
        
      } else if (estres >= 50) {
        probabilidadFallo = 20;
        
      } else if (estres >= 20) {
        probabilidadFallo = 10;
        
      } else {
        probabilidadFallo = 0;
      }
      
    if(enPartida){
      tiempoComprobacion++;
      
      if(coolDown){
        contadorCooldown++;
      }
      
      if(contadorCooldown>=tiempoCooldown){
        coolDown=false;
        contadorCooldown=0;
      }
     
     if(tiempoComprobacion>=tiempoMaximo && !coolDown){
       int fallo=(int(random(100)));
       println("Probabilidad de Fallo  "+fallo);
       
       if(fallo<probabilidadFallo){
         int sistemaFallo=int(random(3));
         println("Fallo El Sistema  "+sistemaFallo);
           switch(sistemaFallo){
             case 0: {camarasDesconectadas=true; 
                if(!lucesD.isPlaying()){
                 lucesD.play();
                 }
               }
             break;
             case 1: lucesDesconectadas=true;
             break;
             case 2:{ ventilacionFallando=true;
               if(!gas.isPlaying()){
                 gas.play();
                 }
             }
             break;
           } //Fin del Switch
           coolDown=true;
         }
         tiempoComprobacion=0;
       }  
     }  
    } 
    
    Estres(){
    barraX=width*4+55;
    barraY=height*2+30;
    
    
    }
      
    
    
    

}
Estres EST= new Estres();

class Cafe{
boolean enCafetera;
float cafeX,cafeY;
float  granosX,granosY;
int granosRestantes;
boolean llenando;
float tiempoLlenado;
boolean cafeListo;
float tazaX,tazaY;
float bolsaX,bolsaY;
float cerrarX,cerrarY;

  void dibujar(){
    if(enCafetera==false){
    image(cafetera,cafeX,cafeY,300,200);
    } else {
    image(fondo,0,0,width,height);  
    image(cafetera,width/4,height/3,700,500);
    image(tacha,cerrarX,cerrarY,75,75);
    
      if(granosRestantes==3){
     image(vasoL,granosX,granosY,250,300);
     } else if(granosRestantes==1||granosRestantes==2){
     image(vasoML,granosX,granosY,250,300);
     } 
     else if(granosRestantes<=0){
     image(vasoV,granosX,granosY,250,300);
     } 
     
      if(llenando){
         fill(#4DBF63);
         } else {
         fill(#F24245);
         }
         circle(width/2,height/1.8,25);
    }
  
  }
    void llenar(){
    
      if(llenando&&granosRestantes>=0){ 
         if(escenario==6&&enCafetera){
        image(fuego,0,0,width,height);
      } 
       tiempoLlenado++;
       
       }
      
      if(tiempoLlenado>=300){
      llenando=false;
       tiempoLlenado=0;
       cafeListo=true;
      } 
      
   
    }
   void tomarCafe(){
     if(cafeListo &&enCafetera){
      image(tazaL,tazaX,tazaY,150,200);
     } else if(!cafeListo&&enCafetera){
       image(tazaV,tazaX,tazaY,150,200);
     }
   } 
   
   void recogerGranos(){
       image(saco,bolsaX,bolsaY,300,300);
 
   }
    
    Cafe(){
      cafeX=width*4;
      cafeY=height*3;
      
      granosRestantes=3;
      
      granosX=width*7;
      granosY=height*5;
      
      tazaX=width*9;
      tazaY=height*5;
      
      bolsaX=width*3;
      bolsaY=height*4;
      
      cerrarX=width;
      cerrarY=height;
    }
}


Cafe cafe=new Cafe();
