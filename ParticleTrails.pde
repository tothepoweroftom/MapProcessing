
class ParticleTrails {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  ArrayList<Particle> landedParticles = new ArrayList<Particle>();

  ParticleTrails() {

  }

  void addParticle(PVector start, PVector end) {
    if (this.particles.size() < 1000) {
      this.particles.add(new Particle(start, end));
    }
  }

  void showLanded() {
    for (int i=0; i<landedParticles.size(); i++) {
      stroke(255, 100);
      strokeWeight(1);
      line(landedParticles.get(i).position.x, landedParticles.get(i).position.y, landedParticles.get(i).origin.x, landedParticles.get(i).origin.y);
    }
  }

  void move() {
    if (this.particles.size() > 0) {
      for (int i = 0; i<particles.size(); i++) {
        Particle p = this.particles.get(i);
        p.run();
        if (p.landed()) {
          this.landedParticles.add(p);
          this.landedParticles.remove(this.landedParticles.size()-1);
        }
      }
    }
  }
}