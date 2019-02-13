package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.FuturesMarket;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class OKCoinFutures
  extends FuturesMarket
{
  private static final int[] CONTRACT_TYPES = { 0, 1, 4 };
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "OKCoin Futures";
  private static final String TTS_NAME = "OK Coin Futures";
  private static final String URL = "https://www.okex.com/api/v1/future_ticker.do?symbol=%1$s_%2$s&contract_type=%3$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD" });
  }
  
  public OKCoinFutures()
  {
    super("OKCoin Futures", "OK Coin Futures", CURRENCY_PAIRS, CONTRACT_TYPES);
  }
  
  private String getContractTypeString(int paramInt)
  {
    String str;
    switch (paramInt)
    {
    case 2: 
    case 3: 
    default: 
      str = "this_week";
    }
    for (;;)
    {
      return str;
      str = "next_week";
      continue;
      str = "quarter";
    }
  }
  
  public String getUrl(int paramInt1, CheckerInfo paramCheckerInfo, int paramInt2)
  {
    return String.format("https://www.okex.com/api/v1/future_ticker.do?symbol=%1$s_%2$s&contract_type=%3$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase(), getContractTypeString(paramInt2) });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/OKCoinFutures.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */