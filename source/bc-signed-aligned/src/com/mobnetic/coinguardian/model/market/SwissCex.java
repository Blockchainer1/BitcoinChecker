package com.mobnetic.coinguardian.model.market;

import android.text.TextUtils;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class SwissCex
  extends Market
{
  public static String API_KEY = "61u3kk4h2una357envden8cuk6";
  private static final String NAME = "SWISSCEX";
  private static final String TTS_NAME = "Swiss Cex";
  private static final String URL = "http://api.swisscex.com/quote/%1$s/%2$s?apiKey=%3$s";
  private static final String URL_CURRENCY_PAIRS = "http://api.swisscex.com/quotes?apiKey=%1$s";
  
  public SwissCex()
  {
    super("SWISSCEX", "Swiss Cex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return String.format("http://api.swisscex.com/quotes?apiKey=%1$s", new Object[] { API_KEY });
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://api.swisscex.com/quote/%1$s/%2$s?apiKey=%3$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter(), API_KEY });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.names();
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(localJSONArray.getString(paramInt));
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("from"), localJSONObject.getString("to"), localJSONObject.getString("label")));
    }
  }
  
  protected String parseError(int paramInt, String paramString, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (TextUtils.isEmpty(API_KEY)) {
      paramString = "API_KEY is empty";
    }
    return paramString;
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("quote");
    paramTicker.bid = paramJSONObject.getDouble("bidPrice");
    paramTicker.ask = paramJSONObject.getDouble("askPrice");
    paramTicker.vol = paramJSONObject.getDouble("volume24");
    paramTicker.high = paramJSONObject.getDouble("high24");
    paramTicker.low = paramJSONObject.getDouble("low24");
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/SwissCex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */