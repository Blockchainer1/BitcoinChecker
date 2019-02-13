package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class ShapeShift
  extends Market
{
  private static final String NAME = "ShapeShift";
  private static final String TTS_NAME = "Shape Shift";
  private static final String URL = "https://shapeshift.io/rate/%1$s_%2$s";
  private static final String URL_CURRENCY_PAIRS = "https://shapeshift.io/getcoins";
  
  public ShapeShift()
  {
    super("ShapeShift", "Shape Shift", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://shapeshift.io/getcoins";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://shapeshift.io/rate/%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.names();
    ArrayList localArrayList = new ArrayList(localJSONArray.length());
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(localJSONArray.getString(paramInt));
      if ("available".equals(localJSONObject.optString("status"))) {
        localArrayList.add(localJSONObject.getString("symbol"));
      }
    }
    int i = localArrayList.size();
    for (paramInt = 0; paramInt < i; paramInt++) {
      for (int j = 0; j < i; j++) {
        if (paramInt != j) {
          paramList.add(new CurrencyPairInfo((String)localArrayList.get(paramInt), (String)localArrayList.get(j), null));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "rate");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/ShapeShift.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */