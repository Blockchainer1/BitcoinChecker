package com.mobnetic.coinguardian.util;

import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.CurrencyPairsListWithDate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

public class CurrencyPairsMapHelper
{
  private final HashMap<String, CharSequence[]> currencyPairs = new LinkedHashMap();
  private final HashMap<String, String> currencyPairsIds = new HashMap();
  private long date;
  private int pairsCount = 0;
  
  public CurrencyPairsMapHelper(CurrencyPairsListWithDate paramCurrencyPairsListWithDate)
  {
    if (paramCurrencyPairsListWithDate == null) {
      return;
    }
    this.date = paramCurrencyPairsListWithDate.date;
    List localList = paramCurrencyPairsListWithDate.pairs;
    this.pairsCount = localList.size();
    HashMap localHashMap = new HashMap();
    Object localObject1 = localList.iterator();
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (CurrencyPairInfo)((Iterator)localObject1).next();
      paramCurrencyPairsListWithDate = (Integer)localHashMap.get(((CurrencyPairInfo)localObject2).getCurrencyBase());
      if (paramCurrencyPairsListWithDate == null) {}
      for (paramCurrencyPairsListWithDate = Integer.valueOf(1);; paramCurrencyPairsListWithDate = Integer.valueOf(paramCurrencyPairsListWithDate.intValue() + 1))
      {
        localHashMap.put(((CurrencyPairInfo)localObject2).getCurrencyBase(), paramCurrencyPairsListWithDate);
        break;
      }
    }
    int i = 0;
    Object localObject2 = localList.iterator();
    label157:
    if (((Iterator)localObject2).hasNext())
    {
      localObject1 = (CurrencyPairInfo)((Iterator)localObject2).next();
      paramCurrencyPairsListWithDate = (CharSequence[])this.currencyPairs.get(((CurrencyPairInfo)localObject1).getCurrencyBase());
      if (paramCurrencyPairsListWithDate != null) {
        break label290;
      }
      paramCurrencyPairsListWithDate = new CharSequence[((Integer)localHashMap.get(((CurrencyPairInfo)localObject1).getCurrencyBase())).intValue()];
      this.currencyPairs.put(((CurrencyPairInfo)localObject1).getCurrencyBase(), paramCurrencyPairsListWithDate);
    }
    label290:
    for (int j = 0;; j = i + 1)
    {
      paramCurrencyPairsListWithDate[j] = ((CurrencyPairInfo)localObject1).getCurrencyCounter();
      i = j;
      if (((CurrencyPairInfo)localObject1).getCurrencyPairId() == null) {
        break label157;
      }
      this.currencyPairsIds.put(createCurrencyPairKey(((CurrencyPairInfo)localObject1).getCurrencyBase(), ((CurrencyPairInfo)localObject1).getCurrencyCounter()), ((CurrencyPairInfo)localObject1).getCurrencyPairId());
      i = j;
      break label157;
      break;
    }
  }
  
  private String createCurrencyPairKey(String paramString1, String paramString2)
  {
    return String.format("%1$s_%2$s", new Object[] { paramString1, paramString2 });
  }
  
  public String getCurrencyPairId(String paramString1, String paramString2)
  {
    return (String)this.currencyPairsIds.get(createCurrencyPairKey(paramString1, paramString2));
  }
  
  public HashMap<String, CharSequence[]> getCurrencyPairs()
  {
    return this.currencyPairs;
  }
  
  public long getDate()
  {
    return this.date;
  }
  
  public int getPairsCount()
  {
    return this.pairsCount;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/CurrencyPairsMapHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */