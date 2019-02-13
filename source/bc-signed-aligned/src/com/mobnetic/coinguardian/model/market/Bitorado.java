package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Bitorado
  extends Market
{
  private static final String NAME = "Bitorado";
  private static final String TTS_NAME = "Bitorado";
  private static final String URL = "https://www.bitorado.com/api/market/%1$s-%2$s/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://www.bitorado.com/api/ticker";
  
  public Bitorado()
  {
    super("Bitorado", "Bitorado", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.bitorado.com/api/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.bitorado.com/api/market/%1$s-%2$s/ticker", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("result").getJSONObject("markets").names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getString(paramInt);
      if (str == null) {}
      for (;;)
      {
        paramInt++;
        break;
        paramJSONObject = str.split("-");
        if (paramJSONObject.length == 2) {
          paramList.add(new CurrencyPairInfo(paramJSONObject[0], paramJSONObject[1], str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    paramTicker.bid = paramJSONObject.optDouble("buy", -1.0D);
    paramTicker.ask = paramJSONObject.optDouble("sell", -1.0D);
    paramTicker.vol = paramJSONObject.optDouble("vol", -1.0D);
    paramTicker.high = paramJSONObject.optDouble("high", -1.0D);
    paramTicker.low = paramJSONObject.optDouble("low", -1.0D);
    paramTicker.last = paramJSONObject.optDouble("last", 0.0D);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bitorado.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */