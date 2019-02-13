package uk.co.senab.actionbarpulltorefresh.extras.actionbarcompat;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import uk.co.senab.actionbarpulltorefresh.library.DefaultHeaderTransformer;
import uk.co.senab.actionbarpulltorefresh.library.R.anim;
import uk.co.senab.actionbarpulltorefresh.library.R.attr;
import uk.co.senab.actionbarpulltorefresh.library.R.id;
import uk.co.senab.actionbarpulltorefresh.library.R.styleable;

public class AbcDefaultHeaderTransformer
  extends DefaultHeaderTransformer
{
  private Animation mHeaderInAnimation;
  private Animation mHeaderOutAnimation;
  
  protected Drawable getActionBarBackground(Context paramContext)
  {
    if (Build.VERSION.SDK_INT >= super.getMinimumApiLevel()) {
      paramContext = super.getActionBarBackground(paramContext);
    }
    for (;;)
    {
      return paramContext;
      TypedArray localTypedArray = obtainStyledAttrsFromThemeAttr(paramContext, R.attr.actionBarStyle, R.styleable.ActionBar);
      try
      {
        paramContext = localTypedArray.getDrawable(R.styleable.ActionBar_background);
        localTypedArray.recycle();
      }
      finally
      {
        localTypedArray.recycle();
      }
    }
  }
  
  /* Error */
  protected int getActionBarSize(Context paramContext)
  {
    // Byte code:
    //   0: getstatic 27	android/os/Build$VERSION:SDK_INT	I
    //   3: aload_0
    //   4: invokespecial 31	uk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer:getMinimumApiLevel	()I
    //   7: if_icmplt +11 -> 18
    //   10: aload_0
    //   11: aload_1
    //   12: invokespecial 64	uk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer:getActionBarSize	(Landroid/content/Context;)I
    //   15: istore_2
    //   16: iload_2
    //   17: ireturn
    //   18: aload_1
    //   19: iconst_1
    //   20: newarray <illegal type>
    //   22: dup
    //   23: iconst_0
    //   24: getstatic 67	uk/co/senab/actionbarpulltorefresh/library/R$attr:actionBarSize	I
    //   27: iastore
    //   28: invokevirtual 73	android/content/Context:obtainStyledAttributes	([I)Landroid/content/res/TypedArray;
    //   31: astore_1
    //   32: aload_1
    //   33: iconst_0
    //   34: iconst_0
    //   35: invokevirtual 77	android/content/res/TypedArray:getDimensionPixelSize	(II)I
    //   38: istore_2
    //   39: aload_1
    //   40: invokevirtual 60	android/content/res/TypedArray:recycle	()V
    //   43: goto -27 -> 16
    //   46: astore_3
    //   47: aload_1
    //   48: invokevirtual 60	android/content/res/TypedArray:recycle	()V
    //   51: aload_3
    //   52: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	53	0	this	AbcDefaultHeaderTransformer
    //   0	53	1	paramContext	Context
    //   15	24	2	i	int
    //   46	6	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   32	39	46	finally
  }
  
  /* Error */
  protected int getActionBarTitleStyle(Context paramContext)
  {
    // Byte code:
    //   0: getstatic 27	android/os/Build$VERSION:SDK_INT	I
    //   3: aload_0
    //   4: invokespecial 31	uk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer:getMinimumApiLevel	()I
    //   7: if_icmplt +11 -> 18
    //   10: aload_0
    //   11: aload_1
    //   12: invokespecial 80	uk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer:getActionBarTitleStyle	(Landroid/content/Context;)I
    //   15: istore_2
    //   16: iload_2
    //   17: ireturn
    //   18: aload_1
    //   19: getstatic 38	uk/co/senab/actionbarpulltorefresh/library/R$attr:actionBarStyle	I
    //   22: getstatic 44	uk/co/senab/actionbarpulltorefresh/library/R$styleable:ActionBar	[I
    //   25: invokestatic 48	uk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer:obtainStyledAttrsFromThemeAttr	(Landroid/content/Context;I[I)Landroid/content/res/TypedArray;
    //   28: astore_1
    //   29: aload_1
    //   30: getstatic 83	uk/co/senab/actionbarpulltorefresh/library/R$styleable:ActionBar_titleTextStyle	I
    //   33: iconst_0
    //   34: invokevirtual 86	android/content/res/TypedArray:getResourceId	(II)I
    //   37: istore_2
    //   38: aload_1
    //   39: invokevirtual 60	android/content/res/TypedArray:recycle	()V
    //   42: goto -26 -> 16
    //   45: astore_3
    //   46: aload_1
    //   47: invokevirtual 60	android/content/res/TypedArray:recycle	()V
    //   50: aload_3
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	AbcDefaultHeaderTransformer
    //   0	52	1	paramContext	Context
    //   15	23	2	i	int
    //   45	6	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   29	38	45	finally
  }
  
  protected int getMinimumApiLevel()
  {
    return 7;
  }
  
  public boolean hideHeaderView()
  {
    boolean bool1;
    if (Build.VERSION.SDK_INT >= super.getMinimumApiLevel()) {
      bool1 = super.hideHeaderView();
    }
    for (;;)
    {
      return bool1;
      View localView = getHeaderView();
      if ((localView != null) && (localView.getVisibility() != 8)) {}
      for (boolean bool2 = true;; bool2 = false)
      {
        bool1 = bool2;
        if (!bool2) {
          break;
        }
        if (this.mHeaderOutAnimation == null) {
          break label68;
        }
        localView.startAnimation(this.mHeaderOutAnimation);
        bool1 = bool2;
        break;
      }
      label68:
      localView.setVisibility(8);
      onReset();
      bool1 = bool2;
    }
  }
  
  public void onRefreshMinimized()
  {
    if (Build.VERSION.SDK_INT >= super.getMinimumApiLevel()) {
      super.onRefreshMinimized();
    }
    for (;;)
    {
      return;
      View localView = getHeaderView().findViewById(R.id.ptr_content);
      if (localView != null)
      {
        localView.startAnimation(AnimationUtils.loadAnimation(localView.getContext(), R.anim.fade_out));
        localView.setVisibility(4);
      }
    }
  }
  
  public void onViewCreated(Activity paramActivity, View paramView)
  {
    super.onViewCreated(paramActivity, paramView);
    this.mHeaderInAnimation = AnimationUtils.loadAnimation(paramActivity, R.anim.fade_in);
    this.mHeaderOutAnimation = AnimationUtils.loadAnimation(paramActivity, R.anim.fade_out);
    if ((this.mHeaderOutAnimation != null) || (this.mHeaderInAnimation != null))
    {
      paramActivity = new AnimationCallback();
      if (this.mHeaderOutAnimation != null) {
        this.mHeaderOutAnimation.setAnimationListener(paramActivity);
      }
    }
  }
  
  public boolean showHeaderView()
  {
    boolean bool1;
    if (Build.VERSION.SDK_INT >= super.getMinimumApiLevel())
    {
      bool1 = super.showHeaderView();
      return bool1;
    }
    View localView = getHeaderView();
    if ((localView != null) && (localView.getVisibility() != 0)) {}
    for (boolean bool2 = true;; bool2 = false)
    {
      bool1 = bool2;
      if (!bool2) {
        break;
      }
      if (this.mHeaderInAnimation != null) {
        localView.startAnimation(this.mHeaderInAnimation);
      }
      localView.setVisibility(0);
      bool1 = bool2;
      break;
    }
  }
  
  class AnimationCallback
    implements Animation.AnimationListener
  {
    AnimationCallback() {}
    
    public void onAnimationEnd(Animation paramAnimation)
    {
      if (paramAnimation == AbcDefaultHeaderTransformer.this.mHeaderOutAnimation)
      {
        paramAnimation = AbcDefaultHeaderTransformer.this.getHeaderView();
        if (paramAnimation != null) {
          paramAnimation.setVisibility(8);
        }
        AbcDefaultHeaderTransformer.this.onReset();
      }
    }
    
    public void onAnimationRepeat(Animation paramAnimation) {}
    
    public void onAnimationStart(Animation paramAnimation) {}
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */