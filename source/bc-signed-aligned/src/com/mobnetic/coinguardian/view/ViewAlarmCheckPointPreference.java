package com.mobnetic.coinguardian.view;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.CurrencyUtils;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.TickerUtils;
import com.mobnetic.coinguardian.util.Utils;
import com.mobnetic.coinguardian.view.generic.ViewDialogPreference;

public class ViewAlarmCheckPointPreference
  extends ViewDialogPreference
{
  private AlarmRecord alarmRecord;
  private CheckerRecord checkerRecord;
  private OnCheckpointChangedListener onCheckpointChangedListener;
  private CurrencySubunit subunit;
  private String sufix;
  
  public ViewAlarmCheckPointPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewAlarmCheckPointPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewAlarmCheckPointPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void resetCheckpointToLastCheck()
  {
    if (((TextUtils.isEmpty(this.alarmRecord.getLastCheckPointTicker())) && (!TextUtils.isEmpty(this.checkerRecord.getLastCheckTicker()))) || ((!TextUtils.isEmpty(this.alarmRecord.getLastCheckPointTicker())) && (!this.alarmRecord.getLastCheckPointTicker().equals(this.checkerRecord.getLastCheckTicker()))))
    {
      Ticker localTicker = TickerUtils.fromJson(this.checkerRecord.getLastCheckTicker());
      if ((this.onCheckpointChangedListener == null) || (!this.onCheckpointChangedListener.onCheckpointChanged(this, localTicker))) {}
    }
    setSummary(getEntry());
  }
  
  private void setValue(double paramDouble)
  {
    Ticker localTicker = TickerUtils.fromJson(this.alarmRecord.getLastCheckPointTicker());
    int i;
    if (paramDouble <= 0.0D) {
      if (localTicker != null)
      {
        i = 1;
        localTicker = null;
      }
    }
    for (;;)
    {
      if (i != 0)
      {
        if (localTicker != null)
        {
          localTicker.last = paramDouble;
          localTicker.timestamp = System.currentTimeMillis();
        }
        if ((this.onCheckpointChangedListener == null) || (!this.onCheckpointChangedListener.onCheckpointChanged(this, localTicker))) {}
      }
      setSummary(getEntry());
      return;
      i = 0;
      break;
      if (localTicker != null)
      {
        if (localTicker.last != paramDouble) {}
        for (i = 1;; i = 0) {
          break;
        }
      }
      localTicker = new Ticker();
      i = 1;
    }
  }
  
  public String getEntry()
  {
    Object localObject = TickerUtils.fromJson(this.alarmRecord.getLastCheckPointTicker());
    if (localObject != null) {}
    for (localObject = FormatUtils.formatPriceWithCurrency(((Ticker)localObject).last, this.subunit) + " - " + FormatUtils.formatDateTime(getContext(), ((Ticker)localObject).timestamp);; localObject = getContext().getString(2131165207)) {
      return (String)localObject;
    }
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    int i = 0;
    View localView = LayoutInflater.from(getContext()).inflate(2130903064, null);
    final EditText localEditText = (EditText)localView.findViewById(2131624010);
    localEditText.addTextChangedListener(new TextWatcher()
    {
      int selectionEnd;
      int selectionStart;
      
      public void afterTextChanged(Editable paramAnonymousEditable)
      {
        localEditText.setSelection(this.selectionStart, this.selectionEnd);
      }
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        this.selectionStart = localEditText.getSelectionStart();
        this.selectionEnd = localEditText.getSelectionEnd();
        localEditText.removeTextChangedListener(this);
        if (paramAnonymousCharSequence.toString().contains(",")) {
          localEditText.setText(paramAnonymousCharSequence.toString().replace(',', '.'));
        }
        localEditText.addTextChangedListener(this);
      }
    });
    TextView localTextView1 = (TextView)localView.findViewById(2131624011);
    TextView localTextView2 = (TextView)localView.findViewById(2131624012);
    Ticker localTicker = TickerUtils.fromJson(this.alarmRecord.getLastCheckPointTicker());
    if (localTicker != null) {
      localEditText.setText(FormatUtils.formatPriceValueForSubunit(localTicker.last, this.subunit, false, true).replace(',', '.'));
    }
    for (;;)
    {
      if (TextUtils.isEmpty(this.checkerRecord.getLastCheckTicker())) {
        i = 8;
      }
      localTextView2.setVisibility(i);
      Utils.setSelectionAfterLastLetter(localEditText);
      localTextView1.setText(this.sufix);
      localEditText.post(new Runnable()
      {
        public void run()
        {
          Utils.showKeyboard(ViewAlarmCheckPointPreference.this.getContext(), localEditText);
        }
      });
      localTextView2.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          ViewAlarmCheckPointPreference.this.resetCheckpointToLastCheck();
          paramAnonymousView = ViewAlarmCheckPointPreference.this.getDialog();
          if ((paramAnonymousView != null) && (paramAnonymousView.isShowing())) {
            paramAnonymousView.dismiss();
          }
        }
      });
      paramBuilder.setPositiveButton(17039370, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          Utils.hideKeyboard(ViewAlarmCheckPointPreference.this.getContext(), localEditText);
          try
          {
            double d1 = Double.parseDouble(localEditText.getText().toString().replace(',', '.'));
            double d2 = d1;
            if (ViewAlarmCheckPointPreference.this.subunit != null) {
              d2 = d1 / ViewAlarmCheckPointPreference.this.subunit.subunitToUnit;
            }
            ViewAlarmCheckPointPreference.this.setValue(d2);
            return;
          }
          catch (Exception paramAnonymousDialogInterface)
          {
            for (;;)
            {
              paramAnonymousDialogInterface.printStackTrace();
              ViewAlarmCheckPointPreference.this.setValue(-1.0D);
            }
          }
        }
      });
      paramBuilder.setNeutralButton(17039360, null);
      paramBuilder.setNegativeButton(2131165302, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          ViewAlarmCheckPointPreference.this.setValue(-1.0D);
        }
      });
      paramBuilder.setView(localView);
      return;
      localEditText.setText("");
    }
  }
  
  public void setCheckerAndAlarmRecord(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    this.checkerRecord = paramCheckerRecord;
    this.subunit = CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst());
    this.alarmRecord = paramAlarmRecord;
    setSummary(getEntry());
  }
  
  public void setOnCheckpointChangedListener(OnCheckpointChangedListener paramOnCheckpointChangedListener)
  {
    this.onCheckpointChangedListener = paramOnCheckpointChangedListener;
  }
  
  public void setSufix(String paramString)
  {
    this.sufix = paramString;
  }
  
  public static abstract interface OnCheckpointChangedListener
  {
    public abstract boolean onCheckpointChanged(ViewAlarmCheckPointPreference paramViewAlarmCheckPointPreference, Ticker paramTicker);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */