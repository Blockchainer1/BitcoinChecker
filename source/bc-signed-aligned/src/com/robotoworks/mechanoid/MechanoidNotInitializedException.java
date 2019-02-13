package com.robotoworks.mechanoid;

public class MechanoidNotInitializedException
  extends RuntimeException
{
  private static final long serialVersionUID = 1L;
  
  public MechanoidNotInitializedException()
  {
    super("Mechanoid.init(Context) must be called before mechanoid can be used");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/MechanoidNotInitializedException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */