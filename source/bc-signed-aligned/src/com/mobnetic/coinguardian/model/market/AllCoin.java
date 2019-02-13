package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import com.mobnetic.coinguardiandatamodule.R.string;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class AllCoin
  extends Market
{
  private static final String NAME = "AllCoin";
  private static final String TTS_NAME = "All Coin";
  private static final String URL = "https://www.allcoin.com/api2/pair/%1$s_%2$s";
  private static final String URL_CURRENCY_PAIRS = "https://www.allcoin.com/api2/pairs";
  
  public AllCoin()
  {
    super("AllCoin", "All Coin", null);
  }
  
  public int getCautionResId()
  {
    return R.string.market_caution_allcoin;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.allcoin.com/api2/pairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.allcoin.com/api2/pair/%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONObject localJSONObject1 = paramJSONObject.getJSONObject("data");
    paramJSONObject = localJSONObject1.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      JSONObject localJSONObject2 = localJSONObject1.getJSONObject(str);
      paramList.add(new CurrencyPairInfo(localJSONObject2.getString("type"), localJSONObject2.getString("exchange"), str));
    }
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("error_info");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "top_bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "top_ask");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume_24h_" + paramCheckerInfo.getCurrencyBase());
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "max_24h_price");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "min_24h_price");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "trade_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/AllCoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */