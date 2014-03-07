/**
 * Multiple trees
 * 
 */


int numTrees =9;

Tree[] trees = new Tree[numTrees];

void setup() {
  size(1100, 800);
  for (int i=0; i< numTrees; i++) {
  //  trees[i]= new Tree(150+100*i, 600-100*(i%2), 40);
  trees[i]= new Tree(random(width), 700-random(100), 10+random(50));
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
