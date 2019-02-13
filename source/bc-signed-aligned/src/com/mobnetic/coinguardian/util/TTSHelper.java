package com.mobnetic.coinguardian.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.media.AudioManager;
import android.media.AudioManager.OnAudioFocusChangeListener;
import android.os.Build.VERSION;
import android.os.PowerManager;
import android.speech.tts.TextToSpeech;
import android.speech.tts.TextToSpeech.OnInitListener;
import android.speech.tts.TextToSpeech.OnUtteranceCompletedListener;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import java.util.HashMap;
import java.util.Locale;

public class TTSHelper
{
  private static final Object LOCK = new Object();
  static final AudioManager.OnAudioFocusChangeListener afChangeListener = new AudioManager.OnAudioFocusChangeListener()
  {
    public void onAudioFocusChange(int paramAnonymousInt)
    {
      if (paramAnonymousInt == -2) {}
      for (;;)
      {
        return;
        if ((paramAnonymousInt != 1) && (paramAnonymousInt == -1)) {
          TTSHelper.access$400();
        }
      }
    }
  };
  private static AudioManager audioManager;
  private static Locale defaultLanguageLocale;
  private static String textToBeSpoken;
  private static TextToSpeech tts = null;
  
  public static int getProperAudioStream(Context paramContext)
  {
    if (isHeadsetConnected(paramContext)) {}
    for (int i = 3;; i = PreferencesUtils.getTTSAdvancedStream(paramContext)) {
      return i;
    }
  }
  
  public static void initTTS(Context paramContext, TextToSpeech.OnInitListener paramOnInitListener)
  {
    if (tts == null) {
      tts = new TextToSpeech(paramContext.getApplicationContext(), paramOnInitListener);
    }
    for (;;)
    {
      return;
      paramOnInitListener.onInit(0);
    }
  }
  
  public static boolean isHeadsetConnected(Context paramContext)
  {
    paramContext = (AudioManager)paramContext.getSystemService("audio");
    if ((paramContext.isWiredHeadsetOn()) || (paramContext.isBluetoothA2dpOn())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static boolean isStatusSuccess(int paramInt)
  {
    if (paramInt == 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private static void onDoneSpeaking()
  {
    if (audioManager != null) {
      audioManager.abandonAudioFocus(afChangeListener);
    }
  }
  
  private static boolean setLanguageAndCheck(Locale paramLocale)
  {
    int i = tts.setLanguage(paramLocale);
    if ((i != -1) && (i != -2)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  @TargetApi(15)
  private static void setTTSListeners()
  {
    if (Build.VERSION.SDK_INT >= 15) {
      if (tts.setOnUtteranceProgressListener(new UtteranceProgressListener()
      {
        public void onDone(String paramAnonymousString) {}
        
        public void onError(String paramAnonymousString) {}
        
        public void onStart(String paramAnonymousString) {}
      }) != 0) {
        onDoneSpeaking();
      }
    }
    for (;;)
    {
      return;
      tts.setOnUtteranceCompletedListener(new TextToSpeech.OnUtteranceCompletedListener()
      {
        public void onUtteranceCompleted(String paramAnonymousString) {}
      });
    }
  }
  
  public static void speak(Context paramContext, String paramString)
  {
    for (;;)
    {
      try
      {
        synchronized (LOCK)
        {
          paramContext = paramContext.getApplicationContext();
          boolean bool;
          if (PreferencesUtils.getTTSDisplayOffOnly(paramContext))
          {
            bool = ((PowerManager)paramContext.getSystemService("power")).isScreenOn();
            if (bool) {
              return;
            }
          }
          if (PreferencesUtils.getTTSHeadphonesOnly(paramContext))
          {
            bool = isHeadsetConnected(paramContext);
            if (bool) {}
          }
        }
        textToBeSpoken = paramString;
        if (tts != null) {
          continue;
        }
        paramString = new android/speech/tts/TextToSpeech;
        TextToSpeech.OnInitListener local1 = new com/mobnetic/coinguardian/util/TTSHelper$1;
        local1.<init>(paramContext);
        paramString.<init>(paramContext, local1);
        tts = paramString;
      }
      catch (Throwable paramContext)
      {
        paramContext.printStackTrace();
        continue;
      }
      continue;
      speakAfterInit(paramContext, textToBeSpoken);
    }
  }
  
  private static void speakAfterInit(Context paramContext, String paramString)
  {
    if (tts == null) {}
    for (;;)
    {
      return;
      try
      {
        audioManager = (AudioManager)paramContext.getSystemService("audio");
        if (setLanguageAndCheck(Locale.ENGLISH)) {
          break label70;
        }
        Log.d("TTS", "ENGLISH language is not supported, setting default instead.");
        if ((defaultLanguageLocale != null) && (setLanguageAndCheck(defaultLanguageLocale))) {
          break label70;
        }
        Log.d("TTS", "Error while setting default language!");
      }
      catch (Throwable paramContext)
      {
        paramContext.printStackTrace();
      }
      continue;
      label70:
      int i = getProperAudioStream(paramContext);
      audioManager.requestAudioFocus(afChangeListener, i, 3);
      setTTSListeners();
      paramContext = new java/util/HashMap;
      paramContext.<init>();
      paramContext.put("utteranceId", "DONE");
      paramContext.put("streamType", String.valueOf(i));
      tts.speak(paramString, 1, paramContext);
    }
  }
  
  public static void stopSpeaking()
  {
    if (tts != null) {
      tts.stop();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/TTSHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */