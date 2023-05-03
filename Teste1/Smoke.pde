class Smoke extends Particle implements FieldSensitive
{
  private static final float defaultLifespan = 10000;
  
  protected color cor;
  
  Smoke(PVector position)
  {
    super(position, new PVector(0,0), Smoke.defaultLifespan, 0.0001);  
    
    cor = 0;
  }
  
  Smoke(PVector position, float lifeSpan)
  {
    super(position, new PVector(0,0), lifeSpan, 0.0001);  
    
    cor = 0;
  }
  
  public void display()
  {
    PVector prevPos = prevPosition.getLast();
    stroke(cor, 5);
    strokeWeight(1);
    line(this.position.x, this.position.y, prevPos.x, prevPos.y);
    
   // ellipse(position.x, position.y, 100, 100);
  }
  
  public void senseField(PVector field)
  {
    insertForce(field);
  }
}
