//Initially meant to demonstrate how the solutions to linear equations form a plane - became an etch-a-sketch

PVector v1, v2;
ArrayList<PVector> points;
float w1, w2, h1, h2;

float m1 = 8;
float m2 = 8;

void setup() {
  size(800, 800);
  
  points = new ArrayList<PVector>();
  
  w1 = random(-width/2, width/2);
  h1 = random(-height/2, height/2);
  w2 = random(-width/2, width/2);
  h2 = random(-height/2, height/2);
}

void draw() {
  background(0);
  //v1 = new PVector(w1, h1);
  //v2 = new PVector(w2, h2);
  v1 = new PVector(-50, 0);
  v2 = new PVector(0, -50);

  vecAdd(v1, m1, v2, m2);
  
  for(PVector p : points){
    stroke(255,0,0);
    ellipse(p.x, p.y, 5, 5);
  }

  //m1-=0.5; //illustration of a plane
  //if(m1 <= -8.5){
  //  m1 = 8;
  //  m2-=0.5;
  //}
  //if(m2 <= -8.5){
  //  noLoop();
  //}
}

void vecAdd(PVector v1, float v1mult, PVector v2, float v2mult) {
  v1.mult(v1mult);
  v2.mult(v2mult);
  v2.add(v1);

  translate(width/2, height/2);
  stroke(0, 0, 255);
  fill(0, 0, 255);

  line(0, 0, v1.x, v1.y);
  pushMatrix();
  translate(v1.x, v1.y);
  rotate(atan2(v1.y, v1.x));
  triangle(0, 0, -10, 5, -10, -5);
  popMatrix();

  line(v1.x, v1.y, v2.x, v2.y);
  pushMatrix();
  translate(v2.x, v2.y);
  rotate(atan2(v2.y-v1.y, v2.x-v1.x));
  triangle(0, 0, -10, 5, -10, -5);
  popMatrix();

  stroke(255, 0, 0);
  fill(255, 0, 0);
  line(0, 0, v2.x, v2.y);
  pushMatrix();
  translate(v2.x, v2.y);
  rotate(atan2(v2.y, v2.x));
  triangle(0, 0, -10, 5, -10, -5);
  popMatrix();
  
  points.add(v2);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      m1+=0.1;
    } else if (keyCode == RIGHT) {
      m1-=0.1;
    } else if (keyCode == UP) {
      m2+=0.1;
    } else if (keyCode == DOWN) {
      m2-=0.1;
    }
  }
}
