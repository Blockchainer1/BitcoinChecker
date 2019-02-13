package com.mobnetic.coinguardian.preferences;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.ListPreference;
import android.util.AttributeSet;

public class IntListPreference
  extends ListPreference
{
  public IntListPreference(Context paramContext)
  {
    super(paramContext);
    init();
  }
  
  public IntListPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  private void init()
  {
    setDefaultEntryValues();
  }
  
  protected String getPersistedString(String paramString)
  {
    if (!getSharedPreferences().contains(getKey())) {}
    for (;;)
    {
      return paramString;
      paramString = String.valueOf(getPersistedInt(0));
    }
  }
  
  protected boolean persistString(String paramString)
  {
    if (paramString == null) {}
    for (boolean bool = false;; bool = persistInt(Integer.valueOf(paramString).intValue())) {
      return bool;
    }
  }
  
  public void setDefaultEntryValues()
  {
    if ((getEntryValues() == null) && (getEntries() != null))
    {
      int i = getEntries().length;
      String[] arrayOfString = new String[i];
      for (int j = 0; j < i; j++) {
        arrayOfString[j] = String.valueOf(j);
      }
      setEntryValues(arrayOfString);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/preferences/IntListPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */