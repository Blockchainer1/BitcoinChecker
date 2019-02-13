package uk.co.senab.actionbarpulltorefresh.library;

import android.content.Context;
import android.util.Log;
import android.view.View;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.AbsListViewDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ScrollYDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.WebViewDelegate;

class InstanceCreationUtils
{
  private static final HashMap<Class, Class> BUILT_IN_DELEGATES;
  private static final String LOG_TAG = "InstanceCreationUtils";
  private static final Class<?>[] TRANSFORMER_CONSTRUCTOR_SIGNATURE;
  private static final Class<?>[] VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE = new Class[0];
  
  static
  {
    TRANSFORMER_CONSTRUCTOR_SIGNATURE = new Class[0];
    BUILT_IN_DELEGATES = new HashMap();
    addBuiltinDelegates(AbsListViewDelegate.SUPPORTED_VIEW_CLASSES, AbsListViewDelegate.class);
    addBuiltinDelegates(ScrollYDelegate.SUPPORTED_VIEW_CLASSES, ScrollYDelegate.class);
    addBuiltinDelegates(WebViewDelegate.SUPPORTED_VIEW_CLASSES, WebViewDelegate.class);
  }
  
  private static void addBuiltinDelegates(Class[] paramArrayOfClass, Class<?> paramClass)
  {
    int i = 0;
    int j = paramArrayOfClass.length;
    while (i < j)
    {
      BUILT_IN_DELEGATES.put(paramArrayOfClass[i], paramClass);
      i++;
    }
  }
  
  static ViewDelegate getBuiltInViewDelegate(View paramView)
  {
    Iterator localIterator = BUILT_IN_DELEGATES.entrySet().iterator();
    Map.Entry localEntry;
    do
    {
      if (!localIterator.hasNext()) {
        break;
      }
      localEntry = (Map.Entry)localIterator.next();
    } while (!((Class)localEntry.getKey()).isInstance(paramView));
    for (paramView = (ViewDelegate)newInstance(paramView.getContext(), (Class)localEntry.getValue(), VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE, null);; paramView = null) {
      return paramView;
    }
  }
  
  static <T> T instantiateTransformer(Context paramContext, String paramString)
  {
    try
    {
      paramContext = newInstance(paramContext, paramContext.getClassLoader().loadClass(paramString), TRANSFORMER_CONSTRUCTOR_SIGNATURE, new Object[0]);
      return paramContext;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        Log.w("InstanceCreationUtils", "Cannot instantiate class: " + paramString, paramContext);
        paramContext = null;
      }
    }
  }
  
  static <T> T instantiateViewDelegate(Context paramContext, String paramString)
  {
    try
    {
      paramContext = newInstance(paramContext, paramContext.getClassLoader().loadClass(paramString), VIEW_DELEGATE_CONSTRUCTOR_SIGNATURE, new Object[0]);
      return paramContext;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        Log.w("InstanceCreationUtils", "Cannot instantiate class: " + paramString, paramContext);
        paramContext = null;
      }
    }
  }
  
  private static <T> T newInstance(Context paramContext, Class paramClass, Class[] paramArrayOfClass, Object... paramVarArgs)
  {
    try
    {
      paramContext = paramClass.getConstructor(paramArrayOfClass).newInstance(paramVarArgs);
      return paramContext;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        Log.w("InstanceCreationUtils", "Cannot instantiate class: " + paramClass.getName(), paramContext);
        paramContext = null;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/InstanceCreationUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */