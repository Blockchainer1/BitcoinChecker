package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardiandatamodule.R.string;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class Unknown
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "UNKNOWN";
  private static final String TTS_NAME = "UNKNOWN";
  private static final String URL = "";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "BTC" });
  }
  
  public Unknown()
  {
    super("UNKNOWN", "UNKNOWN", CURRENCY_PAIRS);
  }
  
  public int getCautionResId()
  {
    return R.string.market_caution_unknown;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "";
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Unknown.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */