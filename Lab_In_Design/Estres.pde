class Estres{
    float estres;
  
    void aumentar(){
    if(cerrado==true&&estres<=100);
      estres+=0.05;
      println("Estres" +estres);
      println(cerrado);
    }
    
    void reducir(){
    
    
    }
    
    

}
Estres EST= new Estres();

class Cafe{
boolean enCafetera;

  void dibujar(){
    if(enCafetera==false){
    image(cafetera,width/3,width/2,300,200);
    } else {
    image(cafetera,width/2,height/2,500,300);
    }
    
  }


}


Cafe cafe=new Cafe();
