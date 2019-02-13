package com.mobnetic.coinguardian.db.content;

import android.database.Cursor;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.robotoworks.mechanoid.db.AbstractValuesBuilder;
import com.robotoworks.mechanoid.db.ActiveRecord;
import com.robotoworks.mechanoid.db.ActiveRecordFactory;

public class CheckerRecord
  extends ActiveRecord
  implements Parcelable
{
  public static final Parcelable.Creator<CheckerRecord> CREATOR = new Parcelable.Creator()
  {
    public CheckerRecord createFromParcel(Parcel paramAnonymousParcel)
    {
      return new CheckerRecord(paramAnonymousParcel, null);
    }
    
    public CheckerRecord[] newArray(int paramAnonymousInt)
    {
      return new CheckerRecord[paramAnonymousInt];
    }
  };
  public static String[] PROJECTION = { "_id", "enabled", "marketKey", "currencySrc", "currencyDst", "frequency", "notificationPriority", "ttsEnabled", "lastCheckTicker", "lastCheckPointTicker", "previousCheckTicker", "lastCheckDate", "sortOrder", "currencySubunitSrc", "currencySubunitDst", "errorMsg", "currencyPairId", "contractType" };
  private static ActiveRecordFactory<CheckerRecord> sFactory = new ActiveRecordFactory()
  {
    public CheckerRecord create(Cursor paramAnonymousCursor)
    {
      return CheckerRecord.fromCursor(paramAnonymousCursor);
    }
    
    public String[] getProjection()
    {
      return CheckerRecord.PROJECTION;
    }
  };
  private long mContractType;
  private boolean mContractTypeDirty;
  private String mCurrencyDst;
  private boolean mCurrencyDstDirty;
  private String mCurrencyPairId;
  private boolean mCurrencyPairIdDirty;
  private String mCurrencySrc;
  private boolean mCurrencySrcDirty;
  private long mCurrencySubunitDst;
  private boolean mCurrencySubunitDstDirty;
  private long mCurrencySubunitSrc;
  private boolean mCurrencySubunitSrcDirty;
  private boolean mEnabled;
  private boolean mEnabledDirty;
  private String mErrorMsg;
  private boolean mErrorMsgDirty;
  private long mFrequency;
  private boolean mFrequencyDirty;
  private long mLastCheckDate;
  private boolean mLastCheckDateDirty;
  private String mLastCheckPointTicker;
  private boolean mLastCheckPointTickerDirty;
  private String mLastCheckTicker;
  private boolean mLastCheckTickerDirty;
  private String mMarketKey;
  private boolean mMarketKeyDirty;
  private long mNotificationPriority;
  private boolean mNotificationPriorityDirty;
  private String mPreviousCheckTicker;
  private boolean mPreviousCheckTickerDirty;
  private long mSortOrder;
  private boolean mSortOrderDirty;
  private boolean mTtsEnabled;
  private boolean mTtsEnabledDirty;
  
  public CheckerRecord()
  {
    super(MaindbContract.Checker.CONTENT_URI);
  }
  
  private CheckerRecord(Parcel paramParcel)
  {
    super(MaindbContract.Checker.CONTENT_URI);
    setId(paramParcel.readLong());
    if (paramParcel.readInt() > 0)
    {
      bool = true;
      this.mEnabled = bool;
      this.mMarketKey = paramParcel.readString();
      this.mCurrencySrc = paramParcel.readString();
      this.mCurrencyDst = paramParcel.readString();
      this.mFrequency = paramParcel.readLong();
      this.mNotificationPriority = paramParcel.readLong();
      if (paramParcel.readInt() <= 0) {
        break label309;
      }
    }
    label309:
    for (boolean bool = true;; bool = false)
    {
      this.mTtsEnabled = bool;
      this.mLastCheckTicker = paramParcel.readString();
      this.mLastCheckPointTicker = paramParcel.readString();
      this.mPreviousCheckTicker = paramParcel.readString();
      this.mLastCheckDate = paramParcel.readLong();
      this.mSortOrder = paramParcel.readLong();
      this.mCurrencySubunitSrc = paramParcel.readLong();
      this.mCurrencySubunitDst = paramParcel.readLong();
      this.mErrorMsg = paramParcel.readString();
      this.mCurrencyPairId = paramParcel.readString();
      this.mContractType = paramParcel.readLong();
      boolean[] arrayOfBoolean = new boolean[17];
      paramParcel.readBooleanArray(arrayOfBoolean);
      this.mEnabledDirty = arrayOfBoolean[0];
      this.mMarketKeyDirty = arrayOfBoolean[1];
      this.mCurrencySrcDirty = arrayOfBoolean[2];
      this.mCurrencyDstDirty = arrayOfBoolean[3];
      this.mFrequencyDirty = arrayOfBoolean[4];
      this.mNotificationPriorityDirty = arrayOfBoolean[5];
      this.mTtsEnabledDirty = arrayOfBoolean[6];
      this.mLastCheckTickerDirty = arrayOfBoolean[7];
      this.mLastCheckPointTickerDirty = arrayOfBoolean[8];
      this.mPreviousCheckTickerDirty = arrayOfBoolean[9];
      this.mLastCheckDateDirty = arrayOfBoolean[10];
      this.mSortOrderDirty = arrayOfBoolean[11];
      this.mCurrencySubunitSrcDirty = arrayOfBoolean[12];
      this.mCurrencySubunitDstDirty = arrayOfBoolean[13];
      this.mErrorMsgDirty = arrayOfBoolean[14];
      this.mCurrencyPairIdDirty = arrayOfBoolean[15];
      this.mContractTypeDirty = arrayOfBoolean[16];
      return;
      bool = false;
      break;
    }
  }
  
  public static CheckerRecord fromBundle(Bundle paramBundle, String paramString)
  {
    paramBundle.setClassLoader(CheckerRecord.class.getClassLoader());
    return (CheckerRecord)paramBundle.getParcelable(paramString);
  }
  
  public static CheckerRecord fromCursor(Cursor paramCursor)
  {
    CheckerRecord localCheckerRecord = new CheckerRecord();
    localCheckerRecord.setPropertiesFromCursor(paramCursor);
    localCheckerRecord.makeDirty(false);
    return localCheckerRecord;
  }
  
  /* Error */
  public static CheckerRecord get(long paramLong)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: invokestatic 249	com/robotoworks/mechanoid/Mechanoid:getContentResolver	()Landroid/content/ContentResolver;
    //   5: astore_3
    //   6: aload_3
    //   7: getstatic 115	com/mobnetic/coinguardian/db/content/MaindbContract$Checker:CONTENT_URI	Landroid/net/Uri;
    //   10: invokevirtual 255	android/net/Uri:buildUpon	()Landroid/net/Uri$Builder;
    //   13: lload_0
    //   14: invokestatic 259	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   17: invokevirtual 265	android/net/Uri$Builder:appendPath	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   20: invokevirtual 269	android/net/Uri$Builder:build	()Landroid/net/Uri;
    //   23: getstatic 108	com/mobnetic/coinguardian/db/content/CheckerRecord:PROJECTION	[Ljava/lang/String;
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 275	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_3
    //   33: aload_3
    //   34: astore_2
    //   35: aload_3
    //   36: invokeinterface 281 1 0
    //   41: istore 4
    //   43: iload 4
    //   45: ifne +11 -> 56
    //   48: aload_3
    //   49: invokestatic 286	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   52: aconst_null
    //   53: astore_2
    //   54: aload_2
    //   55: areturn
    //   56: aload_3
    //   57: astore_2
    //   58: aload_3
    //   59: invokestatic 288	com/mobnetic/coinguardian/db/content/CheckerRecord:fromCursor	(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    //   62: astore 5
    //   64: aload 5
    //   66: astore_2
    //   67: aload_3
    //   68: invokestatic 286	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   71: goto -17 -> 54
    //   74: astore_3
    //   75: aload_2
    //   76: invokestatic 286	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   79: aload_3
    //   80: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	paramLong	long
    //   1	75	2	localObject1	Object
    //   5	63	3	localObject2	Object
    //   74	6	3	localObject3	Object
    //   41	3	4	bool	boolean
    //   62	3	5	localCheckerRecord	CheckerRecord
    // Exception table:
    //   from	to	target	type
    //   6	33	74	finally
    //   35	43	74	finally
    //   58	64	74	finally
  }
  
  public static ActiveRecordFactory<CheckerRecord> getFactory()
  {
    return sFactory;
  }
  
  protected String[] _getProjection()
  {
    return PROJECTION;
  }
  
  protected AbstractValuesBuilder createBuilder()
  {
    MaindbContract.Checker.Builder localBuilder = MaindbContract.Checker.newBuilder();
    if (this.mEnabledDirty) {
      localBuilder.setEnabled(this.mEnabled);
    }
    if (this.mMarketKeyDirty) {
      localBuilder.setMarketKey(this.mMarketKey);
    }
    if (this.mCurrencySrcDirty) {
      localBuilder.setCurrencySrc(this.mCurrencySrc);
    }
    if (this.mCurrencyDstDirty) {
      localBuilder.setCurrencyDst(this.mCurrencyDst);
    }
    if (this.mFrequencyDirty) {
      localBuilder.setFrequency(this.mFrequency);
    }
    if (this.mNotificationPriorityDirty) {
      localBuilder.setNotificationPriority(this.mNotificationPriority);
    }
    if (this.mTtsEnabledDirty) {
      localBuilder.setTtsEnabled(this.mTtsEnabled);
    }
    if (this.mLastCheckTickerDirty) {
      localBuilder.setLastCheckTicker(this.mLastCheckTicker);
    }
    if (this.mLastCheckPointTickerDirty) {
      localBuilder.setLastCheckPointTicker(this.mLastCheckPointTicker);
    }
    if (this.mPreviousCheckTickerDirty) {
      localBuilder.setPreviousCheckTicker(this.mPreviousCheckTicker);
    }
    if (this.mLastCheckDateDirty) {
      localBuilder.setLastCheckDate(this.mLastCheckDate);
    }
    if (this.mSortOrderDirty) {
      localBuilder.setSortOrder(this.mSortOrder);
    }
    if (this.mCurrencySubunitSrcDirty) {
      localBuilder.setCurrencySubunitSrc(this.mCurrencySubunitSrc);
    }
    if (this.mCurrencySubunitDstDirty) {
      localBuilder.setCurrencySubunitDst(this.mCurrencySubunitDst);
    }
    if (this.mErrorMsgDirty) {
      localBuilder.setErrorMsg(this.mErrorMsg);
    }
    if (this.mCurrencyPairIdDirty) {
      localBuilder.setCurrencyPairId(this.mCurrencyPairId);
    }
    if (this.mContractTypeDirty) {
      localBuilder.setContractType(this.mContractType);
    }
    return localBuilder;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public long getContractType()
  {
    return this.mContractType;
  }
  
  public String getCurrencyDst()
  {
    return this.mCurrencyDst;
  }
  
  public String getCurrencyPairId()
  {
    return this.mCurrencyPairId;
  }
  
  public String getCurrencySrc()
  {
    return this.mCurrencySrc;
  }
  
  public long getCurrencySubunitDst()
  {
    return this.mCurrencySubunitDst;
  }
  
  public long getCurrencySubunitSrc()
  {
    return this.mCurrencySubunitSrc;
  }
  
  public boolean getEnabled()
  {
    return this.mEnabled;
  }
  
  public String getErrorMsg()
  {
    return this.mErrorMsg;
  }
  
  public long getFrequency()
  {
    return this.mFrequency;
  }
  
  public long getLastCheckDate()
  {
    return this.mLastCheckDate;
  }
  
  public String getLastCheckPointTicker()
  {
    return this.mLastCheckPointTicker;
  }
  
  public String getLastCheckTicker()
  {
    return this.mLastCheckTicker;
  }
  
  public String getMarketKey()
  {
    return this.mMarketKey;
  }
  
  public long getNotificationPriority()
  {
    return this.mNotificationPriority;
  }
  
  public String getPreviousCheckTicker()
  {
    return this.mPreviousCheckTicker;
  }
  
  public long getSortOrder()
  {
    return this.mSortOrder;
  }
  
  public boolean getTtsEnabled()
  {
    return this.mTtsEnabled;
  }
  
  public void makeDirty(boolean paramBoolean)
  {
    this.mEnabledDirty = paramBoolean;
    this.mMarketKeyDirty = paramBoolean;
    this.mCurrencySrcDirty = paramBoolean;
    this.mCurrencyDstDirty = paramBoolean;
    this.mFrequencyDirty = paramBoolean;
    this.mNotificationPriorityDirty = paramBoolean;
    this.mTtsEnabledDirty = paramBoolean;
    this.mLastCheckTickerDirty = paramBoolean;
    this.mLastCheckPointTickerDirty = paramBoolean;
    this.mPreviousCheckTickerDirty = paramBoolean;
    this.mLastCheckDateDirty = paramBoolean;
    this.mSortOrderDirty = paramBoolean;
    this.mCurrencySubunitSrcDirty = paramBoolean;
    this.mCurrencySubunitDstDirty = paramBoolean;
    this.mErrorMsgDirty = paramBoolean;
    this.mCurrencyPairIdDirty = paramBoolean;
    this.mContractTypeDirty = paramBoolean;
  }
  
  public void setContractType(long paramLong)
  {
    this.mContractType = paramLong;
    this.mContractTypeDirty = true;
  }
  
  public void setCurrencyDst(String paramString)
  {
    this.mCurrencyDst = paramString;
    this.mCurrencyDstDirty = true;
  }
  
  public void setCurrencyPairId(String paramString)
  {
    this.mCurrencyPairId = paramString;
    this.mCurrencyPairIdDirty = true;
  }
  
  public void setCurrencySrc(String paramString)
  {
    this.mCurrencySrc = paramString;
    this.mCurrencySrcDirty = true;
  }
  
  public void setCurrencySubunitDst(long paramLong)
  {
    this.mCurrencySubunitDst = paramLong;
    this.mCurrencySubunitDstDirty = true;
  }
  
  public void setCurrencySubunitSrc(long paramLong)
  {
    this.mCurrencySubunitSrc = paramLong;
    this.mCurrencySubunitSrcDirty = true;
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    this.mEnabled = paramBoolean;
    this.mEnabledDirty = true;
  }
  
  public void setErrorMsg(String paramString)
  {
    this.mErrorMsg = paramString;
    this.mErrorMsgDirty = true;
  }
  
  public void setFrequency(long paramLong)
  {
    this.mFrequency = paramLong;
    this.mFrequencyDirty = true;
  }
  
  public void setLastCheckDate(long paramLong)
  {
    this.mLastCheckDate = paramLong;
    this.mLastCheckDateDirty = true;
  }
  
  public void setLastCheckPointTicker(String paramString)
  {
    this.mLastCheckPointTicker = paramString;
    this.mLastCheckPointTickerDirty = true;
  }
  
  public void setLastCheckTicker(String paramString)
  {
    this.mLastCheckTicker = paramString;
    this.mLastCheckTickerDirty = true;
  }
  
  public void setMarketKey(String paramString)
  {
    this.mMarketKey = paramString;
    this.mMarketKeyDirty = true;
  }
  
  public void setNotificationPriority(long paramLong)
  {
    this.mNotificationPriority = paramLong;
    this.mNotificationPriorityDirty = true;
  }
  
  public void setPreviousCheckTicker(String paramString)
  {
    this.mPreviousCheckTicker = paramString;
    this.mPreviousCheckTickerDirty = true;
  }
  
  protected void setPropertiesFromCursor(Cursor paramCursor)
  {
    boolean bool1 = true;
    setId(paramCursor.getLong(0));
    if (paramCursor.getInt(1) > 0)
    {
      bool2 = true;
      setEnabled(bool2);
      setMarketKey(paramCursor.getString(2));
      setCurrencySrc(paramCursor.getString(3));
      setCurrencyDst(paramCursor.getString(4));
      setFrequency(paramCursor.getLong(5));
      setNotificationPriority(paramCursor.getLong(6));
      if (paramCursor.getInt(7) <= 0) {
        break label230;
      }
    }
    label230:
    for (boolean bool2 = bool1;; bool2 = false)
    {
      setTtsEnabled(bool2);
      setLastCheckTicker(paramCursor.getString(8));
      setLastCheckPointTicker(paramCursor.getString(9));
      setPreviousCheckTicker(paramCursor.getString(10));
      setLastCheckDate(paramCursor.getLong(11));
      setSortOrder(paramCursor.getLong(12));
      setCurrencySubunitSrc(paramCursor.getLong(13));
      setCurrencySubunitDst(paramCursor.getLong(14));
      setErrorMsg(paramCursor.getString(15));
      setCurrencyPairId(paramCursor.getString(16));
      setContractType(paramCursor.getLong(17));
      return;
      bool2 = false;
      break;
    }
  }
  
  public void setSortOrder(long paramLong)
  {
    this.mSortOrder = paramLong;
    this.mSortOrderDirty = true;
  }
  
  public void setTtsEnabled(boolean paramBoolean)
  {
    this.mTtsEnabled = paramBoolean;
    this.mTtsEnabledDirty = true;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(getId());
    if (this.mEnabled)
    {
      paramInt = 1;
      paramParcel.writeInt(paramInt);
      paramParcel.writeString(this.mMarketKey);
      paramParcel.writeString(this.mCurrencySrc);
      paramParcel.writeString(this.mCurrencyDst);
      paramParcel.writeLong(this.mFrequency);
      paramParcel.writeLong(this.mNotificationPriority);
      if (!this.mTtsEnabled) {
        break label300;
      }
    }
    label300:
    for (paramInt = 1;; paramInt = 0)
    {
      paramParcel.writeInt(paramInt);
      paramParcel.writeString(this.mLastCheckTicker);
      paramParcel.writeString(this.mLastCheckPointTicker);
      paramParcel.writeString(this.mPreviousCheckTicker);
      paramParcel.writeLong(this.mLastCheckDate);
      paramParcel.writeLong(this.mSortOrder);
      paramParcel.writeLong(this.mCurrencySubunitSrc);
      paramParcel.writeLong(this.mCurrencySubunitDst);
      paramParcel.writeString(this.mErrorMsg);
      paramParcel.writeString(this.mCurrencyPairId);
      paramParcel.writeLong(this.mContractType);
      paramParcel.writeBooleanArray(new boolean[] { this.mEnabledDirty, this.mMarketKeyDirty, this.mCurrencySrcDirty, this.mCurrencyDstDirty, this.mFrequencyDirty, this.mNotificationPriorityDirty, this.mTtsEnabledDirty, this.mLastCheckTickerDirty, this.mLastCheckPointTickerDirty, this.mPreviousCheckTickerDirty, this.mLastCheckDateDirty, this.mSortOrderDirty, this.mCurrencySubunitSrcDirty, this.mCurrencySubunitDstDirty, this.mErrorMsgDirty, this.mCurrencyPairIdDirty, this.mContractTypeDirty });
      return;
      paramInt = 0;
      break;
    }
  }
  
  public static abstract interface Indices
  {
    public static final int CONTRACT_TYPE = 17;
    public static final int CURRENCY_DST = 4;
    public static final int CURRENCY_PAIR_ID = 16;
    public static final int CURRENCY_SRC = 3;
    public static final int CURRENCY_SUBUNIT_DST = 14;
    public static final int CURRENCY_SUBUNIT_SRC = 13;
    public static final int ENABLED = 1;
    public static final int ERROR_MSG = 15;
    public static final int FREQUENCY = 5;
    public static final int LAST_CHECK_DATE = 11;
    public static final int LAST_CHECK_POINT_TICKER = 9;
    public static final int LAST_CHECK_TICKER = 8;
    public static final int MARKET_KEY = 2;
    public static final int NOTIFICATION_PRIORITY = 6;
    public static final int PREVIOUS_CHECK_TICKER = 10;
    public static final int SORT_ORDER = 12;
    public static final int TTS_ENABLED = 7;
    public static final int _ID = 0;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/CheckerRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */