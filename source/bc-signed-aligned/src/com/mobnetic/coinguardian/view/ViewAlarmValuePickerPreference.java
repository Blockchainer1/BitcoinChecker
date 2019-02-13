package com.mobnetic.coinguardian.view;

import android.annotation.TargetApi;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.mobnetic.coinguardian.util.CurrencyUtils;
import com.mobnetic.coinguardian.util.Utils;
import com.mobnetic.coinguardian.view.generic.ViewDialogPreference;

public class ViewAlarmValuePickerPreference
  extends ViewDialogPreference
{
  private AlarmRecord alarmRecord;
  private OnValueChangedListener onValueSelectedListener;
  private String prefix;
  private CurrencySubunit subunit;
  private String sufix;
  private double value = -1.0D;
  
  public ViewAlarmValuePickerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewAlarmValuePickerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewAlarmValuePickerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public String getEntry()
  {
    String str1;
    if (this.prefix != null)
    {
      str1 = this.prefix;
      if (this.sufix == null) {
        break label66;
      }
    }
    label66:
    for (String str2 = this.sufix;; str2 = "")
    {
      return getContext().getString(2131165230, new Object[] { str1, AlarmRecordHelper.getValueForAlarmType(this.subunit, this.alarmRecord), str2 });
      str1 = "";
      break;
    }
  }
  
  public double getValue()
  {
    return this.value;
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    View localView = LayoutInflater.from(getContext()).inflate(2130903065, null);
    TextView localTextView1 = (TextView)localView.findViewById(2131624013);
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
    TextView localTextView2 = (TextView)localView.findViewById(2131624011);
    localTextView1.setText(this.prefix);
    localEditText.setText(AlarmRecordHelper.getValueForAlarmType(this.subunit, this.alarmRecord).replace(',', '.'));
    Utils.setSelectionAfterLastLetter(localEditText);
    localTextView2.setText(this.sufix);
    localEditText.post(new Runnable()
    {
      public void run()
      {
        Utils.showKeyboard(ViewAlarmValuePickerPreference.this.getContext(), localEditText);
      }
    });
    paramBuilder.setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        Utils.hideKeyboard(ViewAlarmValuePickerPreference.this.getContext(), localEditText);
        double d1 = 1.0D;
        try
        {
          double d2 = Double.parseDouble(localEditText.getText().toString().replace(',', '.'));
          d1 = d2;
          d2 = AlarmRecordHelper.parseEnteredValueForAlarmType(ViewAlarmValuePickerPreference.this.subunit, ViewAlarmValuePickerPreference.this.alarmRecord, d2);
          d1 = d2;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localException.printStackTrace();
          }
        }
        ViewAlarmValuePickerPreference.this.setValue(d1);
        paramAnonymousDialogInterface.dismiss();
      }
    });
    paramBuilder.setView(localView);
  }
  
  public void setCheckerAndAlarmRecord(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    this.subunit = CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst());
    this.alarmRecord = paramAlarmRecord;
  }
  
  public void setOnValueChangedListener(OnValueChangedListener paramOnValueChangedListener)
  {
    this.onValueSelectedListener = paramOnValueChangedListener;
  }
  
  public void setPrefix(String paramString)
  {
    this.prefix = paramString;
  }
  
  public void setSufix(String paramString)
  {
    this.sufix = paramString;
  }
  
  public void setValue(double paramDouble)
  {
    if ((getValue() != paramDouble) && ((this.onValueSelectedListener == null) || (this.onValueSelectedListener.onValueChanged(this, paramDouble)))) {
      this.value = paramDouble;
    }
    setSummary(getEntry());
  }
  
  public static abstract interface OnValueChangedListener
  {
    public abstract boolean onValueChanged(ViewAlarmValuePickerPreference paramViewAlarmValuePickerPreference, double paramDouble);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */