package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.mobnetic.coinguardian.R.styleable;

public abstract class ViewTwoStatePreference
  extends ViewPreference
{
  CompoundButton compoundButton;
  private boolean isChecked;
  private OnCheckChangedListener onCheckChangedListener;
  
  public ViewTwoStatePreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewTwoStatePreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewTwoStatePreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected abstract CompoundButton createCompoundButton();
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    super.init(paramContext, paramAttributeSet);
    if (paramAttributeSet != null)
    {
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewPreference);
      this.isChecked = paramContext.getBoolean(2, false);
      paramContext.recycle();
    }
  }
  
  public boolean isChecked()
  {
    return this.isChecked;
  }
  
  public void onClick(View paramView)
  {
    toggle();
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    this.compoundButton = createCompoundButton();
    this.compoundButton.setFocusable(false);
    this.compoundButton.setDuplicateParentStateEnabled(true);
    this.compoundButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        ViewTwoStatePreference.this.setChecked(paramAnonymousBoolean);
      }
    });
    setWidget(this.compoundButton);
    setChecked(this.isChecked);
  }
  
  public void setChecked(boolean paramBoolean)
  {
    if (isChecked() == paramBoolean) {}
    for (;;)
    {
      return;
      if ((this.onCheckChangedListener == null) || (this.onCheckChangedListener.onCheckChanged(this, paramBoolean)))
      {
        this.isChecked = paramBoolean;
        this.compoundButton.setChecked(paramBoolean);
      }
    }
  }
  
  public void setOnCheckChangedListener(OnCheckChangedListener paramOnCheckChangedListener)
  {
    this.onCheckChangedListener = paramOnCheckChangedListener;
  }
  
  public void toggle()
  {
    if (!isChecked()) {}
    for (boolean bool = true;; bool = false)
    {
      setChecked(bool);
      return;
    }
  }
  
  public static abstract interface OnCheckChangedListener
  {
    public abstract boolean onCheckChanged(ViewTwoStatePreference paramViewTwoStatePreference, boolean paramBoolean);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewTwoStatePreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */