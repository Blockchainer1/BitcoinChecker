package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitMarketPL
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitMarket.pl";
  private static final String SYMBOL_SWAP = "SWAP";
  private static final String TTS_NAME = "Bit Market";
  private static final String URL = "https://www.bitmarket.pl/json/%1$s%2$s/ticker.json";
  private static final String URL_SWAP = "https://bitmarket.pl/json/swap%1$s/swap.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR", "PLN", "SWAP" });
    CURRENCY_PAIRS.put("BCC", new String[] { "PLN" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "PLN", "SWAP" });
    CURRENCY_PAIRS.put("ETH", new String[] { "SWAP" });
  }
  
  public BitMarketPL()
  {
    super("BitMarket.pl", "Bit Market", CURRENCY_PAIRS);
  }
  
  private boolean isSwap(CheckerInfo paramCheckerInfo)
  {
    return "SWAP".equals(paramCheckerInfo.getCurrencyCounter());
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (isSwap(paramCheckerInfo)) {}
    for (paramCheckerInfo = String.format("https://bitmarket.pl/json/swap%1$s/swap.json", new Object[] { paramCheckerInfo.getCurrencyBase() });; paramCheckerInfo = String.format("https://www.bitmarket.pl/json/%1$s%2$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() })) {
      return paramCheckerInfo;
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (isSwap(paramCheckerInfo)) {}
    for (paramTicker.last = paramJSONObject.getDouble("cutoff");; paramTicker.last = paramJSONObject.getDouble("last"))
    {
      return;
      paramTicker.bid = paramJSONObject.getDouble("bid");
      paramTicker.ask = paramJSONObject.getDouble("ask");
      paramTicker.vol = paramJSONObject.getDouble("volume");
      paramTicker.high = paramJSONObject.getDouble("high");
      paramTicker.low = paramJSONObject.getDouble("low");
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitMarketPL.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */