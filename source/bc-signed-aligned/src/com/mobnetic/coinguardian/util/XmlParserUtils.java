package com.mobnetic.coinguardian.util;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XmlParserUtils
{
  public static double getDoubleNodeValue(Node paramNode)
    throws Exception
  {
    return Double.parseDouble(getTextNodeValue(paramNode));
  }
  
  public static Node getFirstElementByTagName(Document paramDocument, String paramString)
  {
    paramDocument = paramDocument.getElementsByTagName(paramString);
    if ((paramDocument != null) && (paramDocument.getLength() > 0)) {}
    for (paramDocument = paramDocument.item(0);; paramDocument = null) {
      return paramDocument;
    }
  }
  
  public static String getTextNodeValue(Node paramNode)
    throws Exception
  {
    if ((paramNode != null) && (paramNode.hasChildNodes()))
    {
      paramNode = paramNode.getFirstChild();
      if (paramNode != null) {
        if (paramNode.getNodeType() != 3) {}
      }
    }
    for (paramNode = paramNode.getNodeValue();; paramNode = "")
    {
      return paramNode;
      paramNode = paramNode.getNextSibling();
      break;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/XmlParserUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */