package com.mobnetic.coinguardian.appwidget;

import android.appwidget.AppWidgetManager;
import android.content.Intent;
import android.os.Bundle;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;

public class WidgetConfigureActivity
  extends SimpleFragmentSubActivity<WidgetConfigureFragment>
{
  private int appWidgetId = 0;
  
  protected WidgetConfigureFragment createChildFragment()
  {
    return WidgetConfigureFragment.newInstance(this.appWidgetId);
  }
  
  public void finish()
  {
    WidgetProvider.updateWdgetWithId(this, AppWidgetManager.getInstance(this), this.appWidgetId);
    super.finish();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    Bundle localBundle = getIntent().getExtras();
    if (localBundle != null) {
      this.appWidgetId = localBundle.getInt("appWidgetId", 0);
    }
    super.onCreate(paramBundle);
    WidgetProvider.updateWdgetWithId(this, AppWidgetManager.getInstance(this), this.appWidgetId);
    paramBundle = new Intent();
    paramBundle.putExtra("appWidgetId", this.appWidgetId);
    setResult(-1, paramBundle);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/WidgetConfigureActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */