class Spawner
{
  private int maxParticle;
  private float probability, //Probabilidade de criar uma particula por segundo
                xMax, yMax, xMin, yMin;
  
  ParticleSystem system;
  
  ArrayList<ParticlePrototype> prototypes;
  
  public Spawner(ParticleSystem receiverSystem, int maxParticle, float probability, float xMin, float xMax, float yMin, float yMax)
  {
    this.system = receiverSystem;
    this.maxParticle = maxParticle;
    this.probability = probability;
    
    this.xMax = xMax;
    this.xMin = xMin;
    this.yMax = yMax;
    this.yMin = yMin; 
    
    prototypes = new ArrayList<ParticlePrototype>();
  }
  
  public void addPrototype(ParticlePrototype prototype)
  {
    prototypes.add(prototype);
  }
  
  public void run(float deltaT)
  {
    if(system.particleCount() >= maxParticle)
    {
      return;
    }
    
    float instantProbability = deltaT*probability; //Probabilidade de criar 1 partícula no instante que passou
    
    
    //Particulas que certamente serão geradas (%>100%)
    int nParticula = int(instantProbability);
    instantProbability -= nParticula;
    
    if(random(1) < instantProbability)  
    {
      nParticula += 1;
    }
    
    for(int i = 0; i<nParticula; i++)
    {
      float x = random(xMin, xMax);
      float y = random(yMin, yMax);
      PVector position = new PVector(x, y);
      
      int index = int(random(0, prototypes.size()));
      
      Particle p = prototypes.get(index).createParticle(position);
      
      system.addParticle(p);
    }
    
  }
}

interface ParticlePrototype
{
  public Particle createParticle(PVector position);
}
