package com.mobnetic.coinguardian.view;

import android.annotation.TargetApi;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.util.AttributeSet;
import android.view.View.OnClickListener;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference;

public class ViewCurrencySpinnerPreference
  extends ViewSpinnerPreference
{
  private View.OnClickListener onSyncClickedListener;
  private boolean showSyncButton;
  
  public ViewCurrencySpinnerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewCurrencySpinnerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewCurrencySpinnerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    super.onPrepareDialog(paramBuilder);
    if (this.showSyncButton) {
      paramBuilder.setPositiveButton(2131165233, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          if (ViewCurrencySpinnerPreference.this.onSyncClickedListener != null) {
            ViewCurrencySpinnerPreference.this.onSyncClickedListener.onClick(ViewCurrencySpinnerPreference.this);
          }
        }
      });
    }
  }
  
  public void setOnSyncClickedListener(View.OnClickListener paramOnClickListener)
  {
    this.onSyncClickedListener = paramOnClickListener;
  }
  
  public void setShowSyncButton(boolean paramBoolean)
  {
    this.showSyncButton = paramBoolean;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */