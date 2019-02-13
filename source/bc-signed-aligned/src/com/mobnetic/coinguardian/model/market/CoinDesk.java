package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CoinDesk
  extends Market
{
  private static final String NAME = "CoinDesk";
  private static final String TTS_NAME = "Coin Desk";
  private static final String URL = "https://api.coindesk.com/v1/bpi/currentprice.json";
  private static final String URL_CURRENCY_PAIRS = "https://api.coindesk.com/v1/bpi/currentprice.json";
  
  public CoinDesk()
  {
    super("CoinDesk", "Coin Desk", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.coindesk.com/v1/bpi/currentprice.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.coindesk.com/v1/bpi/currentprice.json";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("bpi").names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++) {
      paramList.add(new CurrencyPairInfo("BTC", paramJSONObject.getString(paramInt), null));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = paramJSONObject.getJSONObject("bpi").getJSONObject(paramCheckerInfo.getCurrencyCounter()).getDouble("rate_float");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinDesk.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */