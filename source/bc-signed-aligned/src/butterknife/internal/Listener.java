package butterknife.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.lang.model.element.Element;
import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import javax.lang.model.util.Types;

final class Listener
{
  private final String methodName;
  private final String ownerType;
  private final List<String> parameterTypes;
  private final String returnType;
  private final String setterName;
  private final String type;
  
  private Listener(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, List<String> paramList)
  {
    this.ownerType = paramString1;
    this.setterName = paramString2;
    this.type = paramString3;
    this.returnType = paramString4;
    this.methodName = paramString5;
    this.parameterTypes = paramList;
  }
  
  static Listener from(TypeElement paramTypeElement, Types paramTypes)
  {
    Object localObject1 = paramTypeElement.getEnclosedElements();
    if (((List)localObject1).size() != 1) {
      throw new IllegalArgumentException(paramTypeElement.getSimpleName() + " is not a single-method interface");
    }
    Object localObject2 = (ExecutableElement)((List)localObject1).get(0);
    String str1 = paramTypes.erasure(paramTypeElement.getEnclosingElement().asType()).toString();
    localObject1 = "set" + paramTypeElement.getSimpleName();
    String str2 = paramTypeElement.getQualifiedName().toString();
    String str3 = ((ExecutableElement)localObject2).getSimpleName().toString();
    String str4 = ((ExecutableElement)localObject2).getReturnType().toString();
    paramTypeElement = ((ExecutableElement)localObject2).getParameters();
    localObject2 = new ArrayList(paramTypeElement.size());
    Iterator localIterator = paramTypeElement.iterator();
    while (localIterator.hasNext())
    {
      paramTypes = ((VariableElement)localIterator.next()).asType().toString();
      paramTypeElement = paramTypes;
      if (paramTypes.startsWith("java.lang."))
      {
        paramTypeElement = paramTypes;
        if (!paramTypes.substring(10).contains(".")) {
          paramTypeElement = paramTypes.substring(10);
        }
      }
      ((List)localObject2).add(paramTypeElement);
    }
    return new Listener(str1, (String)localObject1, str2, str4, str3, (List)localObject2);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (this == paramObject) {}
    for (;;)
    {
      return bool;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
      {
        bool = false;
      }
      else
      {
        paramObject = (Listener)paramObject;
        if ((!this.methodName.equals(((Listener)paramObject).methodName)) || (!this.ownerType.equals(((Listener)paramObject).ownerType)) || (!this.parameterTypes.equals(((Listener)paramObject).parameterTypes)) || (!this.returnType.equals(((Listener)paramObject).returnType)) || (!this.setterName.equals(((Listener)paramObject).setterName)) || (!this.type.equals(((Listener)paramObject).type))) {
          bool = false;
        }
      }
    }
  }
  
  String getMethodName()
  {
    return this.methodName;
  }
  
  public String getOwnerType()
  {
    return this.ownerType;
  }
  
  List<String> getParameterTypes()
  {
    return this.parameterTypes;
  }
  
  String getReturnType()
  {
    return this.returnType;
  }
  
  public String getSetterName()
  {
    return this.setterName;
  }
  
  String getType()
  {
    return this.type;
  }
  
  public int hashCode()
  {
    return ((((this.ownerType.hashCode() * 31 + this.setterName.hashCode()) * 31 + this.type.hashCode()) * 31 + this.returnType.hashCode()) * 31 + this.methodName.hashCode()) * 31 + this.parameterTypes.hashCode();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/butterknife/internal/Listener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */