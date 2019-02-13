package android.support.v7.internal.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.view.ActionProvider;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.MenuItemImpl;
import android.support.v7.internal.view.menu.MenuItemWrapperICS;
import android.util.AttributeSet;
import android.util.Log;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class SupportMenuInflater
  extends MenuInflater
{
  private static final Class<?>[] ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE = ACTION_VIEW_CONSTRUCTOR_SIGNATURE;
  private static final Class<?>[] ACTION_VIEW_CONSTRUCTOR_SIGNATURE = { Context.class };
  private static final String LOG_TAG = "SupportMenuInflater";
  private static final int NO_ID = 0;
  private static final String XML_GROUP = "group";
  private static final String XML_ITEM = "item";
  private static final String XML_MENU = "menu";
  private final Object[] mActionProviderConstructorArguments;
  private final Object[] mActionViewConstructorArguments;
  private Context mContext;
  private Object mRealOwner;
  
  public SupportMenuInflater(Context paramContext)
  {
    super(paramContext);
    this.mContext = paramContext;
    this.mRealOwner = paramContext;
    this.mActionViewConstructorArguments = new Object[] { paramContext };
    this.mActionProviderConstructorArguments = this.mActionViewConstructorArguments;
  }
  
  private void parseMenu(XmlPullParser paramXmlPullParser, AttributeSet paramAttributeSet, Menu paramMenu)
    throws XmlPullParserException, IOException
  {
    MenuState localMenuState = new MenuState(paramMenu);
    int i = paramXmlPullParser.getEventType();
    int j = 0;
    Menu localMenu = null;
    label55:
    int k;
    int m;
    if (i == 2)
    {
      paramMenu = paramXmlPullParser.getName();
      if (paramMenu.equals("menu"))
      {
        i = paramXmlPullParser.next();
        k = 0;
        m = i;
        label62:
        if (k != 0) {
          return;
        }
      }
    }
    int n;
    switch (m)
    {
    default: 
      paramMenu = localMenu;
      n = k;
      i = j;
    case 2: 
    case 3: 
      for (;;)
      {
        m = paramXmlPullParser.next();
        j = i;
        k = n;
        localMenu = paramMenu;
        break label62;
        throw new RuntimeException("Expecting menu, got " + paramMenu);
        k = paramXmlPullParser.next();
        i = k;
        if (k != 1) {
          break;
        }
        i = k;
        break label55;
        i = j;
        n = k;
        paramMenu = localMenu;
        if (j == 0)
        {
          paramMenu = paramXmlPullParser.getName();
          if (paramMenu.equals("group"))
          {
            localMenuState.readGroup(paramAttributeSet);
            i = j;
            n = k;
            paramMenu = localMenu;
          }
          else if (paramMenu.equals("item"))
          {
            localMenuState.readItem(paramAttributeSet);
            i = j;
            n = k;
            paramMenu = localMenu;
          }
          else if (paramMenu.equals("menu"))
          {
            parseMenu(paramXmlPullParser, paramAttributeSet, localMenuState.addSubMenuItem());
            i = j;
            n = k;
            paramMenu = localMenu;
          }
          else
          {
            i = 1;
            n = k;
            continue;
            String str = paramXmlPullParser.getName();
            if ((j != 0) && (str.equals(localMenu)))
            {
              i = 0;
              paramMenu = null;
              n = k;
            }
            else if (str.equals("group"))
            {
              localMenuState.resetGroup();
              i = j;
              n = k;
              paramMenu = localMenu;
            }
            else if (str.equals("item"))
            {
              i = j;
              n = k;
              paramMenu = localMenu;
              if (!localMenuState.hasAddedItem()) {
                if ((localMenuState.itemActionProvider != null) && (localMenuState.itemActionProvider.hasSubMenu()))
                {
                  localMenuState.addSubMenuItem();
                  i = j;
                  n = k;
                  paramMenu = localMenu;
                }
                else
                {
                  localMenuState.addItem();
                  i = j;
                  n = k;
                  paramMenu = localMenu;
                }
              }
            }
            else
            {
              i = j;
              n = k;
              paramMenu = localMenu;
              if (str.equals("menu"))
              {
                n = 1;
                i = j;
                paramMenu = localMenu;
              }
            }
          }
        }
      }
    }
    throw new RuntimeException("Unexpected end of document");
  }
  
  /* Error */
  public void inflate(int paramInt, Menu paramMenu)
  {
    // Byte code:
    //   0: aload_2
    //   1: instanceof 157
    //   4: ifne +10 -> 14
    //   7: aload_0
    //   8: iload_1
    //   9: aload_2
    //   10: invokespecial 159	android/view/MenuInflater:inflate	(ILandroid/view/Menu;)V
    //   13: return
    //   14: aconst_null
    //   15: astore_3
    //   16: aconst_null
    //   17: astore 4
    //   19: aconst_null
    //   20: astore 5
    //   22: aload_0
    //   23: getfield 54	android/support/v7/internal/view/SupportMenuInflater:mContext	Landroid/content/Context;
    //   26: invokevirtual 163	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   29: iload_1
    //   30: invokevirtual 169	android/content/res/Resources:getLayout	(I)Landroid/content/res/XmlResourceParser;
    //   33: astore 6
    //   35: aload 6
    //   37: astore 5
    //   39: aload 6
    //   41: astore_3
    //   42: aload 6
    //   44: astore 4
    //   46: aload_0
    //   47: aload 6
    //   49: aload 6
    //   51: invokestatic 175	android/util/Xml:asAttributeSet	(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;
    //   54: aload_2
    //   55: invokespecial 131	android/support/v7/internal/view/SupportMenuInflater:parseMenu	(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/view/Menu;)V
    //   58: aload 6
    //   60: ifnull -47 -> 13
    //   63: aload 6
    //   65: invokeinterface 180 1 0
    //   70: goto -57 -> 13
    //   73: astore 4
    //   75: aload 5
    //   77: astore_3
    //   78: new 182	android/view/InflateException
    //   81: astore_2
    //   82: aload 5
    //   84: astore_3
    //   85: aload_2
    //   86: ldc -72
    //   88: aload 4
    //   90: invokespecial 187	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   93: aload 5
    //   95: astore_3
    //   96: aload_2
    //   97: athrow
    //   98: astore_2
    //   99: aload_3
    //   100: ifnull +9 -> 109
    //   103: aload_3
    //   104: invokeinterface 180 1 0
    //   109: aload_2
    //   110: athrow
    //   111: astore_2
    //   112: aload 4
    //   114: astore_3
    //   115: new 182	android/view/InflateException
    //   118: astore 5
    //   120: aload 4
    //   122: astore_3
    //   123: aload 5
    //   125: ldc -72
    //   127: aload_2
    //   128: invokespecial 187	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   131: aload 4
    //   133: astore_3
    //   134: aload 5
    //   136: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	137	0	this	SupportMenuInflater
    //   0	137	1	paramInt	int
    //   0	137	2	paramMenu	Menu
    //   15	119	3	localObject1	Object
    //   17	28	4	localObject2	Object
    //   73	59	4	localXmlPullParserException	XmlPullParserException
    //   20	115	5	localObject3	Object
    //   33	31	6	localXmlResourceParser	android.content.res.XmlResourceParser
    // Exception table:
    //   from	to	target	type
    //   22	35	73	org/xmlpull/v1/XmlPullParserException
    //   46	58	73	org/xmlpull/v1/XmlPullParserException
    //   22	35	98	finally
    //   46	58	98	finally
    //   78	82	98	finally
    //   85	93	98	finally
    //   96	98	98	finally
    //   115	120	98	finally
    //   123	131	98	finally
    //   134	137	98	finally
    //   22	35	111	java/io/IOException
    //   46	58	111	java/io/IOException
  }
  
  private static class InflatedOnMenuItemClickListener
    implements MenuItem.OnMenuItemClickListener
  {
    private static final Class<?>[] PARAM_TYPES = { MenuItem.class };
    private Method mMethod;
    private Object mRealOwner;
    
    public InflatedOnMenuItemClickListener(Object paramObject, String paramString)
    {
      this.mRealOwner = paramObject;
      Class localClass = paramObject.getClass();
      try
      {
        this.mMethod = localClass.getMethod(paramString, PARAM_TYPES);
        return;
      }
      catch (Exception paramObject)
      {
        paramString = new InflateException("Couldn't resolve menu item onClick handler " + paramString + " in class " + localClass.getName());
        paramString.initCause((Throwable)paramObject);
        throw paramString;
      }
    }
    
    /* Error */
    public boolean onMenuItemClick(MenuItem paramMenuItem)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_2
      //   2: aload_0
      //   3: getfield 43	android/support/v7/internal/view/SupportMenuInflater$InflatedOnMenuItemClickListener:mMethod	Ljava/lang/reflect/Method;
      //   6: invokevirtual 77	java/lang/reflect/Method:getReturnType	()Ljava/lang/Class;
      //   9: getstatic 83	java/lang/Boolean:TYPE	Ljava/lang/Class;
      //   12: if_acmpne +31 -> 43
      //   15: aload_0
      //   16: getfield 43	android/support/v7/internal/view/SupportMenuInflater$InflatedOnMenuItemClickListener:mMethod	Ljava/lang/reflect/Method;
      //   19: aload_0
      //   20: getfield 33	android/support/v7/internal/view/SupportMenuInflater$InflatedOnMenuItemClickListener:mRealOwner	Ljava/lang/Object;
      //   23: iconst_1
      //   24: anewarray 4	java/lang/Object
      //   27: dup
      //   28: iconst_0
      //   29: aload_1
      //   30: aastore
      //   31: invokevirtual 87	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   34: checkcast 79	java/lang/Boolean
      //   37: invokevirtual 91	java/lang/Boolean:booleanValue	()Z
      //   40: istore_2
      //   41: iload_2
      //   42: ireturn
      //   43: aload_0
      //   44: getfield 43	android/support/v7/internal/view/SupportMenuInflater$InflatedOnMenuItemClickListener:mMethod	Ljava/lang/reflect/Method;
      //   47: aload_0
      //   48: getfield 33	android/support/v7/internal/view/SupportMenuInflater$InflatedOnMenuItemClickListener:mRealOwner	Ljava/lang/Object;
      //   51: iconst_1
      //   52: anewarray 4	java/lang/Object
      //   55: dup
      //   56: iconst_0
      //   57: aload_1
      //   58: aastore
      //   59: invokevirtual 87	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   62: pop
      //   63: goto -22 -> 41
      //   66: astore_1
      //   67: new 93	java/lang/RuntimeException
      //   70: dup
      //   71: aload_1
      //   72: invokespecial 96	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	InflatedOnMenuItemClickListener
      //   0	76	1	paramMenuItem	MenuItem
      //   1	41	2	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   2	41	66	java/lang/Exception
      //   43	63	66	java/lang/Exception
    }
  }
  
  private class MenuState
  {
    private static final int defaultGroupId = 0;
    private static final int defaultItemCategory = 0;
    private static final int defaultItemCheckable = 0;
    private static final boolean defaultItemChecked = false;
    private static final boolean defaultItemEnabled = true;
    private static final int defaultItemId = 0;
    private static final int defaultItemOrder = 0;
    private static final boolean defaultItemVisible = true;
    private int groupCategory;
    private int groupCheckable;
    private boolean groupEnabled;
    private int groupId;
    private int groupOrder;
    private boolean groupVisible;
    private ActionProvider itemActionProvider;
    private String itemActionProviderClassName;
    private String itemActionViewClassName;
    private int itemActionViewLayout;
    private boolean itemAdded;
    private char itemAlphabeticShortcut;
    private int itemCategoryOrder;
    private int itemCheckable;
    private boolean itemChecked;
    private boolean itemEnabled;
    private int itemIconResId;
    private int itemId;
    private String itemListenerMethodName;
    private char itemNumericShortcut;
    private int itemShowAsAction;
    private CharSequence itemTitle;
    private CharSequence itemTitleCondensed;
    private boolean itemVisible;
    private Menu menu;
    
    public MenuState(Menu paramMenu)
    {
      this.menu = paramMenu;
      resetGroup();
    }
    
    private char getShortcut(String paramString)
    {
      char c1 = '\000';
      if (paramString == null) {}
      for (char c2 = c1;; c2 = c1)
      {
        return c2;
        c1 = paramString.charAt(0);
      }
    }
    
    private <T> T newInstance(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
    {
      try
      {
        paramArrayOfClass = SupportMenuInflater.this.mContext.getClassLoader().loadClass(paramString).getConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
        paramString = paramArrayOfClass;
      }
      catch (Exception paramArrayOfClass)
      {
        for (;;)
        {
          Log.w("SupportMenuInflater", "Cannot instantiate class: " + paramString, paramArrayOfClass);
          paramString = null;
        }
      }
      return paramString;
    }
    
    private void setItem(MenuItem paramMenuItem)
    {
      Object localObject = paramMenuItem.setChecked(this.itemChecked).setVisible(this.itemVisible).setEnabled(this.itemEnabled);
      if (this.itemCheckable >= 1) {}
      for (boolean bool = true;; bool = false)
      {
        ((MenuItem)localObject).setCheckable(bool).setTitleCondensed(this.itemTitleCondensed).setIcon(this.itemIconResId).setAlphabeticShortcut(this.itemAlphabeticShortcut).setNumericShortcut(this.itemNumericShortcut);
        if (this.itemShowAsAction >= 0) {
          MenuItemCompat.setShowAsAction(paramMenuItem, this.itemShowAsAction);
        }
        if (this.itemListenerMethodName == null) {
          break label158;
        }
        if (!SupportMenuInflater.this.mContext.isRestricted()) {
          break;
        }
        throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
      }
      paramMenuItem.setOnMenuItemClickListener(new SupportMenuInflater.InflatedOnMenuItemClickListener(SupportMenuInflater.this.mRealOwner, this.itemListenerMethodName));
      label158:
      if ((paramMenuItem instanceof MenuItemImpl))
      {
        localObject = (MenuItemImpl)paramMenuItem;
        if (this.itemCheckable >= 2)
        {
          if (!(paramMenuItem instanceof MenuItemImpl)) {
            break label273;
          }
          ((MenuItemImpl)paramMenuItem).setExclusiveCheckable(true);
        }
        label193:
        int i = 0;
        if (this.itemActionViewClassName != null)
        {
          MenuItemCompat.setActionView(paramMenuItem, (View)newInstance(this.itemActionViewClassName, SupportMenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionViewConstructorArguments));
          i = 1;
        }
        if (this.itemActionViewLayout > 0)
        {
          if (i != 0) {
            break label291;
          }
          MenuItemCompat.setActionView(paramMenuItem, this.itemActionViewLayout);
        }
      }
      for (;;)
      {
        if (this.itemActionProvider != null) {
          MenuItemCompat.setActionProvider(paramMenuItem, this.itemActionProvider);
        }
        return;
        break;
        label273:
        if (!(paramMenuItem instanceof MenuItemWrapperICS)) {
          break label193;
        }
        ((MenuItemWrapperICS)paramMenuItem).setExclusiveCheckable(true);
        break label193;
        label291:
        Log.w("SupportMenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
      }
    }
    
    public void addItem()
    {
      this.itemAdded = true;
      setItem(this.menu.add(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle));
    }
    
    public SubMenu addSubMenuItem()
    {
      this.itemAdded = true;
      SubMenu localSubMenu = this.menu.addSubMenu(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle);
      setItem(localSubMenu.getItem());
      return localSubMenu;
    }
    
    public boolean hasAddedItem()
    {
      return this.itemAdded;
    }
    
    public void readGroup(AttributeSet paramAttributeSet)
    {
      paramAttributeSet = SupportMenuInflater.this.mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.MenuGroup);
      this.groupId = paramAttributeSet.getResourceId(1, 0);
      this.groupCategory = paramAttributeSet.getInt(3, 0);
      this.groupOrder = paramAttributeSet.getInt(4, 0);
      this.groupCheckable = paramAttributeSet.getInt(5, 0);
      this.groupVisible = paramAttributeSet.getBoolean(2, true);
      this.groupEnabled = paramAttributeSet.getBoolean(0, true);
      paramAttributeSet.recycle();
    }
    
    public void readItem(AttributeSet paramAttributeSet)
    {
      paramAttributeSet = SupportMenuInflater.this.mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.MenuItem);
      this.itemId = paramAttributeSet.getResourceId(2, 0);
      this.itemCategoryOrder = (0xFFFF0000 & paramAttributeSet.getInt(5, this.groupCategory) | 0xFFFF & paramAttributeSet.getInt(6, this.groupOrder));
      this.itemTitle = paramAttributeSet.getText(7);
      this.itemTitleCondensed = paramAttributeSet.getText(8);
      this.itemIconResId = paramAttributeSet.getResourceId(0, 0);
      this.itemAlphabeticShortcut = getShortcut(paramAttributeSet.getString(9));
      this.itemNumericShortcut = getShortcut(paramAttributeSet.getString(10));
      int i;
      if (paramAttributeSet.hasValue(11)) {
        if (paramAttributeSet.getBoolean(11, false))
        {
          i = 1;
          this.itemCheckable = i;
          label141:
          this.itemChecked = paramAttributeSet.getBoolean(3, false);
          this.itemVisible = paramAttributeSet.getBoolean(4, this.groupVisible);
          this.itemEnabled = paramAttributeSet.getBoolean(1, this.groupEnabled);
          this.itemShowAsAction = paramAttributeSet.getInt(13, -1);
          this.itemListenerMethodName = paramAttributeSet.getString(12);
          this.itemActionViewLayout = paramAttributeSet.getResourceId(14, 0);
          this.itemActionViewClassName = paramAttributeSet.getString(15);
          this.itemActionProviderClassName = paramAttributeSet.getString(16);
          if (this.itemActionProviderClassName == null) {
            break label307;
          }
          i = 1;
          label238:
          if ((i == 0) || (this.itemActionViewLayout != 0) || (this.itemActionViewClassName != null)) {
            break label312;
          }
        }
      }
      for (this.itemActionProvider = ((ActionProvider)newInstance(this.itemActionProviderClassName, SupportMenuInflater.ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionProviderConstructorArguments));; this.itemActionProvider = null)
      {
        paramAttributeSet.recycle();
        this.itemAdded = false;
        return;
        i = 0;
        break;
        this.itemCheckable = this.groupCheckable;
        break label141;
        label307:
        i = 0;
        break label238;
        label312:
        if (i != 0) {
          Log.w("SupportMenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
        }
      }
    }
    
    public void resetGroup()
    {
      this.groupId = 0;
      this.groupCategory = 0;
      this.groupOrder = 0;
      this.groupCheckable = 0;
      this.groupVisible = true;
      this.groupEnabled = true;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/SupportMenuInflater.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */