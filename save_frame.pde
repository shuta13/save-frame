boolean keyMode = false;

void setup() {
  size(800, 800, P2D);
  pixelDensity(displayDensity());
  background(255);
  smooth();
  noLoop();
}

void draw() {
  background(240);
  int centx = width/2;
  int centy = height/2;
  float x, y;

  for (int i = 0; i < 100; i++) {
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(10);
    float radius = 10;
    stroke(random(20), random(10), random(50), 80);
    
    int startangle = int(random(360));
    int endangle = 1440 + int(random(1440));
    int anglestep = 5 + int(random(3));

    for (float ang = startangle; ang <= endangle; ang += anglestep) {
      radiusNoise += 0.5;
      radius += 0.65;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centx + (thisRadius * cos(rad));
      y = centy + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
  if (keyMode) {
    saveFrame("frames/frame-####.png");
  }
}

void keyPressed() {
  redraw();
  if (key == 's') {
    keyMode = true;
  }
}