
import codeanticode.syphon.*;

PImage bg;
SyphonServer server;

ParticleTrails pt;

void setup() {
  size(1920, 1080, P3D);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("earthspec1k.jpg");
  bg.resize(1920,1080);
  bg.filter(INVERT);
  server = new SyphonServer(this, "Processing Syphon");

  
  pt = new ParticleTrails();
  
}

void draw() {
  image(bg, 0, 0);

  server.sendScreen();

  pt.move();
  
  if(random(0,1) > 0.8) {
    PVector v1 = new PVector(400 +random(-100,100), 20+random(100,200));
  PVector v2 = new PVector(25 + random(-100,100), 50 + random(-100,100)); 
    pt.addParticle(v1, v2);
  }

}