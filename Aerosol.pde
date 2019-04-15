ArrayList particles;
PGraphics normalImage;
PImage glowImage;
PImage glowImage2;


void setup() {
  size(500,500,P3D);
  particles = new ArrayList(); 
  particles.add(new Particle(mouseX,mouseY,0));
  normalImage = createGraphics(width,height,P3D);
  normalImage.beginDraw();
  normalImage.smooth();
  normalImage.colorMode(RGB, 100);
  normalImage.stroke(255,0,0); 
  normalImage.strokeWeight(5); 
  normalImage.endDraw();
 
}

void draw() {

  background(0);
        for (int i = particles.size() - 1; i >= 0; i-- )    
    {
    Particle p = (Particle) particles.get(i);  
    p.ir_a(mouseX, mouseY);
    p.run();
    if(!p.finished())
    p.display();
    }

  glowImage = normalImage.get(0,0,normalImage.width,normalImage.height);
 // glowImage.resize(0,width);
  glowImage.filter(BLUR,3);
   blend(glowImage, 0, 0, glowImage.width,glowImage.height, 0,0,width,height, ADD);
   blend(glowImage, 0, 0, glowImage.width,glowImage.height, 0,0,width,height, ADD);
   blend(glowImage, 0, 0, glowImage.width,glowImage.height, 0,0,width,height, ADD);
  //glowImage.resize(0,width);
  image(glowImage,0,0);
  image(normalImage,0,0);
}

//void mouseDragged() {
//  normalImage.beginDraw();
//  normalImage.line(mouseX,mouseY,pmouseX,pmouseY);
//  normalImage.endDraw();
//}
void mousePressed() {
 }
 void mouseDragged() {
 
   normalImage.beginDraw();
   normalImage.line(mouseX,mouseY,pmouseX,pmouseY);
   normalImage.endDraw();
}
