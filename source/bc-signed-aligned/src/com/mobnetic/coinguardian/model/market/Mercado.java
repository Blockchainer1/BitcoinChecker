package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Mercado
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Mercado Bitcoin";
  private static final String TTS_NAME = "Mercado";
  private static final String URL = "https://www.mercadobitcoin.com.br/api/%1$s/ticker/";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "BRL" });
    CURRENCY_PAIRS.put("BCH", new String[] { "BRL" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BRL" });
  }
  
  public Mercado()
  {
    super("Mercado Bitcoin", "Mercado", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.mercadobitcoin.com.br/api/%1$s/ticker/", new Object[] { paramCheckerInfo.getCurrencyBase() });
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
    paramTicker.timestamp = (paramJSONObject.getLong("date") * 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Mercado.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */