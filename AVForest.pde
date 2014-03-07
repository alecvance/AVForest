/**
 * Multiple trees
 * 
 */


int numTrees = 3;
float startLen = 40;

Tree[] trees = new Tree[numTrees];

void setup() {
  size(1100, 800);
  float spacingW = width/numTrees;
  float spacingH = height/8;
  for (int i=0; i< numTrees; i++) {
    trees[i]= new Tree(spacingW/2+spacingW*i, spacingH*6-spacingH*(i%2), startLen);
  }
}

void draw() {

  // println(""+ n1 +" "+ n2 +" "+ n3);

 // ratio = 0.25 +  (0.6*noise(n3));

  background(0);
  frameRate(30);
  stroke(255);

  for (int i=0; i< numTrees; i++) {
    trees[i].draw();
  }
}
