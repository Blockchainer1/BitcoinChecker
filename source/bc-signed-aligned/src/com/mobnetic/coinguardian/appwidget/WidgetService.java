package com.mobnetic.coinguardian.appwidget;

import android.annotation.TargetApi;
import android.content.Intent;
import android.widget.RemoteViewsService;
import android.widget.RemoteViewsService.RemoteViewsFactory;

@TargetApi(11)
public class WidgetService
  extends RemoteViewsService
{
  @TargetApi(11)
  public RemoteViewsService.RemoteViewsFactory onGetViewFactory(Intent paramIntent)
  {
    return new ListProvider(getApplicationContext(), paramIntent);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/WidgetService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */