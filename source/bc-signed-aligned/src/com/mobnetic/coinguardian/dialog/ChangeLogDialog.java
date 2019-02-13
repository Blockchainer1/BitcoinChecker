package com.mobnetic.coinguardian.dialog;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

public class ChangeLogDialog
{
  private static final String CHANGELOG_XML = "changelog";
  private static final String TAG = "ChangeLogDialog";
  private Activity fActivity;
  
  public ChangeLogDialog(Activity paramActivity)
  {
    this.fActivity = paramActivity;
  }
  
  private String GetAppVersion()
  {
    try
    {
      String str1 = this.fActivity.getPackageManager().getPackageInfo(this.fActivity.getPackageName(), 0).versionName;
      return str1;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
        String str2 = "";
      }
    }
  }
  
  private String GetHTMLChangelog(int paramInt, Resources paramResources)
  {
    Object localObject1 = "<html><head>" + GetStyle() + "</head><body>";
    localXmlResourceParser = paramResources.getXml(paramInt);
    localObject2 = localObject1;
    localObject3 = localObject1;
    try
    {
      paramInt = localXmlResourceParser.getEventType();
      for (paramResources = (Resources)localObject1; paramInt != 1; paramResources = (Resources)localObject1)
      {
        localObject1 = paramResources;
        if (paramInt == 2)
        {
          localObject1 = paramResources;
          localObject2 = paramResources;
          localObject3 = paramResources;
          if (localXmlResourceParser.getName().equals("release"))
          {
            localObject2 = paramResources;
            localObject3 = paramResources;
            localObject1 = new java/lang/StringBuilder;
            localObject2 = paramResources;
            localObject3 = paramResources;
            ((StringBuilder)localObject1).<init>();
            localObject2 = paramResources;
            localObject3 = paramResources;
            localObject1 = paramResources + ParseReleaseTag(localXmlResourceParser);
          }
        }
        localObject2 = localObject1;
        localObject3 = localObject1;
        paramInt = localXmlResourceParser.next();
      }
    }
    catch (XmlPullParserException paramResources)
    {
      for (;;)
      {
        Log.e("ChangeLogDialog", paramResources.getMessage(), paramResources);
        localXmlResourceParser.close();
        paramResources = (Resources)localObject2;
      }
    }
    catch (IOException paramResources)
    {
      for (;;)
      {
        Log.e("ChangeLogDialog", paramResources.getMessage(), paramResources);
        localXmlResourceParser.close();
        paramResources = (Resources)localObject3;
      }
    }
    finally
    {
      localXmlResourceParser.close();
    }
    return paramResources + "</body></html>";
  }
  
  private String GetStyle()
  {
    return "<style type=\"text/css\">h1 { margin-left: 0px; font-size: 12pt; }li { margin-left: 0px; font-size: 9pt;}ul { padding-left: 30px;}</style>";
  }
  
  private String ParseReleaseTag(XmlResourceParser paramXmlResourceParser)
    throws XmlPullParserException, IOException
  {
    Object localObject1 = "<h1>Release: " + paramXmlResourceParser.getAttributeValue(null, "version") + "</h1><ul>";
    int i = paramXmlResourceParser.getEventType();
    while ((i != 3) || (paramXmlResourceParser.getName().equals("change")))
    {
      Object localObject2 = localObject1;
      if (i == 2)
      {
        localObject2 = localObject1;
        if (paramXmlResourceParser.getName().equals("change"))
        {
          paramXmlResourceParser.next();
          localObject2 = (String)localObject1 + "<li>" + paramXmlResourceParser.getText() + "</li>";
        }
      }
      i = paramXmlResourceParser.next();
      localObject1 = localObject2;
    }
    return (String)localObject1 + "</ul>";
  }
  
  public void show()
  {
    String str1 = this.fActivity.getPackageName();
    try
    {
      localObject = this.fActivity.getPackageManager().getResourcesForApplication(str1);
      String str2 = ((Resources)localObject).getString(2131165344);
      str2 = str2 + " v" + GetAppVersion();
      str1 = GetHTMLChangelog(((Resources)localObject).getIdentifier("changelog", "xml", str1), (Resources)localObject);
      localObject = ((Resources)localObject).getString(2131165293);
      if (str1.equals("") == true)
      {
        Toast.makeText(this.fActivity, "Could not load change log", 0).show();
        return;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        Object localObject;
        localNameNotFoundException.printStackTrace();
        continue;
        WebView localWebView = new WebView(this.fActivity);
        localWebView.loadDataWithBaseURL(null, str1, "text/html", "UTF-8", null);
        new AlertDialog.Builder(this.fActivity).setTitle(localNameNotFoundException).setView(localWebView).setPositiveButton((CharSequence)localObject, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            paramAnonymousDialogInterface.dismiss();
          }
        }).create().show();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/dialog/ChangeLogDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */