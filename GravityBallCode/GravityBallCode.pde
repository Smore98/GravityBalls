//declare variables
int balls = 30;
float[] x = new float [balls]; 
float[] y = new float[balls];
float[] velX = new float[balls];
float[] velY = new float[balls];
float[] diam = new float[balls];
float gravity;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for(int i = 0; i < balls; i++){
  x[i] = width/2;
  y[i] = height/2;
  diam[i] = 80;
  velX[i] = random(-5, 5);
  velY[i] = random(-5, 5);
  gravity = .5;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  textSize(30);
  for (int i = 0; i < balls; i++){

  //draw ball
  ellipse(x[i], y[i], diam[i], diam[i]);

  //add velocity to position
  velY[i] += gravity;
  x[i] += velX[i];
  y[i] += velY[i];
  //add acceleration


  //bounce ball if it hits walls
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  if (y[i] + diam[i]/2 >= height){
    y[i] = height - diam[i]/2; //when ball stops bouncing, it rolls on the surface
  }
  if (dist(mouseX,mouseY,x[i],y[i]) <= diam[i]/2){
    text("you're gonna have a bad time.", 50, 200);
  }
  }
}