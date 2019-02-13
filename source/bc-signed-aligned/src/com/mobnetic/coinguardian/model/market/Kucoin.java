package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Kucoin
  extends Market
{
  private static final String NAME = "Kucoin";
  private static final String TTS_NAME = "Kucoin";
  private static final String URL = "https://api.kucoin.com/v1/open/tick?symbol=%1$s";
  private static final String URL_COINS_PAIRS = "https://api.kucoin.com/v1/market/open/symbols";
  
  public Kucoin()
  {
    super("Kucoin", "Kucoin", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.kucoin.com/v1/market/open/symbols";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.kucoin.com/v1/open/tick?symbol=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("data");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("coinType"), localJSONObject.getString("coinTypePair"), localJSONObject.getString("symbol")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("lastDealPrice");
    paramTicker.timestamp = paramJSONObject.getLong("datetime");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Kucoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */