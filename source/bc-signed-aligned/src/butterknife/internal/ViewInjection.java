package butterknife.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

final class ViewInjection
{
  private final Set<FieldBinding> fieldBindings = new LinkedHashSet();
  private final int id;
  private final Map<Listener, MethodBinding> methodBindings = new LinkedHashMap();
  
  ViewInjection(int paramInt)
  {
    this.id = paramInt;
  }
  
  public void addFieldBinding(FieldBinding paramFieldBinding)
  {
    this.fieldBindings.add(paramFieldBinding);
  }
  
  public void addMethodBinding(Listener paramListener, MethodBinding paramMethodBinding)
  {
    MethodBinding localMethodBinding = (MethodBinding)this.methodBindings.get(paramListener);
    if (localMethodBinding != null) {
      throw new IllegalStateException("View " + this.id + " already has method binding for " + paramListener.getType() + " on " + localMethodBinding.getName());
    }
    this.methodBindings.put(paramListener, paramMethodBinding);
  }
  
  public Collection<FieldBinding> getFieldBindings()
  {
    return this.fieldBindings;
  }
  
  public int getId()
  {
    return this.id;
  }
  
  public Map<Listener, MethodBinding> getMethodBindings()
  {
    return Collections.unmodifiableMap(new LinkedHashMap(this.methodBindings));
  }
  
  public List<Binding> getRequiredBindings()
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = this.fieldBindings.iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (FieldBinding)((Iterator)localObject1).next();
      if (((FieldBinding)localObject2).isRequired()) {
        localArrayList.add(localObject2);
      }
    }
    Object localObject2 = this.methodBindings.values().iterator();
    while (((Iterator)localObject2).hasNext())
    {
      localObject1 = (MethodBinding)((Iterator)localObject2).next();
      if (((MethodBinding)localObject1).isRequired()) {
        localArrayList.add(localObject1);
      }
    }
    return localArrayList;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/butterknife/internal/ViewInjection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */