package com.robotoworks.mechanoid.net;

import java.io.IOException;
import java.io.InputStream;

public abstract interface Parser<T>
{
  public abstract T parse(InputStream paramInputStream)
    throws IOException;
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/Parser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */