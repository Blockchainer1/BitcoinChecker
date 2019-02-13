package com.mobnetic.coinguardian.db.content;

import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import com.robotoworks.mechanoid.db.ContentProviderActions;
import com.robotoworks.mechanoid.db.DefaultContentProviderActions;
import com.robotoworks.mechanoid.db.MechanoidContentProvider;
import com.robotoworks.mechanoid.db.MechanoidSQLiteOpenHelper;
import java.util.Map;
import java.util.Set;

public abstract class AbstractMaindbContentProvider
  extends MechanoidContentProvider
{
  protected static final int ALARM = 2;
  protected static final int ALARM_ID = 3;
  protected static final int CHECKER = 0;
  protected static final int CHECKER_ID = 1;
  public static final int NUM_URI_MATCHERS = 4;
  
  protected ContentProviderActions createActions(int paramInt)
  {
    ContentProviderActions localContentProviderActions;
    switch (paramInt)
    {
    default: 
      throw new UnsupportedOperationException("Unknown id: " + paramInt);
    case 0: 
      localContentProviderActions = createCheckerActions();
    }
    for (;;)
    {
      return localContentProviderActions;
      localContentProviderActions = createCheckerByIdActions();
      continue;
      localContentProviderActions = createAlarmActions();
      continue;
      localContentProviderActions = createAlarmByIdActions();
    }
  }
  
  protected ContentProviderActions createAlarmActions()
  {
    return new DefaultContentProviderActions("alarm", false, AlarmRecord.getFactory());
  }
  
  protected ContentProviderActions createAlarmByIdActions()
  {
    return new DefaultContentProviderActions("alarm", true, AlarmRecord.getFactory());
  }
  
  protected ContentProviderActions createCheckerActions()
  {
    return new DefaultContentProviderActions("checker", false, CheckerRecord.getFactory());
  }
  
  protected ContentProviderActions createCheckerByIdActions()
  {
    return new DefaultContentProviderActions("checker", true, CheckerRecord.getFactory());
  }
  
  protected String[] createContentTypes()
  {
    return new String[] { "vnd.android.cursor.dir/vnd.maindb.checker", "vnd.android.cursor.item/vnd.maindb.checker", "vnd.android.cursor.dir/vnd.maindb.alarm", "vnd.android.cursor.item/vnd.maindb.alarm" };
  }
  
  protected MechanoidSQLiteOpenHelper createOpenHelper(Context paramContext)
  {
    return new MaindbOpenHelper(paramContext);
  }
  
  protected UriMatcher createUriMatcher()
  {
    UriMatcher localUriMatcher = new UriMatcher(-1);
    String str = MaindbContract.CONTENT_AUTHORITY;
    localUriMatcher.addURI(str, "checker", 0);
    localUriMatcher.addURI(str, "checker/#", 1);
    localUriMatcher.addURI(str, "alarm", 2);
    localUriMatcher.addURI(str, "alarm/#", 3);
    return localUriMatcher;
  }
  
  protected Set<Uri> getRelatedUris(Uri paramUri)
  {
    return (Set)MaindbContract.REFERENCING_VIEWS.get(paramUri);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */