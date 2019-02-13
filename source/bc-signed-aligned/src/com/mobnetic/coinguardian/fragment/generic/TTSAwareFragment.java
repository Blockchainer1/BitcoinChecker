package com.mobnetic.coinguardian.fragment.generic;

import android.os.Bundle;
import android.speech.tts.TextToSpeech.OnInitListener;
import android.support.v4.preference.PreferenceFragment;
import com.mobnetic.coinguardian.util.TTSHelper;

public class TTSAwareFragment
  extends PreferenceFragment
  implements TextToSpeech.OnInitListener
{
  private boolean isTTSAvailable;
  
  protected boolean isTTSAvailable()
  {
    return this.isTTSAvailable;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    onCreateBeforeInitTTS(paramBundle);
    TTSHelper.initTTS(getActivity(), this);
  }
  
  protected void onCreateBeforeInitTTS(Bundle paramBundle) {}
  
  public final void onInit(int paramInt)
  {
    this.isTTSAvailable = TTSHelper.isStatusSuccess(paramInt);
    onTTSAvailable(this.isTTSAvailable);
  }
  
  protected void onTTSAvailable(boolean paramBoolean) {}
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/generic/TTSAwareFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */