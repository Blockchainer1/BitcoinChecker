package android.support.v7.internal.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.text.TextUtils;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActivityChooserModel
  extends DataSetObservable
{
  private static final String ATTRIBUTE_ACTIVITY = "activity";
  private static final String ATTRIBUTE_TIME = "time";
  private static final String ATTRIBUTE_WEIGHT = "weight";
  private static final boolean DEBUG = false;
  private static final int DEFAULT_ACTIVITY_INFLATION = 5;
  private static final float DEFAULT_HISTORICAL_RECORD_WEIGHT = 1.0F;
  public static final String DEFAULT_HISTORY_FILE_NAME = "activity_choser_model_history.xml";
  public static final int DEFAULT_HISTORY_MAX_LENGTH = 50;
  private static final String HISTORY_FILE_EXTENSION = ".xml";
  private static final int INVALID_INDEX = -1;
  private static final String LOG_TAG = ActivityChooserModel.class.getSimpleName();
  private static final String TAG_HISTORICAL_RECORD = "historical-record";
  private static final String TAG_HISTORICAL_RECORDS = "historical-records";
  private static final Map<String, ActivityChooserModel> sDataModelRegistry = new HashMap();
  private static final Object sRegistryLock = new Object();
  private final List<ActivityResolveInfo> mActivities = new ArrayList();
  private OnChooseActivityListener mActivityChoserModelPolicy;
  private ActivitySorter mActivitySorter = new DefaultSorter(null);
  private boolean mCanReadHistoricalData = true;
  private final Context mContext;
  private final List<HistoricalRecord> mHistoricalRecords = new ArrayList();
  private boolean mHistoricalRecordsChanged = true;
  private final String mHistoryFileName;
  private int mHistoryMaxSize = 50;
  private final Object mInstanceLock = new Object();
  private Intent mIntent;
  private boolean mReadShareHistoryCalled = false;
  private boolean mReloadActivities = false;
  
  private ActivityChooserModel(Context paramContext, String paramString)
  {
    this.mContext = paramContext.getApplicationContext();
    if ((!TextUtils.isEmpty(paramString)) && (!paramString.endsWith(".xml"))) {}
    for (this.mHistoryFileName = (paramString + ".xml");; this.mHistoryFileName = paramString) {
      return;
    }
  }
  
  private boolean addHisoricalRecord(HistoricalRecord paramHistoricalRecord)
  {
    boolean bool = this.mHistoricalRecords.add(paramHistoricalRecord);
    if (bool)
    {
      this.mHistoricalRecordsChanged = true;
      pruneExcessiveHistoricalRecordsIfNeeded();
      persistHistoricalDataIfNeeded();
      sortActivitiesIfNeeded();
      notifyChanged();
    }
    return bool;
  }
  
  private void ensureConsistentState()
  {
    boolean bool1 = loadActivitiesIfNeeded();
    boolean bool2 = readHistoricalDataIfNeeded();
    pruneExcessiveHistoricalRecordsIfNeeded();
    if ((bool1 | bool2))
    {
      sortActivitiesIfNeeded();
      notifyChanged();
    }
  }
  
  private void executePersistHistoryAsyncTaskBase()
  {
    new PersistHistoryAsyncTask(null).execute(new Object[] { new ArrayList(this.mHistoricalRecords), this.mHistoryFileName });
  }
  
  private void executePersistHistoryAsyncTaskSDK11()
  {
    new PersistHistoryAsyncTask(null).executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, new Object[] { new ArrayList(this.mHistoricalRecords), this.mHistoryFileName });
  }
  
  public static ActivityChooserModel get(Context paramContext, String paramString)
  {
    synchronized (sRegistryLock)
    {
      ActivityChooserModel localActivityChooserModel1 = (ActivityChooserModel)sDataModelRegistry.get(paramString);
      ActivityChooserModel localActivityChooserModel2 = localActivityChooserModel1;
      if (localActivityChooserModel1 == null)
      {
        localActivityChooserModel2 = new android/support/v7/internal/widget/ActivityChooserModel;
        localActivityChooserModel2.<init>(paramContext, paramString);
        sDataModelRegistry.put(paramString, localActivityChooserModel2);
      }
      return localActivityChooserModel2;
    }
  }
  
  private boolean loadActivitiesIfNeeded()
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    if (this.mReloadActivities)
    {
      bool2 = bool1;
      if (this.mIntent != null)
      {
        this.mReloadActivities = false;
        this.mActivities.clear();
        List localList = this.mContext.getPackageManager().queryIntentActivities(this.mIntent, 0);
        int i = localList.size();
        for (int j = 0; j < i; j++)
        {
          ResolveInfo localResolveInfo = (ResolveInfo)localList.get(j);
          this.mActivities.add(new ActivityResolveInfo(localResolveInfo));
        }
        bool2 = true;
      }
    }
    return bool2;
  }
  
  private void persistHistoricalDataIfNeeded()
  {
    if (!this.mReadShareHistoryCalled) {
      throw new IllegalStateException("No preceding call to #readHistoricalData");
    }
    if (!this.mHistoricalRecordsChanged) {}
    for (;;)
    {
      return;
      this.mHistoricalRecordsChanged = false;
      if (!TextUtils.isEmpty(this.mHistoryFileName)) {
        if (Build.VERSION.SDK_INT >= 11) {
          executePersistHistoryAsyncTaskSDK11();
        } else {
          executePersistHistoryAsyncTaskBase();
        }
      }
    }
  }
  
  private void pruneExcessiveHistoricalRecordsIfNeeded()
  {
    int i = this.mHistoricalRecords.size() - this.mHistoryMaxSize;
    if (i <= 0) {}
    for (;;)
    {
      return;
      this.mHistoricalRecordsChanged = true;
      for (int j = 0; j < i; j++) {
        HistoricalRecord localHistoricalRecord = (HistoricalRecord)this.mHistoricalRecords.remove(0);
      }
    }
  }
  
  private boolean readHistoricalDataIfNeeded()
  {
    boolean bool = true;
    if ((this.mCanReadHistoricalData) && (this.mHistoricalRecordsChanged) && (!TextUtils.isEmpty(this.mHistoryFileName)))
    {
      this.mCanReadHistoricalData = false;
      this.mReadShareHistoryCalled = true;
      readHistoricalDataImpl();
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  /* Error */
  private void readHistoricalDataImpl()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 145	android/support/v7/internal/widget/ActivityChooserModel:mContext	Landroid/content/Context;
    //   4: aload_0
    //   5: getfield 169	android/support/v7/internal/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   8: invokevirtual 296	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   11: astore_1
    //   12: invokestatic 302	android/util/Xml:newPullParser	()Lorg/xmlpull/v1/XmlPullParser;
    //   15: astore_2
    //   16: aload_2
    //   17: aload_1
    //   18: aconst_null
    //   19: invokeinterface 308 3 0
    //   24: iconst_0
    //   25: istore_3
    //   26: iload_3
    //   27: iconst_1
    //   28: if_icmpeq +20 -> 48
    //   31: iload_3
    //   32: iconst_2
    //   33: if_icmpeq +15 -> 48
    //   36: aload_2
    //   37: invokeinterface 311 1 0
    //   42: istore_3
    //   43: goto -17 -> 26
    //   46: astore_1
    //   47: return
    //   48: ldc 63
    //   50: aload_2
    //   51: invokeinterface 314 1 0
    //   56: invokevirtual 317	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   59: ifne +75 -> 134
    //   62: new 290	org/xmlpull/v1/XmlPullParserException
    //   65: astore 4
    //   67: aload 4
    //   69: ldc_w 319
    //   72: invokespecial 320	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   75: aload 4
    //   77: athrow
    //   78: astore_2
    //   79: getstatic 98	android/support/v7/internal/widget/ActivityChooserModel:LOG_TAG	Ljava/lang/String;
    //   82: astore 4
    //   84: new 159	java/lang/StringBuilder
    //   87: astore 5
    //   89: aload 5
    //   91: invokespecial 160	java/lang/StringBuilder:<init>	()V
    //   94: aload 4
    //   96: aload 5
    //   98: ldc_w 322
    //   101: invokevirtual 164	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: aload_0
    //   105: getfield 169	android/support/v7/internal/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   108: invokevirtual 164	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   111: invokevirtual 167	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   114: aload_2
    //   115: invokestatic 328	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   118: pop
    //   119: aload_1
    //   120: ifnull -73 -> 47
    //   123: aload_1
    //   124: invokevirtual 333	java/io/FileInputStream:close	()V
    //   127: goto -80 -> 47
    //   130: astore_1
    //   131: goto -84 -> 47
    //   134: aload_0
    //   135: getfield 122	android/support/v7/internal/widget/ActivityChooserModel:mHistoricalRecords	Ljava/util/List;
    //   138: astore 4
    //   140: aload 4
    //   142: invokeinterface 242 1 0
    //   147: aload_2
    //   148: invokeinterface 311 1 0
    //   153: istore_3
    //   154: iload_3
    //   155: iconst_1
    //   156: if_icmpne +18 -> 174
    //   159: aload_1
    //   160: ifnull -113 -> 47
    //   163: aload_1
    //   164: invokevirtual 333	java/io/FileInputStream:close	()V
    //   167: goto -120 -> 47
    //   170: astore_1
    //   171: goto -124 -> 47
    //   174: iload_3
    //   175: iconst_3
    //   176: if_icmpeq -29 -> 147
    //   179: iload_3
    //   180: iconst_4
    //   181: if_icmpeq -34 -> 147
    //   184: ldc 60
    //   186: aload_2
    //   187: invokeinterface 314 1 0
    //   192: invokevirtual 317	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   195: ifne +75 -> 270
    //   198: new 290	org/xmlpull/v1/XmlPullParserException
    //   201: astore 4
    //   203: aload 4
    //   205: ldc_w 335
    //   208: invokespecial 320	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   211: aload 4
    //   213: athrow
    //   214: astore_2
    //   215: getstatic 98	android/support/v7/internal/widget/ActivityChooserModel:LOG_TAG	Ljava/lang/String;
    //   218: astore 5
    //   220: new 159	java/lang/StringBuilder
    //   223: astore 4
    //   225: aload 4
    //   227: invokespecial 160	java/lang/StringBuilder:<init>	()V
    //   230: aload 5
    //   232: aload 4
    //   234: ldc_w 322
    //   237: invokevirtual 164	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   240: aload_0
    //   241: getfield 169	android/support/v7/internal/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   244: invokevirtual 164	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   247: invokevirtual 167	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   250: aload_2
    //   251: invokestatic 328	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   254: pop
    //   255: aload_1
    //   256: ifnull -209 -> 47
    //   259: aload_1
    //   260: invokevirtual 333	java/io/FileInputStream:close	()V
    //   263: goto -216 -> 47
    //   266: astore_1
    //   267: goto -220 -> 47
    //   270: aload_2
    //   271: aconst_null
    //   272: ldc 31
    //   274: invokeinterface 339 3 0
    //   279: astore 5
    //   281: aload_2
    //   282: aconst_null
    //   283: ldc 34
    //   285: invokeinterface 339 3 0
    //   290: invokestatic 345	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   293: lstore 6
    //   295: aload_2
    //   296: aconst_null
    //   297: ldc 37
    //   299: invokeinterface 339 3 0
    //   304: invokestatic 351	java/lang/Float:parseFloat	(Ljava/lang/String;)F
    //   307: fstore 8
    //   309: new 20	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord
    //   312: astore 9
    //   314: aload 9
    //   316: aload 5
    //   318: lload 6
    //   320: fload 8
    //   322: invokespecial 354	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord:<init>	(Ljava/lang/String;JF)V
    //   325: aload 4
    //   327: aload 9
    //   329: invokeinterface 184 2 0
    //   334: pop
    //   335: goto -188 -> 147
    //   338: astore 4
    //   340: aload_1
    //   341: ifnull +7 -> 348
    //   344: aload_1
    //   345: invokevirtual 333	java/io/FileInputStream:close	()V
    //   348: aload 4
    //   350: athrow
    //   351: astore_1
    //   352: goto -4 -> 348
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	355	0	this	ActivityChooserModel
    //   11	7	1	localFileInputStream	java.io.FileInputStream
    //   46	78	1	localFileNotFoundException	java.io.FileNotFoundException
    //   130	34	1	localIOException1	java.io.IOException
    //   170	90	1	localIOException2	java.io.IOException
    //   266	79	1	localIOException3	java.io.IOException
    //   351	1	1	localIOException4	java.io.IOException
    //   15	36	2	localXmlPullParser	org.xmlpull.v1.XmlPullParser
    //   78	109	2	localXmlPullParserException	org.xmlpull.v1.XmlPullParserException
    //   214	82	2	localIOException5	java.io.IOException
    //   25	157	3	i	int
    //   65	261	4	localObject1	Object
    //   338	11	4	localObject2	Object
    //   87	230	5	localObject3	Object
    //   293	26	6	l	long
    //   307	14	8	f	float
    //   312	16	9	localHistoricalRecord	HistoricalRecord
    // Exception table:
    //   from	to	target	type
    //   0	12	46	java/io/FileNotFoundException
    //   12	24	78	org/xmlpull/v1/XmlPullParserException
    //   36	43	78	org/xmlpull/v1/XmlPullParserException
    //   48	78	78	org/xmlpull/v1/XmlPullParserException
    //   134	147	78	org/xmlpull/v1/XmlPullParserException
    //   147	154	78	org/xmlpull/v1/XmlPullParserException
    //   184	214	78	org/xmlpull/v1/XmlPullParserException
    //   270	335	78	org/xmlpull/v1/XmlPullParserException
    //   123	127	130	java/io/IOException
    //   163	167	170	java/io/IOException
    //   12	24	214	java/io/IOException
    //   36	43	214	java/io/IOException
    //   48	78	214	java/io/IOException
    //   134	147	214	java/io/IOException
    //   147	154	214	java/io/IOException
    //   184	214	214	java/io/IOException
    //   270	335	214	java/io/IOException
    //   259	263	266	java/io/IOException
    //   12	24	338	finally
    //   36	43	338	finally
    //   48	78	338	finally
    //   79	119	338	finally
    //   134	147	338	finally
    //   147	154	338	finally
    //   184	214	338	finally
    //   215	255	338	finally
    //   270	335	338	finally
    //   344	348	351	java/io/IOException
  }
  
  private boolean sortActivitiesIfNeeded()
  {
    if ((this.mActivitySorter != null) && (this.mIntent != null) && (!this.mActivities.isEmpty()) && (!this.mHistoricalRecords.isEmpty())) {
      this.mActivitySorter.sort(this.mIntent, this.mActivities, Collections.unmodifiableList(this.mHistoricalRecords));
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public Intent chooseActivity(int paramInt)
  {
    synchronized (this.mInstanceLock)
    {
      if (this.mIntent == null) {}
      ComponentName localComponentName;
      for (Object localObject2 = null;; localObject2 = null)
      {
        return (Intent)localObject2;
        ensureConsistentState();
        localObject2 = (ActivityResolveInfo)this.mActivities.get(paramInt);
        localComponentName = new android/content/ComponentName;
        localComponentName.<init>(((ActivityResolveInfo)localObject2).resolveInfo.activityInfo.packageName, ((ActivityResolveInfo)localObject2).resolveInfo.activityInfo.name);
        localObject2 = new android/content/Intent;
        ((Intent)localObject2).<init>(this.mIntent);
        ((Intent)localObject2).setComponent(localComponentName);
        if (this.mActivityChoserModelPolicy == null) {
          break;
        }
        localObject4 = new android/content/Intent;
        ((Intent)localObject4).<init>((Intent)localObject2);
        if (!this.mActivityChoserModelPolicy.onChooseActivity(this, (Intent)localObject4)) {
          break;
        }
      }
      Object localObject4 = new android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
      ((HistoricalRecord)localObject4).<init>(localComponentName, System.currentTimeMillis(), 1.0F);
      addHisoricalRecord((HistoricalRecord)localObject4);
    }
  }
  
  public ResolveInfo getActivity(int paramInt)
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      ResolveInfo localResolveInfo = ((ActivityResolveInfo)this.mActivities.get(paramInt)).resolveInfo;
      return localResolveInfo;
    }
  }
  
  public int getActivityCount()
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      int i = this.mActivities.size();
      return i;
    }
  }
  
  public int getActivityIndex(ResolveInfo paramResolveInfo)
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      List localList = this.mActivities;
      int i = localList.size();
      for (int j = 0; j < i; j++) {
        if (((ActivityResolveInfo)localList.get(j)).resolveInfo == paramResolveInfo) {
          return j;
        }
      }
      j = -1;
    }
  }
  
  public ResolveInfo getDefaultActivity()
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      if (!this.mActivities.isEmpty())
      {
        localResolveInfo = ((ActivityResolveInfo)this.mActivities.get(0)).resolveInfo;
        return localResolveInfo;
      }
      ResolveInfo localResolveInfo = null;
    }
  }
  
  public int getHistoryMaxSize()
  {
    synchronized (this.mInstanceLock)
    {
      int i = this.mHistoryMaxSize;
      return i;
    }
  }
  
  public int getHistorySize()
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      int i = this.mHistoricalRecords.size();
      return i;
    }
  }
  
  public Intent getIntent()
  {
    synchronized (this.mInstanceLock)
    {
      Intent localIntent = this.mIntent;
      return localIntent;
    }
  }
  
  public void setActivitySorter(ActivitySorter paramActivitySorter)
  {
    synchronized (this.mInstanceLock)
    {
      if (this.mActivitySorter == paramActivitySorter) {
        return;
      }
      this.mActivitySorter = paramActivitySorter;
      if (sortActivitiesIfNeeded()) {
        notifyChanged();
      }
    }
  }
  
  public void setDefaultActivity(int paramInt)
  {
    synchronized (this.mInstanceLock)
    {
      ensureConsistentState();
      Object localObject2 = (ActivityResolveInfo)this.mActivities.get(paramInt);
      Object localObject3 = (ActivityResolveInfo)this.mActivities.get(0);
      if (localObject3 != null)
      {
        f = ((ActivityResolveInfo)localObject3).weight - ((ActivityResolveInfo)localObject2).weight + 5.0F;
        localObject3 = new android/content/ComponentName;
        ((ComponentName)localObject3).<init>(((ActivityResolveInfo)localObject2).resolveInfo.activityInfo.packageName, ((ActivityResolveInfo)localObject2).resolveInfo.activityInfo.name);
        localObject2 = new android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
        ((HistoricalRecord)localObject2).<init>((ComponentName)localObject3, System.currentTimeMillis(), f);
        addHisoricalRecord((HistoricalRecord)localObject2);
        return;
      }
      float f = 1.0F;
    }
  }
  
  public void setHistoryMaxSize(int paramInt)
  {
    synchronized (this.mInstanceLock)
    {
      if (this.mHistoryMaxSize == paramInt) {
        return;
      }
      this.mHistoryMaxSize = paramInt;
      pruneExcessiveHistoricalRecordsIfNeeded();
      if (sortActivitiesIfNeeded()) {
        notifyChanged();
      }
    }
  }
  
  public void setIntent(Intent paramIntent)
  {
    synchronized (this.mInstanceLock)
    {
      if (this.mIntent == paramIntent) {
        return;
      }
      this.mIntent = paramIntent;
      this.mReloadActivities = true;
      ensureConsistentState();
    }
  }
  
  public void setOnChooseActivityListener(OnChooseActivityListener paramOnChooseActivityListener)
  {
    synchronized (this.mInstanceLock)
    {
      this.mActivityChoserModelPolicy = paramOnChooseActivityListener;
      return;
    }
  }
  
  public static abstract interface ActivityChooserModelClient
  {
    public abstract void setActivityChooserModel(ActivityChooserModel paramActivityChooserModel);
  }
  
  public final class ActivityResolveInfo
    implements Comparable<ActivityResolveInfo>
  {
    public final ResolveInfo resolveInfo;
    public float weight;
    
    public ActivityResolveInfo(ResolveInfo paramResolveInfo)
    {
      this.resolveInfo = paramResolveInfo;
    }
    
    public int compareTo(ActivityResolveInfo paramActivityResolveInfo)
    {
      return Float.floatToIntBits(paramActivityResolveInfo.weight) - Float.floatToIntBits(this.weight);
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool = true;
      if (this == paramObject) {}
      for (;;)
      {
        return bool;
        if (paramObject == null)
        {
          bool = false;
        }
        else if (getClass() != paramObject.getClass())
        {
          bool = false;
        }
        else
        {
          paramObject = (ActivityResolveInfo)paramObject;
          if (Float.floatToIntBits(this.weight) != Float.floatToIntBits(((ActivityResolveInfo)paramObject).weight)) {
            bool = false;
          }
        }
      }
    }
    
    public int hashCode()
    {
      return Float.floatToIntBits(this.weight) + 31;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("resolveInfo:").append(this.resolveInfo.toString());
      localStringBuilder.append("; weight:").append(new BigDecimal(this.weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  public static abstract interface ActivitySorter
  {
    public abstract void sort(Intent paramIntent, List<ActivityChooserModel.ActivityResolveInfo> paramList, List<ActivityChooserModel.HistoricalRecord> paramList1);
  }
  
  private final class DefaultSorter
    implements ActivityChooserModel.ActivitySorter
  {
    private static final float WEIGHT_DECAY_COEFFICIENT = 0.95F;
    private final Map<String, ActivityChooserModel.ActivityResolveInfo> mPackageNameToActivityMap = new HashMap();
    
    private DefaultSorter() {}
    
    public void sort(Intent paramIntent, List<ActivityChooserModel.ActivityResolveInfo> paramList, List<ActivityChooserModel.HistoricalRecord> paramList1)
    {
      paramIntent = this.mPackageNameToActivityMap;
      paramIntent.clear();
      int i = paramList.size();
      Object localObject;
      for (int j = 0; j < i; j++)
      {
        localObject = (ActivityChooserModel.ActivityResolveInfo)paramList.get(j);
        ((ActivityChooserModel.ActivityResolveInfo)localObject).weight = 0.0F;
        paramIntent.put(((ActivityChooserModel.ActivityResolveInfo)localObject).resolveInfo.activityInfo.packageName, localObject);
      }
      j = paramList1.size();
      float f1 = 1.0F;
      j--;
      while (j >= 0)
      {
        localObject = (ActivityChooserModel.HistoricalRecord)paramList1.get(j);
        ActivityChooserModel.ActivityResolveInfo localActivityResolveInfo = (ActivityChooserModel.ActivityResolveInfo)paramIntent.get(((ActivityChooserModel.HistoricalRecord)localObject).activity.getPackageName());
        float f2 = f1;
        if (localActivityResolveInfo != null)
        {
          localActivityResolveInfo.weight += ((ActivityChooserModel.HistoricalRecord)localObject).weight * f1;
          f2 = f1 * 0.95F;
        }
        j--;
        f1 = f2;
      }
      Collections.sort(paramList);
    }
  }
  
  public static final class HistoricalRecord
  {
    public final ComponentName activity;
    public final long time;
    public final float weight;
    
    public HistoricalRecord(ComponentName paramComponentName, long paramLong, float paramFloat)
    {
      this.activity = paramComponentName;
      this.time = paramLong;
      this.weight = paramFloat;
    }
    
    public HistoricalRecord(String paramString, long paramLong, float paramFloat)
    {
      this(ComponentName.unflattenFromString(paramString), paramLong, paramFloat);
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool = true;
      if (this == paramObject) {}
      for (;;)
      {
        return bool;
        if (paramObject == null)
        {
          bool = false;
        }
        else if (getClass() != paramObject.getClass())
        {
          bool = false;
        }
        else
        {
          paramObject = (HistoricalRecord)paramObject;
          if (this.activity == null)
          {
            if (((HistoricalRecord)paramObject).activity != null) {
              bool = false;
            }
          }
          else if (!this.activity.equals(((HistoricalRecord)paramObject).activity))
          {
            bool = false;
            continue;
          }
          if (this.time != ((HistoricalRecord)paramObject).time) {
            bool = false;
          } else if (Float.floatToIntBits(this.weight) != Float.floatToIntBits(((HistoricalRecord)paramObject).weight)) {
            bool = false;
          }
        }
      }
    }
    
    public int hashCode()
    {
      if (this.activity == null) {}
      for (int i = 0;; i = this.activity.hashCode()) {
        return ((i + 31) * 31 + (int)(this.time ^ this.time >>> 32)) * 31 + Float.floatToIntBits(this.weight);
      }
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("; activity:").append(this.activity);
      localStringBuilder.append("; time:").append(this.time);
      localStringBuilder.append("; weight:").append(new BigDecimal(this.weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  public static abstract interface OnChooseActivityListener
  {
    public abstract boolean onChooseActivity(ActivityChooserModel paramActivityChooserModel, Intent paramIntent);
  }
  
  private final class PersistHistoryAsyncTask
    extends AsyncTask<Object, Void, Void>
  {
    private PersistHistoryAsyncTask() {}
    
    /* Error */
    public Void doInBackground(Object... paramVarArgs)
    {
      // Byte code:
      //   0: aload_1
      //   1: iconst_0
      //   2: aaload
      //   3: checkcast 36	java/util/List
      //   6: astore_2
      //   7: aload_1
      //   8: iconst_1
      //   9: aaload
      //   10: checkcast 38	java/lang/String
      //   13: astore_3
      //   14: aload_0
      //   15: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   18: invokestatic 42	android/support/v7/internal/widget/ActivityChooserModel:access$200	(Landroid/support/v7/internal/widget/ActivityChooserModel;)Landroid/content/Context;
      //   21: aload_3
      //   22: iconst_0
      //   23: invokevirtual 48	android/content/Context:openFileOutput	(Ljava/lang/String;I)Ljava/io/FileOutputStream;
      //   26: astore_1
      //   27: invokestatic 54	android/util/Xml:newSerializer	()Lorg/xmlpull/v1/XmlSerializer;
      //   30: astore 4
      //   32: aload 4
      //   34: aload_1
      //   35: aconst_null
      //   36: invokeinterface 60 3 0
      //   41: aload 4
      //   43: ldc 62
      //   45: iconst_1
      //   46: invokestatic 68	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   49: invokeinterface 72 3 0
      //   54: aload 4
      //   56: aconst_null
      //   57: ldc 74
      //   59: invokeinterface 78 3 0
      //   64: pop
      //   65: aload_2
      //   66: invokeinterface 82 1 0
      //   71: istore 5
      //   73: iconst_0
      //   74: istore 6
      //   76: iload 6
      //   78: iload 5
      //   80: if_icmpge +126 -> 206
      //   83: aload_2
      //   84: iconst_0
      //   85: invokeinterface 86 2 0
      //   90: checkcast 88	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord
      //   93: astore_3
      //   94: aload 4
      //   96: aconst_null
      //   97: ldc 90
      //   99: invokeinterface 78 3 0
      //   104: pop
      //   105: aload 4
      //   107: aconst_null
      //   108: ldc 92
      //   110: aload_3
      //   111: getfield 95	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord:activity	Landroid/content/ComponentName;
      //   114: invokevirtual 101	android/content/ComponentName:flattenToString	()Ljava/lang/String;
      //   117: invokeinterface 105 4 0
      //   122: pop
      //   123: aload 4
      //   125: aconst_null
      //   126: ldc 107
      //   128: aload_3
      //   129: getfield 110	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord:time	J
      //   132: invokestatic 113	java/lang/String:valueOf	(J)Ljava/lang/String;
      //   135: invokeinterface 105 4 0
      //   140: pop
      //   141: aload 4
      //   143: aconst_null
      //   144: ldc 115
      //   146: aload_3
      //   147: getfield 118	android/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord:weight	F
      //   150: invokestatic 121	java/lang/String:valueOf	(F)Ljava/lang/String;
      //   153: invokeinterface 105 4 0
      //   158: pop
      //   159: aload 4
      //   161: aconst_null
      //   162: ldc 90
      //   164: invokeinterface 124 3 0
      //   169: pop
      //   170: iinc 6 1
      //   173: goto -97 -> 76
      //   176: astore_1
      //   177: invokestatic 127	android/support/v7/internal/widget/ActivityChooserModel:access$300	()Ljava/lang/String;
      //   180: new 129	java/lang/StringBuilder
      //   183: dup
      //   184: invokespecial 130	java/lang/StringBuilder:<init>	()V
      //   187: ldc -124
      //   189: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   192: aload_3
      //   193: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   196: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   199: aload_1
      //   200: invokestatic 145	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   203: pop
      //   204: aconst_null
      //   205: areturn
      //   206: aload 4
      //   208: aconst_null
      //   209: ldc 74
      //   211: invokeinterface 124 3 0
      //   216: pop
      //   217: aload 4
      //   219: invokeinterface 148 1 0
      //   224: aload_0
      //   225: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   228: iconst_1
      //   229: invokestatic 152	android/support/v7/internal/widget/ActivityChooserModel:access$502	(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
      //   232: pop
      //   233: aload_1
      //   234: ifnull +7 -> 241
      //   237: aload_1
      //   238: invokevirtual 157	java/io/FileOutputStream:close	()V
      //   241: goto -37 -> 204
      //   244: astore_3
      //   245: invokestatic 127	android/support/v7/internal/widget/ActivityChooserModel:access$300	()Ljava/lang/String;
      //   248: astore_2
      //   249: new 129	java/lang/StringBuilder
      //   252: astore 4
      //   254: aload 4
      //   256: invokespecial 130	java/lang/StringBuilder:<init>	()V
      //   259: aload_2
      //   260: aload 4
      //   262: ldc -124
      //   264: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   267: aload_0
      //   268: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   271: invokestatic 161	android/support/v7/internal/widget/ActivityChooserModel:access$400	(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;
      //   274: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   277: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   280: aload_3
      //   281: invokestatic 145	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   284: pop
      //   285: aload_0
      //   286: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   289: iconst_1
      //   290: invokestatic 152	android/support/v7/internal/widget/ActivityChooserModel:access$502	(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
      //   293: pop
      //   294: aload_1
      //   295: ifnull -54 -> 241
      //   298: aload_1
      //   299: invokevirtual 157	java/io/FileOutputStream:close	()V
      //   302: goto -61 -> 241
      //   305: astore_1
      //   306: goto -65 -> 241
      //   309: astore_3
      //   310: invokestatic 127	android/support/v7/internal/widget/ActivityChooserModel:access$300	()Ljava/lang/String;
      //   313: astore 4
      //   315: new 129	java/lang/StringBuilder
      //   318: astore_2
      //   319: aload_2
      //   320: invokespecial 130	java/lang/StringBuilder:<init>	()V
      //   323: aload 4
      //   325: aload_2
      //   326: ldc -124
      //   328: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   331: aload_0
      //   332: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   335: invokestatic 161	android/support/v7/internal/widget/ActivityChooserModel:access$400	(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;
      //   338: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   341: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   344: aload_3
      //   345: invokestatic 145	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   348: pop
      //   349: aload_0
      //   350: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   353: iconst_1
      //   354: invokestatic 152	android/support/v7/internal/widget/ActivityChooserModel:access$502	(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
      //   357: pop
      //   358: aload_1
      //   359: ifnull -118 -> 241
      //   362: aload_1
      //   363: invokevirtual 157	java/io/FileOutputStream:close	()V
      //   366: goto -125 -> 241
      //   369: astore_1
      //   370: goto -129 -> 241
      //   373: astore 4
      //   375: invokestatic 127	android/support/v7/internal/widget/ActivityChooserModel:access$300	()Ljava/lang/String;
      //   378: astore_2
      //   379: new 129	java/lang/StringBuilder
      //   382: astore_3
      //   383: aload_3
      //   384: invokespecial 130	java/lang/StringBuilder:<init>	()V
      //   387: aload_2
      //   388: aload_3
      //   389: ldc -124
      //   391: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   394: aload_0
      //   395: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   398: invokestatic 161	android/support/v7/internal/widget/ActivityChooserModel:access$400	(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;
      //   401: invokevirtual 136	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   404: invokevirtual 139	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   407: aload 4
      //   409: invokestatic 145	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   412: pop
      //   413: aload_0
      //   414: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   417: iconst_1
      //   418: invokestatic 152	android/support/v7/internal/widget/ActivityChooserModel:access$502	(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
      //   421: pop
      //   422: aload_1
      //   423: ifnull -182 -> 241
      //   426: aload_1
      //   427: invokevirtual 157	java/io/FileOutputStream:close	()V
      //   430: goto -189 -> 241
      //   433: astore_1
      //   434: goto -193 -> 241
      //   437: astore_2
      //   438: aload_0
      //   439: getfield 14	android/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask:this$0	Landroid/support/v7/internal/widget/ActivityChooserModel;
      //   442: iconst_1
      //   443: invokestatic 152	android/support/v7/internal/widget/ActivityChooserModel:access$502	(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
      //   446: pop
      //   447: aload_1
      //   448: ifnull +7 -> 455
      //   451: aload_1
      //   452: invokevirtual 157	java/io/FileOutputStream:close	()V
      //   455: aload_2
      //   456: athrow
      //   457: astore_1
      //   458: goto -217 -> 241
      //   461: astore_1
      //   462: goto -7 -> 455
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	465	0	this	PersistHistoryAsyncTask
      //   0	465	1	paramVarArgs	Object[]
      //   6	382	2	localObject1	Object
      //   437	19	2	localObject2	Object
      //   13	180	3	localObject3	Object
      //   244	37	3	localIllegalArgumentException	IllegalArgumentException
      //   309	36	3	localIllegalStateException	IllegalStateException
      //   382	7	3	localStringBuilder	StringBuilder
      //   30	294	4	localObject4	Object
      //   373	35	4	localIOException	java.io.IOException
      //   71	10	5	i	int
      //   74	97	6	j	int
      // Exception table:
      //   from	to	target	type
      //   14	27	176	java/io/FileNotFoundException
      //   32	73	244	java/lang/IllegalArgumentException
      //   83	170	244	java/lang/IllegalArgumentException
      //   206	224	244	java/lang/IllegalArgumentException
      //   298	302	305	java/io/IOException
      //   32	73	309	java/lang/IllegalStateException
      //   83	170	309	java/lang/IllegalStateException
      //   206	224	309	java/lang/IllegalStateException
      //   362	366	369	java/io/IOException
      //   32	73	373	java/io/IOException
      //   83	170	373	java/io/IOException
      //   206	224	373	java/io/IOException
      //   426	430	433	java/io/IOException
      //   32	73	437	finally
      //   83	170	437	finally
      //   206	224	437	finally
      //   245	285	437	finally
      //   310	349	437	finally
      //   375	413	437	finally
      //   237	241	457	java/io/IOException
      //   451	455	461	java/io/IOException
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/ActivityChooserModel.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */