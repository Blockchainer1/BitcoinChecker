package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import com.mobnetic.coinguardian.R.styleable;

public abstract class ViewDialogPreference
  extends ViewPreference
{
  private AlertDialog dialog;
  private CharSequence dialogTitle;
  
  public ViewDialogPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewDialogPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewDialogPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected AlertDialog getDialog()
  {
    return this.dialog;
  }
  
  public CharSequence getDialogTitle()
  {
    return this.dialogTitle;
  }
  
  public abstract CharSequence getEntry();
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    super.init(paramContext, paramAttributeSet);
    if (paramAttributeSet != null)
    {
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ViewDialogPreference);
      setDialogTitle(paramContext.getString(0));
      paramContext.recycle();
    }
  }
  
  public void onClick(View paramView)
  {
    paramView = new AlertDialog.Builder(getContext());
    paramView.setInverseBackgroundForced(true);
    paramView.setTitle(this.dialogTitle);
    paramView.setNegativeButton(17039360, null);
    onPrepareDialog(paramView);
    this.dialog = paramView.create();
    onPreDialogShow(this.dialog);
    this.dialog.show();
  }
  
  protected void onPreDialogShow(AlertDialog paramAlertDialog) {}
  
  protected abstract void onPrepareDialog(AlertDialog.Builder paramBuilder);
  
  public void setDialogTitle(CharSequence paramCharSequence)
  {
    CharSequence localCharSequence = paramCharSequence;
    if (TextUtils.isEmpty(paramCharSequence)) {
      localCharSequence = getTitle();
    }
    this.dialogTitle = localCharSequence;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewDialogPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */