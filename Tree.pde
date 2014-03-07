class Tree {
  float theta;   
  float ratio;
  float x, y, len;
  float n1 = 0.0;
  float n2 = 0.0;
  float n3 = 0.0;
  float a1 = random(0.010, 0.015)/4;
  float a2 = random(0.015, 0.025)/4;
  float a3 = random(0.013, 0.023)/4;
  float maxAngle = random(20,45);

  Tree(float _x, float _y, float _len) {
    this.x = _x;
    this.y = _y;
    this.len = _len;
  }


  void draw() {
    n1 = n1 + a1;
    n2 = n2 + a2;
    n3 = n3 + a3;

    pushMatrix();
    this.ratio = 0.25 +  (0.6*noise(n3));


    // Let's pick an angle 0 to 90 degrees based on the mouse position
    float a = (noise(n1)) * maxAngle;
    // Convert it to radians
    this.theta = radians(a);
    // Start the tree from the bottom of the screen
    translate(x, y);

    float len2 = (this.len * 4*(0.5+noise(n1)));

    // Draw a line 120 pixels
    line(0, 0, 0, -len2);
    // Move to the end of that line
    translate(0, -len2);

    int level = 0;
    // Start the recursive branching!
    this.branch(len2, level);
    popMatrix();
  }

  void branch(float h, int level) {
    // Each branch will be 2/3rds the size of the previous one
    h *=  this.ratio;
    // h += noise(-5,5);

    // All recursive functions must have an exit condition!!!!
    // Here, ours is when the length of the branch is 2 pixels or less

    //  if (h > 1+ (32*(abs(mouseY) / (float)height))) {
    if ((h > 0.35+ (16*(noise(n2))))&&(level<18)) {
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      rotate(this.theta);   // Rotate by theta
      line(0, 0, 0, -h);  // Draw the branch
      translate(0, -h); // Move to the end of the branch
      branch(h, level+1);       // Ok, now call myself to draw two new branches!!
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix();
      rotate(-this.theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h, level+1);
      popMatrix();
    }
  }
}

