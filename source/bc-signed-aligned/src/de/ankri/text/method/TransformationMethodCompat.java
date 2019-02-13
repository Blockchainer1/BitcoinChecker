package de.ankri.text.method;

import android.graphics.Rect;
import android.view.View;

public abstract interface TransformationMethodCompat
{
  public abstract CharSequence getTransformation(CharSequence paramCharSequence, View paramView);
  
  public abstract void onFocusChanged(View paramView, CharSequence paramCharSequence, boolean paramBoolean, int paramInt, Rect paramRect);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/de/ankri/text/method/TransformationMethodCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */