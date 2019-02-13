package com.mobnetic.coinguardian.alarm;

import android.annotation.SuppressLint;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Vibrator;
import android.util.Log;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.util.NotificationUtils;
import java.io.IOException;

public class AlarmKlaxon
  extends Service
{
  private static final int DEFAULT_ALARM_TIMEOUT_MINUTES = 10;
  private static final int KILLER = 1000;
  private static final String TAG = "AlarmKlaxon";
  private static final boolean loggingOn = false;
  private static final long[] sVibratePattern = { 500L, 500L };
  private AlarmRecord alarmRecord;
  @SuppressLint({"HandlerLeak"})
  private Handler mHandler = new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      switch (paramAnonymousMessage.what)
      {
      }
      for (;;)
      {
        return;
        AlarmKlaxon.this.sendKillBroadcast((AlarmRecord)paramAnonymousMessage.obj, false);
        AlarmKlaxon.this.stopSelf();
      }
    }
  };
  private MediaPlayer mMediaPlayer;
  private boolean mPlaying = false;
  private final BroadcastReceiver mReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      paramAnonymousContext = paramAnonymousIntent.getAction();
      Log.v("AlarmKlaxon", "AlarmAlertFullScreen - onReceive " + paramAnonymousContext);
      long l = paramAnonymousIntent.getLongExtra("checker_record_id", -1L);
      if (paramAnonymousContext.equals("com.mobnetic.coinguardian.alarm.ALARM_DISMISS")) {
        AlarmKlaxon.this.dismiss(l, false);
      }
      for (;;)
      {
        return;
        AlarmKlaxon.this.dismiss(l, paramAnonymousIntent.getBooleanExtra("alarm_replaced", false));
      }
    }
  };
  private long mStartTime;
  private Vibrator mVibrator;
  
  private void disableKiller()
  {
    this.mHandler.removeMessages(1000);
  }
  
  private void dismiss(long paramLong, boolean paramBoolean)
  {
    if ((this.alarmRecord == null) || (this.alarmRecord.getCheckerId() != paramLong)) {}
    for (;;)
    {
      return;
      NotificationUtils.clearAlarmNotificationForAlarmRecord(this, this.alarmRecord.getId());
      if (!paramBoolean) {
        stopSelf();
      }
    }
  }
  
  private void enableKiller(AlarmRecord paramAlarmRecord)
  {
    if (10 != -1) {
      this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1000, paramAlarmRecord), 10 * 60000L);
    }
  }
  
  private void play(AlarmRecord paramAlarmRecord)
  {
    stop();
    Uri localUri = RingtoneManager.getDefaultUri(4);
    this.mMediaPlayer = new MediaPlayer();
    this.mMediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener()
    {
      public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        Log.e("AlarmKlaxon", "Error occurred while playing audio.");
        paramAnonymousMediaPlayer.stop();
        paramAnonymousMediaPlayer.release();
        AlarmKlaxon.access$202(AlarmKlaxon.this, null);
        return true;
      }
    });
    try
    {
      this.mMediaPlayer.setDataSource(this, localUri);
      startAlarm(this.mMediaPlayer);
      this.mVibrator.vibrate(sVibratePattern, 0);
      enableKiller(paramAlarmRecord);
      this.mPlaying = true;
      this.mStartTime = System.currentTimeMillis();
      return;
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        Log.v("AlarmKlaxon", "Using the fallback ringtone");
        try
        {
          this.mMediaPlayer.reset();
          setDataSourceFromResource(getResources(), this.mMediaPlayer, 2131099650);
          startAlarm(this.mMediaPlayer);
        }
        catch (Exception localException2)
        {
          Log.e("AlarmKlaxon", "Failed to play fallback ringtone", localException2);
        }
      }
    }
  }
  
  private void sendKillBroadcast(AlarmRecord paramAlarmRecord, boolean paramBoolean)
  {
    dismiss(paramAlarmRecord.getCheckerId(), paramBoolean);
    int i = (int)Math.round((System.currentTimeMillis() - this.mStartTime) / 60000.0D);
    Intent localIntent = new Intent("alarm_killed");
    localIntent.putExtra("alarm_record_id", paramAlarmRecord.getId());
    localIntent.putExtra("alarm_killed_timeout", i);
    localIntent.putExtra("alarm_replaced", paramBoolean);
    sendBroadcast(localIntent);
  }
  
  private void setDataSourceFromResource(Resources paramResources, MediaPlayer paramMediaPlayer, int paramInt)
    throws IOException
  {
    paramResources = paramResources.openRawResourceFd(paramInt);
    if (paramResources != null)
    {
      paramMediaPlayer.setDataSource(paramResources.getFileDescriptor(), paramResources.getStartOffset(), paramResources.getLength());
      paramResources.close();
    }
  }
  
  private void startAlarm(MediaPlayer paramMediaPlayer)
    throws IOException, IllegalArgumentException, IllegalStateException
  {
    if (((AudioManager)getSystemService("audio")).getStreamVolume(4) != 0)
    {
      paramMediaPlayer.setAudioStreamType(4);
      paramMediaPlayer.setLooping(true);
      paramMediaPlayer.prepare();
      paramMediaPlayer.start();
    }
  }
  
  public static void stopAlarmService(Context paramContext)
  {
    paramContext.stopService(new Intent("com.mobnetic.coinguardian.alarm.ALARM_ALERT", null, paramContext, AlarmKlaxon.class));
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }
  
  public void onCreate()
  {
    this.mVibrator = ((Vibrator)getSystemService("vibrator"));
    IntentFilter localIntentFilter = new IntentFilter("alarm_killed");
    localIntentFilter.addAction("com.mobnetic.coinguardian.alarm.ALARM_DISMISS");
    registerReceiver(this.mReceiver, localIntentFilter);
    AlarmAlertWakeLock.acquireCpuWakeLock(this);
  }
  
  public void onDestroy()
  {
    stop();
    Intent localIntent = new Intent("com.mobnetic.coinguardian.alarm.ALARM_DONE");
    if (this.alarmRecord != null) {
      localIntent.putExtra("alarm_record_id", this.alarmRecord.getId());
    }
    sendBroadcast(localIntent);
    try
    {
      unregisterReceiver(this.mReceiver);
      AlarmAlertWakeLock.releaseCpuLock();
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    paramInt1 = 2;
    if (paramIntent == null) {
      stopSelf();
    }
    for (;;)
    {
      return paramInt1;
      paramIntent = AlarmRecord.get(paramIntent.getLongExtra("alarm_record_id", -1L));
      if (paramIntent == null)
      {
        Log.v("AlarmKlaxon", "AlarmKlaxon failed to parse the alarm from the intent");
        stopSelf();
      }
      else
      {
        if (this.alarmRecord != null) {
          sendKillBroadcast(this.alarmRecord, true);
        }
        play(paramIntent);
        this.alarmRecord = paramIntent;
        paramInt1 = 1;
      }
    }
  }
  
  public void stop()
  {
    if (this.mPlaying)
    {
      this.mPlaying = false;
      if (this.mMediaPlayer != null)
      {
        this.mMediaPlayer.stop();
        this.mMediaPlayer.release();
        this.mMediaPlayer = null;
      }
      this.mVibrator.cancel();
    }
    disableKiller();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/alarm/AlarmKlaxon.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */