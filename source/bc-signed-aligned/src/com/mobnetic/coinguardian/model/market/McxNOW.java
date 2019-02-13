package com.mobnetic.coinguardian.model.market;

import android.text.TextUtils;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.XmlParserUtils;
import java.io.StringReader;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

public class McxNOW
  extends Market
{
  private static final String NAME = "McxNOW";
  private static final String TTS_NAME = "MCX now";
  private static final String URL = "https://mcxnow.com/orders?cur=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://mcxnow.com/current";
  
  public McxNOW()
  {
    super("McxNOW", "MCX now", null);
  }
  
  private double getFirstPriceFromOrder(Document paramDocument, String paramString)
    throws Exception
  {
    paramDocument = XmlParserUtils.getFirstElementByTagName(paramDocument, paramString);
    if (paramDocument != null)
    {
      paramDocument = ((Element)paramDocument).getElementsByTagName("o");
      if ((paramDocument != null) && (paramDocument.getLength() > 1))
      {
        paramDocument = paramDocument.item(1);
        if ((paramDocument != null) && ((paramDocument instanceof Element)))
        {
          paramDocument = ((Element)paramDocument).getElementsByTagName("p");
          if ((paramDocument == null) || (paramDocument.getLength() <= 0)) {}
        }
      }
    }
    for (double d = XmlParserUtils.getDoubleNodeValue(paramDocument.item(0));; d = -1.0D) {
      return d;
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://mcxnow.com/current";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://mcxnow.com/orders?cur=%1$s", new Object[] { paramCheckerInfo.getCurrencyBase() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    DocumentBuilder localDocumentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    Object localObject = new InputSource();
    ((InputSource)localObject).setCharacterStream(new StringReader(paramString));
    paramString = localDocumentBuilder.parse((InputSource)localObject).getElementsByTagName("cur");
    if (paramString != null) {
      for (paramInt = 0; paramInt < paramString.getLength(); paramInt++)
      {
        localObject = (Element)paramString.item(paramInt);
        if (localObject != null)
        {
          localObject = ((Element)localObject).getAttribute("tla");
          if ((!TextUtils.isEmpty((CharSequence)localObject)) && (!"BTC".equals(localObject))) {
            paramList.add(new CurrencyPairInfo((String)localObject, "BTC", null));
          }
        }
      }
    }
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramCheckerInfo = DocumentBuilderFactory.newInstance().newDocumentBuilder();
    InputSource localInputSource = new InputSource();
    localInputSource.setCharacterStream(new StringReader(paramString));
    paramString = paramCheckerInfo.parse(localInputSource);
    paramTicker.bid = getFirstPriceFromOrder(paramString, "buy");
    paramTicker.ask = getFirstPriceFromOrder(paramString, "sell");
    paramTicker.vol = XmlParserUtils.getDoubleNodeValue(XmlParserUtils.getFirstElementByTagName(paramString, "curvol"));
    paramTicker.high = XmlParserUtils.getDoubleNodeValue(XmlParserUtils.getFirstElementByTagName(paramString, "priceh"));
    paramTicker.low = XmlParserUtils.getDoubleNodeValue(XmlParserUtils.getFirstElementByTagName(paramString, "pricel"));
    paramTicker.last = XmlParserUtils.getDoubleNodeValue(XmlParserUtils.getFirstElementByTagName(paramString, "lprice"));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/McxNOW.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */