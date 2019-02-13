package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Crex24
  extends Market
{
  private static final String NAME = "Crex24";
  private static final String TTS_NAME = "Crex24";
  private static final String URL = "https://api.crex24.com/CryptoExchangeService/BotPublic/ReturnTicker?request=[NamePairs=%1$s]";
  private static final String URL_CURRENCY_PAIRS = "https://api.crex24.com/CryptoExchangeService/BotPublic/ReturnTicker";
  
  public Crex24()
  {
    super("Crex24", "Crex24", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.crex24.com/CryptoExchangeService/BotPublic/ReturnTicker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.crex24.com/CryptoExchangeService/BotPublic/ReturnTicker?request=[NamePairs=%1$s]", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("Tickers");
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt).getString("PairName");
      String[] arrayOfString = paramJSONObject.split("_");
      if (arrayOfString.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], paramJSONObject));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("Tickers").getJSONObject(0);
    paramTicker.vol = paramJSONObject.getDouble("BaseVolume");
    paramTicker.high = paramJSONObject.getDouble("HighPrice");
    paramTicker.ask = paramJSONObject.getDouble("LowPrice");
    paramTicker.last = paramJSONObject.getDouble("Last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Crex24.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */