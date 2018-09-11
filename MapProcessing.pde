
import codeanticode.syphon.*;

PImage bg;
SyphonServer server;

ParticleTrails pt;

void setup() {
  size(1280, 800, P3D);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("map.png");
  bg.resize(1280,800);
  server = new SyphonServer(this, "Processing Syphon");
  
  
  pt = new ParticleTrails();
  
}

void draw() {
  image(bg, 0, 0);
  smooth();

  ellipse(width/2, height/4, 1, 1);
  server.sendScreen();

  pt.move();
  
  if(random(0,1) > 0.8) {
    PVector v1 = new PVector(400, 20);
  PVector v2 = new PVector(25, 50); 
    pt.addParticle(v1, v2);
  }

}