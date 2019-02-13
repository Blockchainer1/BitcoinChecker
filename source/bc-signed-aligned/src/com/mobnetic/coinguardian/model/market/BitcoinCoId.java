package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitcoinCoId
  extends Market
{
  private static final String NAME = "Bitcoin.co.id";
  private static final String TTS_NAME = "Bitcoin co id";
  private static final String URL = "https://vip.bitcoin.co.id/api/%1$s/ticker/";
  private static final String URL_CURRENCY_PAIRS = "https://vip.bitcoin.co.id/api/summaries";
  
  public BitcoinCoId()
  {
    super("Bitcoin.co.id", "Bitcoin co id", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://vip.bitcoin.co.id/api/summaries";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    String str1 = paramCheckerInfo.getCurrencyPairId();
    String str2 = str1;
    if (str1 == null) {
      str2 = String.format("%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
    }
    return String.format("https://vip.bitcoin.co.id/api/%1$s/ticker/", new Object[] { str2 });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("tickers").names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getString(paramInt);
      if (str == null) {}
      for (;;)
      {
        paramInt++;
        break;
        paramJSONObject = str.split("_");
        if (paramJSONObject.length == 2) {
          paramList.add(new CurrencyPairInfo(paramJSONObject[0].toUpperCase(Locale.ENGLISH), paramJSONObject[1].toUpperCase(Locale.ENGLISH), str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol_" + paramCheckerInfo.getCurrencyBaseLowerCase());
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = paramJSONObject.getLong("server_time");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitcoinCoId.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */