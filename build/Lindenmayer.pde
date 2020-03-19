/*

Created by Ivan Vlahov
u/spiritcs

If you want to share the things you made using this code,
please give me credit by sharing my YouTube channel or my
YouTube video linked below.

https://www.youtube.com/user/ivanvlahov922
https://www.youtube.com/watch?v=HpbVqEJ8rf4

*/

public class Lindenmayer {

	public Character[] variables;
	public Character[] constants;
	public String axiom;
	public HashMap<Character, String> iterationRules;
	public LRunnable drawingRules;
	public int startingX;
	public int startingY;
	public int startingAngle;

	public int iterationNumber;
	public String newAxiom;


	// This is the constructor, obviously
	Lindenmayer(Character[] variables, Character[] constants, 
				String axiom, HashMap<Character, String> iterationRules,
				LRunnable drawingRules, int startingX, int startingY, int startingAngle){

		this.variables = variables;
		this.constants = constants;
		this.axiom = axiom;
		this.iterationRules = iterationRules;
		this.drawingRules = drawingRules;
		this.startingX = startingX;
		this.startingY = startingY;
		this.startingAngle = startingAngle;

		this.iterationNumber = 0;
		this.newAxiom = axiom;
	}


	// Creates a new String from the previous value of axiom
	// You can't iterate backwards!
	public void iterate(int n){
		for(int i=0; i<n; i++){
			this.iterationNumber++;
			this.newAxiom = "";

			for(int j=0; j<axiom.length(); j++){
				if(iterationRules.containsKey(axiom.charAt(j))){
					this.newAxiom+=iterationRules.get(axiom.charAt(j));
				}else{
					this.newAxiom+=axiom.charAt(j);
				}
			}
			axiom=newAxiom;
		}
	}


	// Runs the LDrawable's run method for each char of the "axiom" string
	public void drawSystem(){

		stroke(random(128,255), random(128,255), random(128,255));

		translate(startingX, startingY);
		rotate(radians(startingAngle));

		for(int i=0; i<newAxiom.length(); i++){
			drawingRules.run((Character)newAxiom.charAt(i));
		}

	}

	// I guess you understand what this method does
	public void printAxiom(){
		println(axiom);
	}

	// Returns the iterationNumber;
	public int getIterationNumber(){
		return this.iterationNumber;
	}
}