package butterknife.internal;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class ViewInjector
{
  private final String className;
  private final String classPackage;
  private String parentInjector;
  private final String targetClass;
  private final Map<Integer, ViewInjection> viewIdMap = new LinkedHashMap();
  
  ViewInjector(String paramString1, String paramString2, String paramString3)
  {
    this.classPackage = paramString1;
    this.className = paramString2;
    this.targetClass = paramString3;
  }
  
  static void emitCastIfNeeded(StringBuilder paramStringBuilder, String paramString)
  {
    emitCastIfNeeded(paramStringBuilder, "android.view.View", paramString);
  }
  
  static void emitCastIfNeeded(StringBuilder paramStringBuilder, String paramString1, String paramString2)
  {
    if (!paramString1.equals(paramString2)) {
      paramStringBuilder.append('(').append(paramString2).append(") ");
    }
  }
  
  private void emitFieldBindings(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    paramViewInjection = paramViewInjection.getFieldBindings();
    if (paramViewInjection.isEmpty()) {}
    for (;;)
    {
      return;
      Iterator localIterator = paramViewInjection.iterator();
      while (localIterator.hasNext())
      {
        paramViewInjection = (FieldBinding)localIterator.next();
        paramStringBuilder.append("    target.").append(paramViewInjection.getName()).append(" = ");
        emitCastIfNeeded(paramStringBuilder, paramViewInjection.getType());
        paramStringBuilder.append("view;\n");
      }
    }
  }
  
  static void emitHumanDescription(StringBuilder paramStringBuilder, List<Binding> paramList)
  {
    int i;
    int j;
    switch (paramList.size())
    {
    default: 
      i = 0;
      j = paramList.size();
    case 1: 
      while (i < j)
      {
        Binding localBinding = (Binding)paramList.get(i);
        if (i != 0) {
          paramStringBuilder.append(", ");
        }
        if (i == j - 1) {
          paramStringBuilder.append("and ");
        }
        paramStringBuilder.append(localBinding.getDescription());
        i++;
        continue;
        paramStringBuilder.append(((Binding)paramList.get(0)).getDescription());
      }
    }
    for (;;)
    {
      return;
      paramStringBuilder.append(((Binding)paramList.get(0)).getDescription()).append(" and ").append(((Binding)paramList.get(1)).getDescription());
    }
  }
  
  private void emitInject(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("  public static void inject(Finder finder, final ").append(this.targetClass).append(" target, Object source) {\n");
    if (this.parentInjector != null) {
      paramStringBuilder.append("    ").append(this.parentInjector).append(".inject(finder, target, source);\n\n");
    }
    paramStringBuilder.append("    View view;\n");
    Iterator localIterator = this.viewIdMap.values().iterator();
    while (localIterator.hasNext()) {
      emitViewInjection(paramStringBuilder, (ViewInjection)localIterator.next());
    }
    paramStringBuilder.append("  }\n");
  }
  
  private void emitMethodBindings(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    Object localObject1 = paramViewInjection.getMethodBindings();
    if (((Map)localObject1).isEmpty()) {}
    for (;;)
    {
      return;
      Object localObject2 = "";
      boolean bool = paramViewInjection.getRequiredBindings().isEmpty();
      paramViewInjection = (ViewInjection)localObject2;
      if (bool)
      {
        paramStringBuilder.append("    if (view != null) {\n");
        paramViewInjection = "  ";
      }
      localObject2 = ((Map)localObject1).entrySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Object localObject3 = (Map.Entry)((Iterator)localObject2).next();
        localObject1 = (Listener)((Map.Entry)localObject3).getKey();
        localObject3 = (MethodBinding)((Map.Entry)localObject3).getValue();
        if (!"android.view.View".equals(((Listener)localObject1).getOwnerType())) {}
        for (int i = 1;; i = 0)
        {
          paramStringBuilder.append(paramViewInjection).append("    ");
          if (i != 0) {
            paramStringBuilder.append("((").append(((Listener)localObject1).getOwnerType()).append(") ");
          }
          paramStringBuilder.append("view");
          if (i != 0) {
            paramStringBuilder.append(')');
          }
          paramStringBuilder.append('.').append(((Listener)localObject1).getSetterName()).append("(\n");
          paramStringBuilder.append(paramViewInjection).append("      new ").append(((Listener)localObject1).getType()).append("() {\n");
          paramStringBuilder.append(paramViewInjection).append("        @Override public ").append(((Listener)localObject1).getReturnType()).append(' ').append(((Listener)localObject1).getMethodName()).append("(\n");
          localList = ((Listener)localObject1).getParameterTypes();
          i = 0;
          j = localList.size();
          while (i < j)
          {
            paramStringBuilder.append(paramViewInjection).append("          ").append((String)localList.get(i)).append(" p").append(i);
            if (i < j - 1) {
              paramStringBuilder.append(',');
            }
            paramStringBuilder.append('\n');
            i++;
          }
        }
        paramStringBuilder.append(paramViewInjection).append("        ) {\n");
        paramStringBuilder.append(paramViewInjection).append("          ");
        if (!"void".equals(((Listener)localObject1).getReturnType())) {
          paramStringBuilder.append("return ");
        }
        paramStringBuilder.append("target.").append(((MethodBinding)localObject3).getName()).append('(');
        localObject3 = ((MethodBinding)localObject3).getParameters();
        List localList = ((Listener)localObject1).getParameterTypes();
        i = 0;
        int j = ((List)localObject3).size();
        while (i < j)
        {
          localObject1 = (Parameter)((List)localObject3).get(i);
          int k = ((Parameter)localObject1).getListenerPosition();
          emitCastIfNeeded(paramStringBuilder, (String)localList.get(k), ((Parameter)localObject1).getType());
          paramStringBuilder.append('p').append(k);
          if (i < j - 1) {
            paramStringBuilder.append(", ");
          }
          i++;
        }
        paramStringBuilder.append(");\n");
        paramStringBuilder.append(paramViewInjection).append("        }\n");
        paramStringBuilder.append(paramViewInjection).append("      });\n");
      }
      if (bool) {
        paramStringBuilder.append("    }\n");
      }
    }
  }
  
  private void emitReset(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append("  public static void reset(").append(this.targetClass).append(" target) {\n");
    if (this.parentInjector != null) {
      paramStringBuilder.append("    ").append(this.parentInjector).append(".reset(target);\n\n");
    }
    Iterator localIterator1 = this.viewIdMap.values().iterator();
    while (localIterator1.hasNext())
    {
      Iterator localIterator2 = ((ViewInjection)localIterator1.next()).getFieldBindings().iterator();
      while (localIterator2.hasNext())
      {
        FieldBinding localFieldBinding = (FieldBinding)localIterator2.next();
        paramStringBuilder.append("    target.").append(localFieldBinding.getName()).append(" = null;\n");
      }
    }
    paramStringBuilder.append("  }\n");
  }
  
  private void emitViewInjection(StringBuilder paramStringBuilder, ViewInjection paramViewInjection)
  {
    paramStringBuilder.append("    view = finder.findById(source, ").append(paramViewInjection.getId()).append(");\n");
    List localList = paramViewInjection.getRequiredBindings();
    if (!localList.isEmpty())
    {
      paramStringBuilder.append("    if (view == null) {\n").append("      throw new IllegalStateException(\"Required view with id '").append(paramViewInjection.getId()).append("' for ");
      emitHumanDescription(paramStringBuilder, localList);
      paramStringBuilder.append(" was not found. If this view is optional add '@Optional' annotation.\");\n").append("    }\n");
    }
    emitFieldBindings(paramStringBuilder, paramViewInjection);
    emitMethodBindings(paramStringBuilder, paramViewInjection);
  }
  
  private ViewInjection getOrCreateViewBinding(int paramInt)
  {
    ViewInjection localViewInjection1 = (ViewInjection)this.viewIdMap.get(Integer.valueOf(paramInt));
    ViewInjection localViewInjection2 = localViewInjection1;
    if (localViewInjection1 == null)
    {
      localViewInjection2 = new ViewInjection(paramInt);
      this.viewIdMap.put(Integer.valueOf(paramInt), localViewInjection2);
    }
    return localViewInjection2;
  }
  
  void addField(int paramInt, String paramString1, String paramString2, boolean paramBoolean)
  {
    getOrCreateViewBinding(paramInt).addFieldBinding(new FieldBinding(paramString1, paramString2, paramBoolean));
  }
  
  boolean addMethod(int paramInt, Listener paramListener, String paramString, List<Parameter> paramList, boolean paramBoolean)
  {
    try
    {
      ViewInjection localViewInjection = getOrCreateViewBinding(paramInt);
      MethodBinding localMethodBinding = new butterknife/internal/MethodBinding;
      localMethodBinding.<init>(paramString, paramList, paramBoolean);
      localViewInjection.addMethodBinding(paramListener, localMethodBinding);
      paramBoolean = true;
    }
    catch (IllegalStateException paramListener)
    {
      for (;;)
      {
        paramBoolean = false;
      }
    }
    return paramBoolean;
  }
  
  String brewJava()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("// Generated code from Butter Knife. Do not modify!\n");
    localStringBuilder.append("package ").append(this.classPackage).append(";\n\n");
    localStringBuilder.append("import android.view.View;\n");
    localStringBuilder.append("import butterknife.ButterKnife.Finder;\n\n");
    localStringBuilder.append("public class ").append(this.className).append(" {\n");
    emitInject(localStringBuilder);
    localStringBuilder.append('\n');
    emitReset(localStringBuilder);
    localStringBuilder.append("}\n");
    return localStringBuilder.toString();
  }
  
  String getFqcn()
  {
    return this.classPackage + "." + this.className;
  }
  
  void setParentInjector(String paramString)
  {
    this.parentInjector = paramString;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/butterknife/internal/ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */