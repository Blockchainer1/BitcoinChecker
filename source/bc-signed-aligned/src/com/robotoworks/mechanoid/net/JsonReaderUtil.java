package com.robotoworks.mechanoid.net;

import com.robotoworks.mechanoid.internal.util.JsonReader;
import com.robotoworks.mechanoid.internal.util.JsonToken;
import java.io.IOException;

public class JsonReaderUtil
{
  public static boolean coerceNextBoolean(JsonReader paramJsonReader)
    throws IOException
  {
    JsonToken localJsonToken = paramJsonReader.peek();
    boolean bool;
    if (localJsonToken == JsonToken.STRING) {
      bool = Boolean.valueOf(paramJsonReader.nextString()).booleanValue();
    }
    for (;;)
    {
      return bool;
      if (localJsonToken == JsonToken.NUMBER)
      {
        if (paramJsonReader.nextInt() > 0) {
          bool = true;
        } else {
          bool = false;
        }
      }
      else {
        bool = paramJsonReader.nextBoolean();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/JsonReaderUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */