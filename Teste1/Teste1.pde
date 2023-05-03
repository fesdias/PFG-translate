ParticleSystem ps, smokeSystem, lightSystem, flowerSystem;
Wind wind;
PerlinNoiseField perlinField;

int maxX = 360;
int maxY = 640;
float time = 0;

void setup()
{
  size(360, 640);
  
  ps = new ParticleSystem();  
  smokeSystem = new ParticleSystem();
  lightSystem = new ParticleSystem();
  flowerSystem = new ParticleSystem();
  wind = new Wind(5);
  perlinField = new PerlinNoiseField(0, 360, 0, 640);
  
  for(int i = 0; i<2300; i++)
  {
    Smoke smoke = new Smoke(new PVector(random(360), random(640)));
    smokeSystem.addParticle(smoke);
    
    //SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
    //light.limitRegion(0, maxX, 0, maxY);
    //lightSystem.addParticle(light);
    
    
  }
  
  for(int i = 0; i<20; i++)
  {
    EllipticalFlower flower = new EllipticalFlower(new PVector(random(360), random(640)));
    flowerSystem.addParticle(flower);
    
  }
  
  for(int i = 0; i<100; i++)
  {
    SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
    light.limitRegion(0, maxX, 0, maxY);
    lightSystem.addParticle(light);
  }

  //background(255,255,255);
  background(0,0,0);
  //background(250, 220, 172);
  
}

void draw()
{
  
  //clear();
  //background(250, 220, 172);
  background(0,0,0);
  
  float deltaT = 1.0/frameRate;
  
  WaterDrop drop = new WaterDrop(new PVector(random(0,maxX),0));
  
  
  ps.addParticle(drop);
  
  smokeSystem.insertField(perlinField);
  lightSystem.insertField(perlinField);
  
  PVector gravity = new PVector(0,9.8);
  PVector windForce = wind.getWindForce(deltaT);
  
  ps.insertForce(gravity);
  //ps.insertForce(windForce);
  //smokeSystem.insertForce(windForce);
  
  
  //smokeSystem.run(deltaT);
  lightSystem.run(deltaT*20);
  //flowerSystem.run(deltaT);
  //ps.run(deltaT);
  
  time += deltaT;
  
  if(time>=10)
  {
      for(int i = 0; i<100; i++)
      {
        
        SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
        light.limitRegion(0, maxX, 0, maxY);
        lightSystem.addParticle(light);
        
        
      }
      
      time = 0;
  }
}
