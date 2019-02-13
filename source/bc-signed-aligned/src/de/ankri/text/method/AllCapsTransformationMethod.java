package de.ankri.text.method;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import java.util.Locale;

public class AllCapsTransformationMethod
  implements TransformationMethodCompat2
{
  private static final String TAG = "AllCapsTransformationMethod";
  private boolean mEnabled;
  private Locale mLocale;
  
  public AllCapsTransformationMethod(Context paramContext)
  {
    this.mLocale = paramContext.getResources().getConfiguration().locale;
  }
  
  public CharSequence getTransformation(CharSequence paramCharSequence, View paramView)
  {
    if (this.mEnabled) {
      if (paramCharSequence != null) {
        paramCharSequence = paramCharSequence.toString().toUpperCase(this.mLocale);
      }
    }
    for (;;)
    {
      return paramCharSequence;
      paramCharSequence = null;
      continue;
      Log.w("AllCapsTransformationMethod", "Caller did not enable length changes; not transforming text");
    }
  }
  
  public void onFocusChanged(View paramView, CharSequence paramCharSequence, boolean paramBoolean, int paramInt, Rect paramRect) {}
  
  public void setLengthChangesAllowed(boolean paramBoolean)
  {
    this.mEnabled = paramBoolean;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/de/ankri/text/method/AllCapsTransformationMethod.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */