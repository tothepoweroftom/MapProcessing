class Particle {
  
  PVector origin;
  PVector destination;
  PVector position;
  int size;
  float delta;
  PVector trail[];
  
  color orange = color(255, 201, 0);
  color white = color(255, 255,255);
  
  Particle(PVector start, PVector end) {
   origin = start;
   destination = end;
   size = 1;
   position = new PVector(0,0);
   delta = 0.0;
   trail = new PVector[1000];
  }
  
  void run() {
   update();
   showTrail();
   display();
  }
  
  void update() {
    
    position = this.origin.lerp(this.destination, this.delta);
    if(this.delta > 0.15) {
      this.delta += 0.05;
    } else {
       this.delta += 0.001;
    }
    
  }
  
  void showTrail() {
    append(this.trail,this.position.copy());
    if(this.trail.length > 10) { shorten(this.trail); }
    for (int i=0; i <this.trail.length; i++) {
     PVector pos = this.trail[i]; 
    }
    
  }
  
  void display() {
    strokeWeight(1);
    stroke(255,100);
    
    line(this.destination.x, this.destination.y, this.origin.x, this.origin.y);
    
  }
  
  boolean landed() {
   if(this.delta > 1) {
     
      for(int e = 11; e > 1; e--){
        fill(lerpColor(orange, white, e/11));
        ellipse(this.position.x, this.position.y, this.size + e/2 , this.size + e/2);
      }
      line(this.destination.x, this.destination.y, this.origin.x, this.origin.y);

      return true;
  } else {
    return false;
  }
  }
  
}