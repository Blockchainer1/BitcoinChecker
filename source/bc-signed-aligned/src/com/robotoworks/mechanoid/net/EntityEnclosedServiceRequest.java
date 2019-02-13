package com.robotoworks.mechanoid.net;

import java.io.IOException;
import java.io.OutputStream;

public abstract class EntityEnclosedServiceRequest
  extends ServiceRequest
{
  public abstract void writeBody(JsonEntityWriterProvider paramJsonEntityWriterProvider, OutputStream paramOutputStream)
    throws IOException;
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/EntityEnclosedServiceRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */