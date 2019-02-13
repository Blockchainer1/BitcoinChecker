package com.mobnetic.coinguardian.db.content;

import android.database.Cursor;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.robotoworks.mechanoid.db.AbstractValuesBuilder;
import com.robotoworks.mechanoid.db.ActiveRecord;
import com.robotoworks.mechanoid.db.ActiveRecordFactory;

public class AlarmRecord
  extends ActiveRecord
  implements Parcelable
{
  public static final Parcelable.Creator<AlarmRecord> CREATOR = new Parcelable.Creator()
  {
    public AlarmRecord createFromParcel(Parcel paramAnonymousParcel)
    {
      return new AlarmRecord(paramAnonymousParcel, null);
    }
    
    public AlarmRecord[] newArray(int paramAnonymousInt)
    {
      return new AlarmRecord[paramAnonymousInt];
    }
  };
  public static String[] PROJECTION = { "_id", "checkerId", "enabled", "type", "value", "sound", "soundUri", "vibrate", "led", "ttsEnabled", "lastCheckPointTicker" };
  private static ActiveRecordFactory<AlarmRecord> sFactory = new ActiveRecordFactory()
  {
    public AlarmRecord create(Cursor paramAnonymousCursor)
    {
      return AlarmRecord.fromCursor(paramAnonymousCursor);
    }
    
    public String[] getProjection()
    {
      return AlarmRecord.PROJECTION;
    }
  };
  private long mCheckerId;
  private boolean mCheckerIdDirty;
  private boolean mEnabled;
  private boolean mEnabledDirty;
  private String mLastCheckPointTicker;
  private boolean mLastCheckPointTickerDirty;
  private boolean mLed;
  private boolean mLedDirty;
  private boolean mSound;
  private boolean mSoundDirty;
  private String mSoundUri;
  private boolean mSoundUriDirty;
  private boolean mTtsEnabled;
  private boolean mTtsEnabledDirty;
  private long mType;
  private boolean mTypeDirty;
  private double mValue;
  private boolean mValueDirty;
  private boolean mVibrate;
  private boolean mVibrateDirty;
  
  public AlarmRecord()
  {
    super(MaindbContract.Alarm.CONTENT_URI);
  }
  
  private AlarmRecord(Parcel paramParcel)
  {
    super(MaindbContract.Alarm.CONTENT_URI);
    setId(paramParcel.readLong());
    this.mCheckerId = paramParcel.readLong();
    if (paramParcel.readInt() > 0)
    {
      bool = true;
      this.mEnabled = bool;
      this.mType = paramParcel.readLong();
      this.mValue = paramParcel.readDouble();
      if (paramParcel.readInt() <= 0) {
        break label215;
      }
      bool = true;
      label62:
      this.mSound = bool;
      this.mSoundUri = paramParcel.readString();
      if (paramParcel.readInt() <= 0) {
        break label220;
      }
      bool = true;
      label84:
      this.mVibrate = bool;
      if (paramParcel.readInt() <= 0) {
        break label225;
      }
      bool = true;
      label98:
      this.mLed = bool;
      if (paramParcel.readInt() <= 0) {
        break label230;
      }
    }
    label215:
    label220:
    label225:
    label230:
    for (boolean bool = true;; bool = false)
    {
      this.mTtsEnabled = bool;
      this.mLastCheckPointTicker = paramParcel.readString();
      boolean[] arrayOfBoolean = new boolean[10];
      paramParcel.readBooleanArray(arrayOfBoolean);
      this.mCheckerIdDirty = arrayOfBoolean[0];
      this.mEnabledDirty = arrayOfBoolean[1];
      this.mTypeDirty = arrayOfBoolean[2];
      this.mValueDirty = arrayOfBoolean[3];
      this.mSoundDirty = arrayOfBoolean[4];
      this.mSoundUriDirty = arrayOfBoolean[5];
      this.mVibrateDirty = arrayOfBoolean[6];
      this.mLedDirty = arrayOfBoolean[7];
      this.mTtsEnabledDirty = arrayOfBoolean[8];
      this.mLastCheckPointTickerDirty = arrayOfBoolean[9];
      return;
      bool = false;
      break;
      bool = false;
      break label62;
      bool = false;
      break label84;
      bool = false;
      break label98;
    }
  }
  
  public static AlarmRecord fromBundle(Bundle paramBundle, String paramString)
  {
    paramBundle.setClassLoader(AlarmRecord.class.getClassLoader());
    return (AlarmRecord)paramBundle.getParcelable(paramString);
  }
  
  public static AlarmRecord fromCursor(Cursor paramCursor)
  {
    AlarmRecord localAlarmRecord = new AlarmRecord();
    localAlarmRecord.setPropertiesFromCursor(paramCursor);
    localAlarmRecord.makeDirty(false);
    return localAlarmRecord;
  }
  
  /* Error */
  public static AlarmRecord get(long paramLong)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: invokestatic 198	com/robotoworks/mechanoid/Mechanoid:getContentResolver	()Landroid/content/ContentResolver;
    //   5: astore_3
    //   6: aload_3
    //   7: getstatic 88	com/mobnetic/coinguardian/db/content/MaindbContract$Alarm:CONTENT_URI	Landroid/net/Uri;
    //   10: invokevirtual 204	android/net/Uri:buildUpon	()Landroid/net/Uri$Builder;
    //   13: lload_0
    //   14: invokestatic 208	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   17: invokevirtual 214	android/net/Uri$Builder:appendPath	(Ljava/lang/String;)Landroid/net/Uri$Builder;
    //   20: invokevirtual 218	android/net/Uri$Builder:build	()Landroid/net/Uri;
    //   23: getstatic 81	com/mobnetic/coinguardian/db/content/AlarmRecord:PROJECTION	[Ljava/lang/String;
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: invokevirtual 224	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_3
    //   33: aload_3
    //   34: astore_2
    //   35: aload_3
    //   36: invokeinterface 230 1 0
    //   41: istore 4
    //   43: iload 4
    //   45: ifne +11 -> 56
    //   48: aload_3
    //   49: invokestatic 235	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   52: aconst_null
    //   53: astore_2
    //   54: aload_2
    //   55: areturn
    //   56: aload_3
    //   57: astore_2
    //   58: aload_3
    //   59: invokestatic 237	com/mobnetic/coinguardian/db/content/AlarmRecord:fromCursor	(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    //   62: astore 5
    //   64: aload 5
    //   66: astore_2
    //   67: aload_3
    //   68: invokestatic 235	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   71: goto -17 -> 54
    //   74: astore_3
    //   75: aload_2
    //   76: invokestatic 235	com/robotoworks/mechanoid/util/Closeables:closeSilently	(Landroid/database/Cursor;)V
    //   79: aload_3
    //   80: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	paramLong	long
    //   1	75	2	localObject1	Object
    //   5	63	3	localObject2	Object
    //   74	6	3	localObject3	Object
    //   41	3	4	bool	boolean
    //   62	3	5	localAlarmRecord	AlarmRecord
    // Exception table:
    //   from	to	target	type
    //   6	33	74	finally
    //   35	43	74	finally
    //   58	64	74	finally
  }
  
  public static ActiveRecordFactory<AlarmRecord> getFactory()
  {
    return sFactory;
  }
  
  protected String[] _getProjection()
  {
    return PROJECTION;
  }
  
  protected AbstractValuesBuilder createBuilder()
  {
    MaindbContract.Alarm.Builder localBuilder = MaindbContract.Alarm.newBuilder();
    if (this.mCheckerIdDirty) {
      localBuilder.setCheckerId(this.mCheckerId);
    }
    if (this.mEnabledDirty) {
      localBuilder.setEnabled(this.mEnabled);
    }
    if (this.mTypeDirty) {
      localBuilder.setType(this.mType);
    }
    if (this.mValueDirty) {
      localBuilder.setValue(this.mValue);
    }
    if (this.mSoundDirty) {
      localBuilder.setSound(this.mSound);
    }
    if (this.mSoundUriDirty) {
      localBuilder.setSoundUri(this.mSoundUri);
    }
    if (this.mVibrateDirty) {
      localBuilder.setVibrate(this.mVibrate);
    }
    if (this.mLedDirty) {
      localBuilder.setLed(this.mLed);
    }
    if (this.mTtsEnabledDirty) {
      localBuilder.setTtsEnabled(this.mTtsEnabled);
    }
    if (this.mLastCheckPointTickerDirty) {
      localBuilder.setLastCheckPointTicker(this.mLastCheckPointTicker);
    }
    return localBuilder;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public long getCheckerId()
  {
    return this.mCheckerId;
  }
  
  public boolean getEnabled()
  {
    return this.mEnabled;
  }
  
  public String getLastCheckPointTicker()
  {
    return this.mLastCheckPointTicker;
  }
  
  public boolean getLed()
  {
    return this.mLed;
  }
  
  public boolean getSound()
  {
    return this.mSound;
  }
  
  public String getSoundUri()
  {
    return this.mSoundUri;
  }
  
  public boolean getTtsEnabled()
  {
    return this.mTtsEnabled;
  }
  
  public long getType()
  {
    return this.mType;
  }
  
  public double getValue()
  {
    return this.mValue;
  }
  
  public boolean getVibrate()
  {
    return this.mVibrate;
  }
  
  public void makeDirty(boolean paramBoolean)
  {
    this.mCheckerIdDirty = paramBoolean;
    this.mEnabledDirty = paramBoolean;
    this.mTypeDirty = paramBoolean;
    this.mValueDirty = paramBoolean;
    this.mSoundDirty = paramBoolean;
    this.mSoundUriDirty = paramBoolean;
    this.mVibrateDirty = paramBoolean;
    this.mLedDirty = paramBoolean;
    this.mTtsEnabledDirty = paramBoolean;
    this.mLastCheckPointTickerDirty = paramBoolean;
  }
  
  public void setCheckerId(long paramLong)
  {
    this.mCheckerId = paramLong;
    this.mCheckerIdDirty = true;
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    this.mEnabled = paramBoolean;
    this.mEnabledDirty = true;
  }
  
  public void setLastCheckPointTicker(String paramString)
  {
    this.mLastCheckPointTicker = paramString;
    this.mLastCheckPointTickerDirty = true;
  }
  
  public void setLed(boolean paramBoolean)
  {
    this.mLed = paramBoolean;
    this.mLedDirty = true;
  }
  
  protected void setPropertiesFromCursor(Cursor paramCursor)
  {
    boolean bool1 = true;
    setId(paramCursor.getLong(0));
    setCheckerId(paramCursor.getLong(1));
    if (paramCursor.getInt(2) > 0)
    {
      bool2 = true;
      setEnabled(bool2);
      setType(paramCursor.getLong(3));
      setValue(paramCursor.getDouble(4));
      if (paramCursor.getInt(5) <= 0) {
        break label164;
      }
      bool2 = true;
      label75:
      setSound(bool2);
      setSoundUri(paramCursor.getString(6));
      if (paramCursor.getInt(7) <= 0) {
        break label169;
      }
      bool2 = true;
      label105:
      setVibrate(bool2);
      if (paramCursor.getInt(8) <= 0) {
        break label174;
      }
      bool2 = true;
      label123:
      setLed(bool2);
      if (paramCursor.getInt(9) <= 0) {
        break label179;
      }
    }
    label164:
    label169:
    label174:
    label179:
    for (boolean bool2 = bool1;; bool2 = false)
    {
      setTtsEnabled(bool2);
      setLastCheckPointTicker(paramCursor.getString(10));
      return;
      bool2 = false;
      break;
      bool2 = false;
      break label75;
      bool2 = false;
      break label105;
      bool2 = false;
      break label123;
    }
  }
  
  public void setSound(boolean paramBoolean)
  {
    this.mSound = paramBoolean;
    this.mSoundDirty = true;
  }
  
  public void setSoundUri(String paramString)
  {
    this.mSoundUri = paramString;
    this.mSoundUriDirty = true;
  }
  
  public void setTtsEnabled(boolean paramBoolean)
  {
    this.mTtsEnabled = paramBoolean;
    this.mTtsEnabledDirty = true;
  }
  
  public void setType(long paramLong)
  {
    this.mType = paramLong;
    this.mTypeDirty = true;
  }
  
  public void setValue(double paramDouble)
  {
    this.mValue = paramDouble;
    this.mValueDirty = true;
  }
  
  public void setVibrate(boolean paramBoolean)
  {
    this.mVibrate = paramBoolean;
    this.mVibrateDirty = true;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(getId());
    paramParcel.writeLong(this.mCheckerId);
    if (this.mEnabled)
    {
      paramInt = 1;
      paramParcel.writeInt(paramInt);
      paramParcel.writeLong(this.mType);
      paramParcel.writeDouble(this.mValue);
      if (!this.mSound) {
        break label206;
      }
      paramInt = 1;
      label55:
      paramParcel.writeInt(paramInt);
      paramParcel.writeString(this.mSoundUri);
      if (!this.mVibrate) {
        break label211;
      }
      paramInt = 1;
      label77:
      paramParcel.writeInt(paramInt);
      if (!this.mLed) {
        break label216;
      }
      paramInt = 1;
      label91:
      paramParcel.writeInt(paramInt);
      if (!this.mTtsEnabled) {
        break label221;
      }
    }
    label206:
    label211:
    label216:
    label221:
    for (paramInt = 1;; paramInt = 0)
    {
      paramParcel.writeInt(paramInt);
      paramParcel.writeString(this.mLastCheckPointTicker);
      paramParcel.writeBooleanArray(new boolean[] { this.mCheckerIdDirty, this.mEnabledDirty, this.mTypeDirty, this.mValueDirty, this.mSoundDirty, this.mSoundUriDirty, this.mVibrateDirty, this.mLedDirty, this.mTtsEnabledDirty, this.mLastCheckPointTickerDirty });
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label55;
      paramInt = 0;
      break label77;
      paramInt = 0;
      break label91;
    }
  }
  
  public static abstract interface Indices
  {
    public static final int CHECKER_ID = 1;
    public static final int ENABLED = 2;
    public static final int LAST_CHECK_POINT_TICKER = 10;
    public static final int LED = 8;
    public static final int SOUND = 5;
    public static final int SOUND_URI = 6;
    public static final int TTS_ENABLED = 9;
    public static final int TYPE = 3;
    public static final int VALUE = 4;
    public static final int VIBRATE = 7;
    public static final int _ID = 0;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/AlarmRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */