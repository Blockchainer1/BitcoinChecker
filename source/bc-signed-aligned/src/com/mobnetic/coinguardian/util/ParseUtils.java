package com.mobnetic.coinguardian.util;

import org.json.JSONException;
import org.json.JSONObject;

public class ParseUtils
{
  public static double getDoubleFromString(JSONObject paramJSONObject, String paramString)
    throws NumberFormatException, JSONException
  {
    return Double.parseDouble(paramJSONObject.getString(paramString));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/ParseUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */