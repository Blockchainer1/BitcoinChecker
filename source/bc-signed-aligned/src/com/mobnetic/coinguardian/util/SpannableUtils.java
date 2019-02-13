package com.mobnetic.coinguardian.util;

import android.text.SpannableStringBuilder;
import android.text.style.CharacterStyle;
import android.util.Pair;

public class SpannableUtils
{
  public static CharSequence formatWithSpans(String paramString1, String paramString2, CharacterStyle paramCharacterStyle)
  {
    return formatWithSpans(paramString1, new StringAndSpan[] { new StringAndSpan(paramString2, paramCharacterStyle) });
  }
  
  public static CharSequence formatWithSpans(String paramString1, String paramString2, CharacterStyle paramCharacterStyle1, String paramString3, CharacterStyle paramCharacterStyle2)
  {
    return formatWithSpans(paramString1, new StringAndSpan[] { new StringAndSpan(paramString2, paramCharacterStyle1), new StringAndSpan(paramString3, paramCharacterStyle2) });
  }
  
  public static CharSequence formatWithSpans(String paramString1, String paramString2, CharacterStyle paramCharacterStyle1, String paramString3, CharacterStyle paramCharacterStyle2, String paramString4, CharacterStyle paramCharacterStyle3)
  {
    return formatWithSpans(paramString1, new StringAndSpan[] { new StringAndSpan(paramString2, paramCharacterStyle1), new StringAndSpan(paramString3, paramCharacterStyle2), new StringAndSpan(paramString4, paramCharacterStyle3) });
  }
  
  public static CharSequence formatWithSpans(String paramString1, String paramString2, CharacterStyle paramCharacterStyle1, String paramString3, CharacterStyle paramCharacterStyle2, String paramString4, CharacterStyle paramCharacterStyle3, String paramString5, CharacterStyle paramCharacterStyle4)
  {
    return formatWithSpans(paramString1, new StringAndSpan[] { new StringAndSpan(paramString2, paramCharacterStyle1), new StringAndSpan(paramString3, paramCharacterStyle2), new StringAndSpan(paramString4, paramCharacterStyle3), new StringAndSpan(paramString5, paramCharacterStyle4) });
  }
  
  public static CharSequence formatWithSpans(String paramString, StringAndSpan... paramVarArgs)
  {
    int[] arrayOfInt = new int[paramVarArgs.length];
    SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder(paramString);
    int i = 0;
    int j;
    if (i < paramVarArgs.length)
    {
      arrayOfInt[i] = paramString.indexOf("%" + (i + 1) + "$s");
      if (arrayOfInt[i] >= 0) {
        if (i >= 9) {
          break label108;
        }
      }
      label108:
      for (j = 1;; j = 2)
      {
        localSpannableStringBuilder.setSpan(paramVarArgs[i].second, arrayOfInt[i], arrayOfInt[i] + (j + 3), 33);
        i++;
        break;
      }
    }
    i = paramVarArgs.length - 1;
    if (i >= 0)
    {
      if (arrayOfInt[i] >= 0) {
        if (i >= 9) {
          break label176;
        }
      }
      label176:
      for (j = 1;; j = 2)
      {
        localSpannableStringBuilder.replace(arrayOfInt[i], arrayOfInt[i] + (j + 3), (CharSequence)paramVarArgs[i].first);
        i--;
        break;
      }
    }
    return localSpannableStringBuilder;
  }
  
  public static class StringAndSpan
    extends Pair<String, CharacterStyle>
  {
    public StringAndSpan(String paramString, CharacterStyle paramCharacterStyle)
    {
      super(paramCharacterStyle);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/SpannableUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */