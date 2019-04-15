// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// A simple Particle Class
class Particle {
  
  PGraphics normalImage;
  PImage glowImage;
  
  float x;
  float y;
  float z;
  
  float pwidth;
  float pheight;
  float pz;
  
  float xspeed;
  float yspeed;
  float zspeed;
  float life;
  
  boolean ballform;
  boolean ismulticolor;
 
 float ry=0; 
 float rx=0;
 
 int destino_x;
 int destino_y;
  // Make the Particle
  Particle(float tempX, float tempY, float tempZ) {
    x = tempX;
    y = tempY;
    z = tempZ;
    pwidth = random(2,5);
    pheight =random(2,5);
    pz =random(2,5);
    println("Particula: "+x+" "+y+" "+z);
    xspeed = 0;
    yspeed = 0;
    zspeed = 0;
    life = 200;
    ismulticolor = false;
    rx= random(0,1);
  }
  
  void ir_a(int aux_x, int aux_y)
  {
    destino_x = aux_x;
    destino_y = aux_y;
    
  }
  
  // Move
  void run() {
    xspeed = (destino_x-x);
    yspeed = (destino_y-y);
    x = x + xspeed;
    y = y + yspeed;
    z = z + zspeed;
    ry +=.3;
    rx +=random(0,3)/10;
  }
  
  // Fall down
  void gravity() {
    yspeed -= 10;
  }
 
 
  // Stop movin
  void stop() {
    xspeed = 0;
    //yspeed = 0;
    y=y-random(10,100);
  }
  
  // Ready for deletion
  boolean finished() {
    // The Particle has a "life" variable which decreases.
    // When it reaches 0 the Particle can be removed from the ArrayList.
    life -= 0.1; 
    if (life < 0) return true;
    else return false;
  }
  
  // Show
  void display() {
    // Life is used to fade out the particle as well
      pushMatrix();
      lightSpecular(255, 0, 0);
      noStroke();
      lights();
      translate(x, y, z+10);     
      blendMode(BLEND);
      fill (250,250,250);
      sphere(4);
      fill (250,0,0,life-30);
      sphere(6);
      fill (250,0,0,life-50);
      sphere(8);
      filter(BLUR, 1);
      popMatrix();
     
    
    }
  }
