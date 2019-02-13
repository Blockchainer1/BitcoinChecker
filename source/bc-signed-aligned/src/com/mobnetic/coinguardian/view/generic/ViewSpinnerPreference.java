package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.util.AttributeSet;
import android.widget.BaseAdapter;

public class ViewSpinnerPreference
  extends ViewDialogPreference
{
  private BaseAdapter adapter;
  private CharSequence[] entries;
  private OnItemSelectedListener onItemSelectedListener;
  private int selection = -1;
  
  public ViewSpinnerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewSpinnerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewSpinnerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public CharSequence[] getEntries()
  {
    return this.entries;
  }
  
  public CharSequence getEntry()
  {
    if ((this.entries != null) && (this.selection >= 0) && (this.selection < this.entries.length)) {}
    for (CharSequence localCharSequence = this.entries[this.selection];; localCharSequence = null) {
      return localCharSequence;
    }
  }
  
  public int getSelection()
  {
    return this.selection;
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    DialogInterface.OnClickListener local1 = new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        ViewSpinnerPreference.this.setSelection(paramAnonymousInt);
        paramAnonymousDialogInterface.dismiss();
      }
    };
    if (this.adapter == null) {
      paramBuilder.setSingleChoiceItems(this.entries, this.selection, local1);
    }
    for (;;)
    {
      return;
      paramBuilder.setSingleChoiceItems(this.adapter, this.selection, local1);
    }
  }
  
  public void setEntries(CharSequence[] paramArrayOfCharSequence)
  {
    setEntriesAndSelection(paramArrayOfCharSequence, 0);
  }
  
  public void setEntriesAndSelection(BaseAdapter paramBaseAdapter, CharSequence[] paramArrayOfCharSequence, int paramInt)
  {
    this.adapter = paramBaseAdapter;
    setEntriesAndSelection(paramArrayOfCharSequence, paramInt);
  }
  
  public void setEntriesAndSelection(CharSequence[] paramArrayOfCharSequence, int paramInt)
  {
    this.entries = paramArrayOfCharSequence;
    setSelection(paramInt);
  }
  
  public void setOnItemSelectedListener(OnItemSelectedListener paramOnItemSelectedListener)
  {
    this.onItemSelectedListener = paramOnItemSelectedListener;
  }
  
  public void setSelection(int paramInt)
  {
    setSelection(paramInt, true);
  }
  
  public void setSelection(int paramInt, boolean paramBoolean)
  {
    if ((getSelection() != paramInt) && ((!paramBoolean) || (this.onItemSelectedListener == null) || (this.onItemSelectedListener.onItemSelected(this, paramInt)))) {
      this.selection = paramInt;
    }
    setSummary(getEntry());
  }
  
  public static abstract interface OnItemSelectedListener
  {
    public abstract boolean onItemSelected(ViewSpinnerPreference paramViewSpinnerPreference, int paramInt);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewSpinnerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */