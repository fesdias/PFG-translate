class LSystem
{
  private ArrayList<String[]> rules;
  
  LSystem()
  {
    rules = new ArrayList<String[]>();
  }
  
  public void addRule(String before, String after)
  {
    String[] rule = new String[2];
    
    rule[0] = before;
    rule[1] = after;
    
    rules.add(rule);
  }
  
  public String generate(String axiom, int nIteration)
  {
    String result = axiom;
    
    for(int i = 0; i<nIteration; i++) //Conta as iterações
    {
      String before = result;
      
      result = new String("");
      
      
      for(int j = 0; j<before.length(); j++) //Percorre a string atual
      {
        boolean alterado = false;
        for(int k = 0; k< rules.size(); k++) //Percorre as regras
        {
          
          
          if(rules.get(k)[0].charAt(0) == before.charAt(j))
          {
            result += rules.get(k)[1];
            
            alterado = true;
            break;
          }
        }
        
        if(alterado == false)
        {
          result += before.charAt(j);
        }
        
      }
      
      
    }
    
    return result;
  }
  
}
