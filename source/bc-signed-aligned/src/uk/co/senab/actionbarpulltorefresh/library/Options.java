package uk.co.senab.actionbarpulltorefresh.library;

public final class Options
{
  private static final int DEFAULT_HEADER_LAYOUT = R.layout.default_header;
  private static final boolean DEFAULT_REFRESH_MINIMIZE = true;
  private static final int DEFAULT_REFRESH_MINIMIZED_DELAY = 1000;
  private static final boolean DEFAULT_REFRESH_ON_UP = false;
  private static final float DEFAULT_REFRESH_SCROLL_DISTANCE = 0.5F;
  EnvironmentDelegate environmentDelegate = null;
  int headerLayout = DEFAULT_HEADER_LAYOUT;
  HeaderTransformer headerTransformer = null;
  boolean refreshMinimize = true;
  int refreshMinimizeDelay = 1000;
  boolean refreshOnUp = false;
  float refreshScrollDistance = 0.5F;
  
  public static Builder create()
  {
    return new Builder();
  }
  
  public static class Builder
  {
    final Options mOptions = new Options();
    
    public Options build()
    {
      return this.mOptions;
    }
    
    public Builder environmentDelegate(EnvironmentDelegate paramEnvironmentDelegate)
    {
      this.mOptions.environmentDelegate = paramEnvironmentDelegate;
      return this;
    }
    
    public Builder headerLayout(int paramInt)
    {
      this.mOptions.headerLayout = paramInt;
      return this;
    }
    
    public Builder headerTransformer(HeaderTransformer paramHeaderTransformer)
    {
      this.mOptions.headerTransformer = paramHeaderTransformer;
      return this;
    }
    
    public Builder minimize()
    {
      return minimize(1000);
    }
    
    public Builder minimize(int paramInt)
    {
      this.mOptions.refreshMinimizeDelay = paramInt;
      this.mOptions.refreshMinimize = true;
      return this;
    }
    
    public Builder noMinimize()
    {
      this.mOptions.refreshMinimize = false;
      return this;
    }
    
    public Builder refreshOnUp(boolean paramBoolean)
    {
      this.mOptions.refreshOnUp = paramBoolean;
      return this;
    }
    
    public Builder scrollDistance(float paramFloat)
    {
      this.mOptions.refreshScrollDistance = paramFloat;
      return this;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/Options.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */