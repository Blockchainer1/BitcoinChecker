package com.mobnetic.coinguardian.util;

import com.mobnetic.coinguardian.config.MarketsConfig;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.market.Unknown;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;

public class MarketsConfigUtils
{
  private static final Market UNKNOWN = new Unknown();
  
  /* Error */
  public static Market getMarketById(int paramInt)
  {
    // Byte code:
    //   0: getstatic 25	com/mobnetic/coinguardian/config/MarketsConfig:MARKETS	Ljava/util/LinkedHashMap;
    //   3: astore_1
    //   4: aload_1
    //   5: monitorenter
    //   6: iload_0
    //   7: iflt +40 -> 47
    //   10: iload_0
    //   11: getstatic 25	com/mobnetic/coinguardian/config/MarketsConfig:MARKETS	Ljava/util/LinkedHashMap;
    //   14: invokevirtual 31	java/util/LinkedHashMap:size	()I
    //   17: if_icmpge +30 -> 47
    //   20: new 33	java/util/ArrayList
    //   23: astore_2
    //   24: aload_2
    //   25: getstatic 25	com/mobnetic/coinguardian/config/MarketsConfig:MARKETS	Ljava/util/LinkedHashMap;
    //   28: invokevirtual 37	java/util/LinkedHashMap:values	()Ljava/util/Collection;
    //   31: invokespecial 40	java/util/ArrayList:<init>	(Ljava/util/Collection;)V
    //   34: aload_2
    //   35: iload_0
    //   36: invokevirtual 44	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   39: checkcast 46	com/mobnetic/coinguardian/model/Market
    //   42: astore_2
    //   43: aload_1
    //   44: monitorexit
    //   45: aload_2
    //   46: areturn
    //   47: aload_1
    //   48: monitorexit
    //   49: getstatic 15	com/mobnetic/coinguardian/util/MarketsConfigUtils:UNKNOWN	Lcom/mobnetic/coinguardian/model/Market;
    //   52: astore_2
    //   53: goto -8 -> 45
    //   56: astore_2
    //   57: aload_1
    //   58: monitorexit
    //   59: aload_2
    //   60: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	61	0	paramInt	int
    //   3	55	1	localLinkedHashMap	LinkedHashMap
    //   23	30	2	localObject1	Object
    //   56	4	2	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   10	45	56	finally
    //   47	49	56	finally
    //   57	59	56	finally
  }
  
  public static Market getMarketByKey(String paramString)
  {
    synchronized (MarketsConfig.MARKETS)
    {
      if (MarketsConfig.MARKETS.containsKey(paramString))
      {
        paramString = (Market)MarketsConfig.MARKETS.get(paramString);
        return paramString;
      }
      paramString = UNKNOWN;
    }
  }
  
  public static int getMarketIdByKey(String paramString)
  {
    int i = 0;
    Iterator localIterator = MarketsConfig.MARKETS.values().iterator();
    if (localIterator.hasNext()) {
      if (!((Market)localIterator.next()).key.equals(paramString)) {}
    }
    for (;;)
    {
      return i;
      i++;
      break;
      i = 0;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/MarketsConfigUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */