package com.robotoworks.mechanoid.net;

public abstract interface JsonEntityReaderProvider
{
  public abstract <T, R extends JsonEntityReader<T>> R get(Class<T> paramClass);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/JsonEntityReaderProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */