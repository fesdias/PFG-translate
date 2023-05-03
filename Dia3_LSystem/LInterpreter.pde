import java.util.LinkedList;

class LInterpreter
{
  private float stepAngle;
  private float stepSize;
  
  public LInterpreter(float stepAngle, float stepSize)
  {
    this.stepAngle = stepAngle;
    this.stepSize = stepSize;
  }
  
  public void draw(String system, Float[] start)
  {
    LinkedList<Float[]> stateStack = new LinkedList<Float[]>();
    
    float currentAngle = start[2];
    float currentX = start[0];
    float currentY = start[1];

    
    for(int i = 0; i<system.length(); i++)
    {
      if(system.charAt(i) == 'F')
      {
        PVector step = PVector.fromAngle(currentAngle);
        step.setMag(stepSize);
        
        line(currentX, currentY, currentX+step.x, currentY+step.y);
        
        currentX += step.x;
        currentY += step.y;
        
      }
      else if(system.charAt(i) == '+')
      {
        currentAngle += stepAngle;
      }
      else if(system.charAt(i) == '-')
      {
        currentAngle -= stepAngle;
      }
      else if(system.charAt(i) == '[')
      {
        Float state[] = new Float[3];
        
        state[0] = currentX;
        state[1] = currentY;
        state[2] = currentAngle;
        
        stateStack.push(state);
      }
      else if(system.charAt(i) == ']')
      {
        Float state[] = stateStack.pop();
        
        currentX = state[0];
        currentY = state[1];
        currentAngle = state[2];
      }
      else if(system.charAt(i) == 'X')
      {
        //Do nothing
      }
      else
      {
        throw new IllegalArgumentException("Symbol"+system.charAt(i)+ "not recognized");
      }
    }
  }
  
}
