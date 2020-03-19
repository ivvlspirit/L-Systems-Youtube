/*

Created by Ivan Vlahov
u/spiritcs

If you want to share the things you made using this code,
please give me credit by sharing my YouTube channel or my
YouTube video linked below.

https://www.youtube.com/user/ivanvlahov922
https://www.youtube.com/watch?v=HpbVqEJ8rf4

*/

Lindenmayer lSystem;
LRunnable drawingRules;
int iterationNumber = 0;

void setup() {

	size(600, 600);
	background(0);


	// Here you write the drawing rules for your system

	drawingRules = new LRunnable() {
		public void run(Character c){

			// if you want to make the shape fit the screen
			// the length must usually be inversely proportional
			// to some number raised on the number of iterations (in this case it is 2)

			float length = (0.9*height/(pow(2, iterationNumber)));
			strokeWeight(3);

			// the drawing is done like in turtle graphic programming languages (LOGO for example)

			switch(c){
				case '0':
					line(0, 0, length/2, 0);
					break;
				case '1':
					line(0, 0, length, 0);
					translate(length, 0);
					break;

				case '[':
					pushMatrix();
					stroke(random(128,255), random(128,255), random(128,255));
					rotate(radians(-45));
					break;

				case ']':
					popMatrix();
					rotate(radians(45));
					break;
			}
		}
	};

	int startingX = width/2;			// starting X coordinate for drawing
	int startingY = (int)(0.9*height);	// starting Y coordinate for drawing
	int startingAngle = -90; 			// angle in DEGREES

	// Explanation for all the code below is on this link:
	// https://en.wikipedia.org/wiki/L-system#Example_2:_Fractal_(binary)_tree

	Character[] vars = {'0', '1'};		// array of variables
	Character[] consts = {'[', ']'};	// array of constants

	String axiom = "0";					// 0th iteration of the L-system
	
	HashMap<Character, String> iterationRules = new HashMap<Character, String>();
	iterationRules.put('1', "11");
	iterationRules.put('0', "1[0]0");


	// Variable definition
	lSystem = new Lindenmayer(vars, consts, axiom, iterationRules, drawingRules, startingX, startingY, startingAngle);


	// These three lines of code will have to go together if you want to draw
	// any iteration that is not the 0th iteration.
	lSystem.iterate(7);
	iterationNumber = lSystem.getIterationNumber();
	lSystem.drawSystem();
	
}
