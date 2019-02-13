package butterknife.internal;

final class FieldBinding
  implements Binding
{
  private final String name;
  private final boolean required;
  private final String type;
  
  FieldBinding(String paramString1, String paramString2, boolean paramBoolean)
  {
    this.name = paramString1;
    this.type = paramString2;
    this.required = paramBoolean;
  }
  
  public String getDescription()
  {
    return "field '" + this.name + "'";
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public String getType()
  {
    return this.type;
  }
  
  public boolean isRequired()
  {
    return this.required;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/butterknife/internal/FieldBinding.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */