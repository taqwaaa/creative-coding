int[] intensity = {
  2,3,1,4,5,5,3,1,4,2,
  3,1,4,5,2,3,1,4,3,5,
  2,4,3,1,5,2,3,4,1,5,
  3,2,4,5,1,2,3,4,1,5,
  2,3,4,1,5,2,3,4,1,5,
  3,2,4,5,1,2,3,4,1,5,
  2,3,4,1,5,2,3,4,1,5,
  3,2,4,5,1,2,3,4,1,5,
  3,2,4,5,1,2,3,4,1,5,
  2,3,4,1,5,2,3,4,1,5
};

int[] duration = {
  4,7,2,9,12,12,5,1,8,6,
  4,3,10,14,2,6,2,11,5,17,
  4,6,3,1,15,5,8,12,3,9,
  6,3,7,18,1,4,7,10,2,13,
  5,6,8,2,19,4,9,11,1,16,
  5,3,9,14,2,4,7,13,1,20,
  5,4,8,3,17,6,8,10,2,15,
  5,3,12,18,1,4,9,13,2,16,
  6,5,7,11,2,3,8,14,1,19,
  4,7,2,9,12,12,5,1,8,6
};

void setup() {
  size(700, 700);
  noLoop();
  smooth(8);
}

color getBluePurple(int level) {
  switch(level) {
    case 1: return color(170, 200, 255);   
    case 2: return color(120, 150, 255);   
    case 3: return color(80, 100, 255);    
    case 4: return color(150, 80, 255);    
    case 5: return color(200, 60, 255);    
  }
  return color(0);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  float angleStep = TWO_PI / intensity.length;

  for (int i = 0; i < intensity.length; i++) {
    float ang = i * angleStep;
    float len = map(duration[i], 1, 20, 30, 250);
    color c = getBluePurple(intensity[i]);

    stroke(c);
    strokeWeight(3);

    float x = len * cos(ang);
    float y = len * sin(ang);

    line(0, 0, x, y);

    noStroke();
    fill(c);
    float dotSize = 5 + intensity[i] * 1.5;
    ellipse(x, y, dotSize, dotSize);
  }
}
