package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitTrex
  extends Market
{
  private static final String NAME = "BitTrex";
  private static final String TTS_NAME = "Bit Trex";
  private static final String URL = "https://bittrex.com/api/v1.1/public/getticker?market=%1$s-%2$s";
  private static final String URL_CURRENCY_PAIRS = "https://bittrex.com/api/v1.1/public/getmarkets";
  
  public BitTrex()
  {
    super("BitTrex", "Bit Trex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://bittrex.com/api/v1.1/public/getmarkets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://bittrex.com/api/v1.1/public/getticker?market=%1$s-%2$s", new Object[] { paramCheckerInfo.getCurrencyCounter(), paramCheckerInfo.getCurrencyBase() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("result");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString("MarketCurrency"), paramJSONObject.getString("BaseCurrency"), paramJSONObject.getString("MarketName")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    paramTicker.bid = paramJSONObject.getDouble("Bid");
    paramTicker.ask = paramJSONObject.getDouble("Ask");
    paramTicker.last = paramJSONObject.getDouble("Last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitTrex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */