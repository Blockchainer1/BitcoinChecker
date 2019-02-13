package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Prelude
  extends Market
{
  private static final String NAME = "Prelude";
  private static final String TTS_NAME = "Prelude";
  private static final String URL_1 = "https://api.prelude.io/pairings/%1$s";
  private static final String URL_2_BTC = "https://api.prelude.io/statistics/%1$s";
  private static final String URL_2_USD = "https://api.prelude.io/statistics-usd/%1$s";
  private static final String URL_CURRENCY_PAIRS_BTC = "https://api.prelude.io/pairings/btc";
  private static final String URL_CURRENCY_PAIRS_USD = "https://api.prelude.io/pairings/usd";
  
  public Prelude()
  {
    super("Prelude", "Prelude", null);
  }
  
  public int getCurrencyPairsNumOfRequests()
  {
    return 2;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    if (paramInt == 1) {}
    for (String str = "https://api.prelude.io/pairings/usd";; str = "https://api.prelude.io/pairings/btc") {
      return str;
    }
  }
  
  public int getNumOfRequests(CheckerInfo paramCheckerInfo)
  {
    return 2;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (paramInt == 0) {
      paramCheckerInfo = String.format("https://api.prelude.io/pairings/%1$s", new Object[] { paramCheckerInfo.getCurrencyCounterLowerCase() });
    }
    for (;;)
    {
      return paramCheckerInfo;
      if ("USD".equals(paramCheckerInfo.getCurrencyCounter())) {
        paramCheckerInfo = String.format("https://api.prelude.io/statistics-usd/%1$s", new Object[] { paramCheckerInfo.getCurrencyBase() });
      } else {
        paramCheckerInfo = String.format("https://api.prelude.io/statistics/%1$s", new Object[] { paramCheckerInfo.getCurrencyBase() });
      }
    }
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("pairings");
    paramJSONObject = paramJSONObject.getString("from");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++) {
      paramList.add(new CurrencyPairInfo(localJSONArray.getJSONObject(paramInt).getString("pair"), paramJSONObject, null));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    NumberFormat localNumberFormat = NumberFormat.getInstance(Locale.US);
    if (paramInt == 0)
    {
      paramJSONObject = paramJSONObject.getJSONArray("pairings");
      paramInt = 0;
      if (paramInt < paramJSONObject.length())
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
        String str = localJSONObject.getString("pair");
        if (!paramCheckerInfo.getCurrencyBase().equals(str)) {
          break label83;
        }
        paramTicker.last = localNumberFormat.parse(localJSONObject.getJSONObject("last_trade").getString("rate")).doubleValue();
      }
    }
    for (;;)
    {
      return;
      label83:
      paramInt++;
      break;
      paramJSONObject = paramJSONObject.getJSONObject("statistics");
      paramTicker.vol = localNumberFormat.parse(paramJSONObject.getString("volume")).doubleValue();
      paramTicker.high = localNumberFormat.parse(paramJSONObject.getString("high")).doubleValue();
      paramTicker.low = localNumberFormat.parse(paramJSONObject.getString("low")).doubleValue();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Prelude.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */