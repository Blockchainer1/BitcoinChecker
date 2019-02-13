package butterknife.internal;

import butterknife.InjectView;
import butterknife.OnCheckedChanged;
import butterknife.OnClick;
import butterknife.OnEditorAction;
import butterknife.OnFocusChanged;
import butterknife.OnItemClick;
import butterknife.OnItemLongClick;
import butterknife.OnLongClick;
import butterknife.Optional;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.Filer;
import javax.annotation.processing.Messager;
import javax.annotation.processing.ProcessingEnvironment;
import javax.annotation.processing.RoundEnvironment;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.Element;
import javax.lang.model.element.ElementKind;
import javax.lang.model.element.ExecutableElement;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.PackageElement;
import javax.lang.model.element.TypeElement;
import javax.lang.model.element.VariableElement;
import javax.lang.model.type.DeclaredType;
import javax.lang.model.type.TypeKind;
import javax.lang.model.type.TypeMirror;
import javax.lang.model.util.Elements;
import javax.lang.model.util.Types;
import javax.tools.Diagnostic.Kind;
import javax.tools.JavaFileObject;

public final class InjectViewProcessor
  extends AbstractProcessor
{
  private static final List<Class<? extends Annotation>> LISTENERS = Arrays.asList(new Class[] { OnCheckedChanged.class, OnClick.class, OnEditorAction.class, OnFocusChanged.class, OnItemClick.class, OnItemLongClick.class, OnLongClick.class });
  private static final Map<String, Listener> LISTENER_MAP = new LinkedHashMap();
  public static final String SUFFIX = "$$ViewInjector";
  static final String VIEW_TYPE = "android.view.View";
  private Elements elementUtils;
  private Filer filer;
  private Types typeUtils;
  
  private boolean containsTypeMirror(Collection<TypeMirror> paramCollection, TypeMirror paramTypeMirror)
  {
    paramTypeMirror = this.typeUtils.erasure(paramTypeMirror);
    Iterator localIterator = paramCollection.iterator();
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      paramCollection = (TypeMirror)localIterator.next();
    } while (!this.typeUtils.isSameType(paramCollection, paramTypeMirror));
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private void error(Element paramElement, String paramString, Object... paramVarArgs)
  {
    this.processingEnv.getMessager().printMessage(Diagnostic.Kind.ERROR, String.format(paramString, paramVarArgs), paramElement);
  }
  
  private void findAndParseListener(RoundEnvironment paramRoundEnvironment, Class<? extends Annotation> paramClass, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
  {
    paramRoundEnvironment = paramRoundEnvironment.getElementsAnnotatedWith(paramClass).iterator();
    while (paramRoundEnvironment.hasNext())
    {
      Element localElement = (Element)paramRoundEnvironment.next();
      try
      {
        parseListenerAnnotation(paramClass, localElement, paramMap, paramSet);
      }
      catch (Exception localException)
      {
        StringWriter localStringWriter = new StringWriter();
        localException.printStackTrace(new PrintWriter(localStringWriter));
        error(localElement, "Unable to generate view injector for @%s.\n\n%s", new Object[] { paramClass.getSimpleName(), localStringWriter.toString() });
      }
    }
  }
  
  private Map<TypeElement, ViewInjector> findAndParseTargets(RoundEnvironment paramRoundEnvironment)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    Object localObject1 = paramRoundEnvironment.getElementsAnnotatedWith(InjectView.class).iterator();
    Object localObject2;
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Element)((Iterator)localObject1).next();
      try
      {
        parseInjectView((Element)localObject2, localLinkedHashMap, localLinkedHashSet);
      }
      catch (Exception localException)
      {
        StringWriter localStringWriter = new StringWriter();
        localException.printStackTrace(new PrintWriter(localStringWriter));
        error((Element)localObject2, "Unable to generate view injector for @InjectView.\n\n%s", new Object[] { localStringWriter.toString() });
      }
    }
    localObject1 = LISTENERS.iterator();
    while (((Iterator)localObject1).hasNext()) {
      findAndParseListener(paramRoundEnvironment, (Class)((Iterator)localObject1).next(), localLinkedHashMap, localLinkedHashSet);
    }
    paramRoundEnvironment = localLinkedHashMap.entrySet().iterator();
    while (paramRoundEnvironment.hasNext())
    {
      localObject1 = (Map.Entry)paramRoundEnvironment.next();
      localObject2 = findParentFqcn((TypeElement)((Map.Entry)localObject1).getKey(), localLinkedHashSet);
      if (localObject2 != null) {
        ((ViewInjector)((Map.Entry)localObject1).getValue()).setParentInjector((String)localObject2 + "$$ViewInjector");
      }
    }
    return localLinkedHashMap;
  }
  
  private String findParentFqcn(TypeElement paramTypeElement, Set<TypeMirror> paramSet)
  {
    TypeMirror localTypeMirror = paramTypeElement.getSuperclass();
    if (localTypeMirror.getKind() == TypeKind.NONE) {}
    TypeElement localTypeElement;
    for (paramTypeElement = null;; paramTypeElement = paramTypeElement + "." + getClassName(localTypeElement, paramTypeElement))
    {
      return paramTypeElement;
      localTypeElement = (TypeElement)((DeclaredType)localTypeMirror).asElement();
      paramTypeElement = localTypeElement;
      if (!containsTypeMirror(paramSet, localTypeMirror)) {
        break;
      }
      paramTypeElement = getPackageName(localTypeElement);
    }
  }
  
  private static String getClassName(TypeElement paramTypeElement, String paramString)
  {
    int i = paramString.length();
    return paramTypeElement.getQualifiedName().toString().substring(i + 1).replace('.', '$');
  }
  
  private ViewInjector getOrCreateTargetClass(Map<TypeElement, ViewInjector> paramMap, TypeElement paramTypeElement)
  {
    Object localObject1 = (ViewInjector)paramMap.get(paramTypeElement);
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      localObject1 = paramTypeElement.getQualifiedName().toString();
      localObject2 = getPackageName(paramTypeElement);
      localObject2 = new ViewInjector((String)localObject2, getClassName(paramTypeElement, (String)localObject2) + "$$ViewInjector", (String)localObject1);
      paramMap.put(paramTypeElement, localObject2);
    }
    return (ViewInjector)localObject2;
  }
  
  private String getPackageName(TypeElement paramTypeElement)
  {
    return this.elementUtils.getPackageOf(paramTypeElement).getQualifiedName().toString();
  }
  
  private boolean isSubtypeOfType(TypeMirror paramTypeMirror, String paramString)
  {
    boolean bool1 = true;
    boolean bool2;
    if (paramString.equals(paramTypeMirror.toString())) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      if (!(paramTypeMirror instanceof DeclaredType))
      {
        bool2 = false;
      }
      else
      {
        paramTypeMirror = (DeclaredType)paramTypeMirror;
        List localList = paramTypeMirror.getTypeArguments();
        if (localList.size() > 0)
        {
          StringBuilder localStringBuilder = new StringBuilder(paramTypeMirror.asElement().toString());
          localStringBuilder.append('<');
          for (int i = 0; i < localList.size(); i++)
          {
            if (i > 0) {
              localStringBuilder.append(',');
            }
            localStringBuilder.append('?');
          }
          localStringBuilder.append('>');
          bool2 = bool1;
          if (localStringBuilder.toString().equals(paramString)) {}
        }
        else
        {
          paramTypeMirror = paramTypeMirror.asElement();
          if (!(paramTypeMirror instanceof TypeElement))
          {
            bool2 = false;
          }
          else
          {
            paramTypeMirror = (TypeElement)paramTypeMirror;
            bool2 = bool1;
            if (!isSubtypeOfType(paramTypeMirror.getSuperclass(), paramString))
            {
              paramTypeMirror = paramTypeMirror.getInterfaces().iterator();
              for (;;)
              {
                if (paramTypeMirror.hasNext()) {
                  if (isSubtypeOfType((TypeMirror)paramTypeMirror.next(), paramString))
                  {
                    bool2 = bool1;
                    break;
                  }
                }
              }
              bool2 = false;
            }
          }
        }
      }
    }
  }
  
  private boolean isValidForGeneratedCode(Class<? extends Annotation> paramClass, String paramString, Element paramElement)
  {
    boolean bool = false;
    TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
    Set localSet = paramElement.getModifiers();
    if ((localSet.contains(Modifier.PRIVATE)) || (localSet.contains(Modifier.STATIC)))
    {
      error(paramElement, "@%s %s must not be private or static. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    if (localTypeElement.getKind() != ElementKind.CLASS)
    {
      error(localTypeElement, "@%s %s may only be contained in classes. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    if (localTypeElement.getModifiers().contains(Modifier.PRIVATE))
    {
      error(localTypeElement, "@%s %s may not be contained in private classes. (%s.%s)", new Object[] { paramClass.getSimpleName(), paramString, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      bool = true;
    }
    return bool;
  }
  
  private void parseInjectView(Element paramElement, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
  {
    boolean bool = true;
    int i = 0;
    TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
    if (!isSubtypeOfType(paramElement.asType(), "android.view.View"))
    {
      error(paramElement, "@InjectView fields must extend from View (%s.%s).", new Object[] { localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      i = 1;
    }
    if ((i | isValidForGeneratedCode(InjectView.class, "fields", paramElement)) != 0) {
      return;
    }
    String str1 = paramElement.getSimpleName().toString();
    i = ((InjectView)paramElement.getAnnotation(InjectView.class)).value();
    String str2 = paramElement.asType().toString();
    if (paramElement.getAnnotation(Optional.class) == null) {}
    for (;;)
    {
      getOrCreateTargetClass(paramMap, localTypeElement).addField(i, str1, str2, bool);
      paramSet.add(this.typeUtils.erasure(localTypeElement.asType()));
      break;
      bool = false;
    }
  }
  
  private void parseListenerAnnotation(Class<? extends Annotation> paramClass, Element paramElement, Map<TypeElement, ViewInjector> paramMap, Set<TypeMirror> paramSet)
    throws Exception
  {
    if ((!(paramElement instanceof ExecutableElement)) || (paramElement.getKind() != ElementKind.METHOD)) {
      error(paramElement, "@%s annotation must be on a method.", new Object[] { paramClass.getSimpleName() });
    }
    for (;;)
    {
      return;
      ExecutableElement localExecutableElement = (ExecutableElement)paramElement;
      TypeElement localTypeElement = (TypeElement)paramElement.getEnclosingElement();
      Object localObject1 = paramElement.getAnnotation(paramClass);
      Object localObject2 = paramClass.getDeclaredMethod("value", new Class[0]);
      if ((localObject2 == null) || (((Method)localObject2).getReturnType() != int[].class))
      {
        error(paramElement, "@%s annotation lacks int[] value property. (%s.%s)", new Object[] { paramClass, localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
      }
      else
      {
        int[] arrayOfInt = (int[])((Method)localObject2).invoke(localObject1, new Object[0]);
        String str = localExecutableElement.getSimpleName().toString();
        if (paramElement.getAnnotation(Optional.class) == null) {}
        boolean bool2;
        int i;
        int j;
        int k;
        for (boolean bool1 = true;; bool1 = false)
        {
          bool2 = isValidForGeneratedCode(paramClass, "methods", paramElement);
          localObject2 = new LinkedHashSet(arrayOfInt.length);
          i = arrayOfInt.length;
          for (j = 0; j < i; j++)
          {
            k = arrayOfInt[j];
            if (!((Set)localObject2).add(Integer.valueOf(k)))
            {
              error(paramElement, "@%s annotation for method contains duplicate ID %d. (%s.%s)", new Object[] { paramClass.getSimpleName(), Integer.valueOf(k), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
              bool2 = true;
            }
          }
        }
        localObject2 = (ListenerClass)paramClass.getAnnotation(ListenerClass.class);
        if (localObject2 == null)
        {
          error(paramElement, "No @%s defined on @%s.", new Object[] { ListenerClass.class.getSimpleName(), paramClass.getSimpleName() });
        }
        else
        {
          Object localObject3 = ((ListenerClass)localObject2).value();
          localObject1 = (Listener)LISTENER_MAP.get(localObject3);
          localObject2 = localObject1;
          if (localObject1 == null) {}
          for (;;)
          {
            List localList1;
            BitSet localBitSet;
            List localList2;
            try
            {
              localObject2 = Listener.from(this.elementUtils.getTypeElement((CharSequence)localObject3), this.typeUtils);
              LISTENER_MAP.put(localObject3, localObject2);
              localList1 = localExecutableElement.getParameters();
              if (localList1.size() > ((Listener)localObject2).getParameterTypes().size())
              {
                error(paramElement, "@%s methods can have at most %s parameter(s). (%s.%s)", new Object[] { paramClass.getSimpleName(), Integer.valueOf(((Listener)localObject2).getParameterTypes().size()), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
                bool2 = true;
              }
              if (!localExecutableElement.getReturnType().toString().equals(((Listener)localObject2).getReturnType()))
              {
                error(paramElement, "@%s methods must have a '%s' return type. (%s.%s)", new Object[] { paramClass.getSimpleName(), ((Listener)localObject2).getReturnType(), localTypeElement.getQualifiedName(), paramElement.getSimpleName() });
                bool2 = true;
              }
              if (bool2) {
                break;
              }
              localObject1 = Parameter.NONE;
              if (localList1.isEmpty()) {
                break label1071;
              }
              localObject3 = new Parameter[localList1.size()];
              localBitSet = new BitSet(localList1.size());
              localList2 = ((Listener)localObject2).getParameterTypes();
              j = 0;
              localObject1 = localObject3;
              if (j >= localList1.size()) {
                break label1071;
              }
              localObject1 = ((VariableElement)localList1.get(j)).asType();
              i = 0;
              if (i >= localList2.size()) {
                break label784;
              }
              if (localBitSet.get(i))
              {
                i++;
                continue;
              }
            }
            catch (IllegalArgumentException paramElement)
            {
              error(this.elementUtils.getTypeElement(paramClass.getName()), "%s (%s on @%s)", new Object[] { paramElement.getMessage(), localObject3, paramClass.getName() });
            }
            if (isSubtypeOfType((TypeMirror)localObject1, (String)localList2.get(i)))
            {
              localObject3[j] = new Parameter(i, localObject1.toString());
              localBitSet.set(i);
              label784:
              if (localObject3[j] == null)
              {
                paramMap = new StringBuilder();
                paramMap.append("Unable to match @").append(paramClass.getSimpleName()).append(" method arguments. (").append(localTypeElement.getQualifiedName()).append('.').append(paramElement.getSimpleName()).append(')');
                j = 0;
                if (j < localObject3.length)
                {
                  paramClass = localObject3[j];
                  paramMap.append("\n\n  Parameter #").append(j + 1).append(": ").append(((VariableElement)localList1.get(j)).asType().toString()).append("\n    ");
                  if (paramClass == null) {
                    paramMap.append("did not match any listener parameters");
                  }
                  for (;;)
                  {
                    j++;
                    break;
                    paramMap.append("matched listener parameter #").append(paramClass.getListenerPosition() + 1).append(": ").append(paramClass.getType());
                  }
                }
                paramMap.append("\n\nMethods may have up to ").append(((Listener)localObject2).getParameterTypes().size()).append(" parameter(s):\n");
                paramElement = ((Listener)localObject2).getParameterTypes().iterator();
                while (paramElement.hasNext())
                {
                  paramClass = (String)paramElement.next();
                  paramMap.append("\n  ").append(paramClass);
                }
                paramMap.append("\n\nThese may be listed in any order but will be searched for from top to bottom.");
                error(localExecutableElement, paramMap.toString(), new Object[0]);
                break;
              }
              j++;
            }
          }
          label1071:
          paramMap = getOrCreateTargetClass(paramMap, localTypeElement);
          i = arrayOfInt.length;
          for (j = 0;; j++)
          {
            if (j >= i) {
              break label1167;
            }
            k = arrayOfInt[j];
            if (!paramMap.addMethod(k, (Listener)localObject2, str, Arrays.asList((Object[])localObject1), bool1))
            {
              error(paramElement, "Multiple @%s methods declared for ID %s in %s.", new Object[] { paramClass.getSimpleName(), Integer.valueOf(k), localTypeElement.getQualifiedName() });
              break;
            }
          }
          label1167:
          paramSet.add(this.typeUtils.erasure(localTypeElement.asType()));
        }
      }
    }
  }
  
  public Set<String> getSupportedAnnotationTypes()
  {
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    localLinkedHashSet.add(InjectView.class.getCanonicalName());
    Iterator localIterator = LISTENERS.iterator();
    while (localIterator.hasNext()) {
      localLinkedHashSet.add(((Class)localIterator.next()).getCanonicalName());
    }
    return localLinkedHashSet;
  }
  
  public SourceVersion getSupportedSourceVersion()
  {
    return SourceVersion.latestSupported();
  }
  
  public void init(ProcessingEnvironment paramProcessingEnvironment)
  {
    try
    {
      super.init(paramProcessingEnvironment);
      this.elementUtils = paramProcessingEnvironment.getElementUtils();
      this.typeUtils = paramProcessingEnvironment.getTypeUtils();
      this.filer = paramProcessingEnvironment.getFiler();
      return;
    }
    finally
    {
      paramProcessingEnvironment = finally;
      throw paramProcessingEnvironment;
    }
  }
  
  public boolean process(Set<? extends TypeElement> paramSet, RoundEnvironment paramRoundEnvironment)
  {
    paramSet = findAndParseTargets(paramRoundEnvironment).entrySet().iterator();
    while (paramSet.hasNext())
    {
      Object localObject = (Map.Entry)paramSet.next();
      paramRoundEnvironment = (TypeElement)((Map.Entry)localObject).getKey();
      ViewInjector localViewInjector = (ViewInjector)((Map.Entry)localObject).getValue();
      try
      {
        localObject = this.filer.createSourceFile(localViewInjector.getFqcn(), new Element[] { paramRoundEnvironment }).openWriter();
        ((Writer)localObject).write(localViewInjector.brewJava());
        ((Writer)localObject).flush();
        ((Writer)localObject).close();
      }
      catch (IOException localIOException)
      {
        error(paramRoundEnvironment, "Unable to write injector for type %s: %s", new Object[] { paramRoundEnvironment, localIOException.getMessage() });
      }
    }
    return true;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/butterknife/internal/InjectViewProcessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */