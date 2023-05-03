LInterpreter interpreter, interpreter2;
LSystem plantSystem, plantSystem2;

int nIteration;
String expression, expression2;

void setup()
{
  size(360, 640);
  
  interpreter = new LInterpreter(radians(25), 2);
  interpreter2 = new LInterpreter(radians(-25), 5);
  
  plantSystem = new LSystem();
  plantSystem.addRule("X", "F+[[X]-X]-F[-FX]+X");
  plantSystem.addRule("F", "FF");
  expression = "X";
  
  plantSystem2 = new LSystem();
  plantSystem2.addRule("F", "FF+[+F-F-F]-[-F+F+F]");
  expression2 = "F";
  
  nIteration = 1;
  background(250, 220, 172);
}

boolean iniciou = false;

void draw()
{ 
  if(mousePressed || iniciou)
  {
    iniciou = true;
    Float start[] = {360.0,640.0, radians(-120)};
     
    
    
    
    stroke(83, 141, 26);
    
    expression = plantSystem.generate(expression, 1);
    interpreter.draw(expression, start);
    
    //expression2 = plantSystem2.generate(expression2, 1);
    //interpreter2.draw(expression2, start);
    
    nIteration += 1;
    
    delay(500);
  }
}
