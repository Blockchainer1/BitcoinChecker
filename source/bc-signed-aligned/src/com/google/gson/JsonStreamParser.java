package com.google.gson;

import com.google.gson.internal.Streams;
import com.google.gson.stream.JsonReader;
import java.io.EOFException;
import java.io.Reader;
import java.io.StringReader;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class JsonStreamParser
  implements Iterator<JsonElement>
{
  private final Object lock;
  private final JsonReader parser;
  
  public JsonStreamParser(Reader paramReader)
  {
    this.parser = new JsonReader(paramReader);
    this.parser.setLenient(true);
    this.lock = new Object();
  }
  
  public JsonStreamParser(String paramString)
  {
    this(new StringReader(paramString));
  }
  
  /* Error */
  public boolean hasNext()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 28	com/google/gson/JsonStreamParser:lock	Ljava/lang/Object;
    //   4: astore_1
    //   5: aload_1
    //   6: monitorenter
    //   7: aload_0
    //   8: getfield 22	com/google/gson/JsonStreamParser:parser	Lcom/google/gson/stream/JsonReader;
    //   11: invokevirtual 45	com/google/gson/stream/JsonReader:peek	()Lcom/google/gson/stream/JsonToken;
    //   14: astore_2
    //   15: getstatic 51	com/google/gson/stream/JsonToken:END_DOCUMENT	Lcom/google/gson/stream/JsonToken;
    //   18: astore_3
    //   19: aload_2
    //   20: aload_3
    //   21: if_acmpeq +11 -> 32
    //   24: iconst_1
    //   25: istore 4
    //   27: aload_1
    //   28: monitorexit
    //   29: iload 4
    //   31: ireturn
    //   32: iconst_0
    //   33: istore 4
    //   35: goto -8 -> 27
    //   38: astore_3
    //   39: new 53	com/google/gson/JsonSyntaxException
    //   42: astore_2
    //   43: aload_2
    //   44: aload_3
    //   45: invokespecial 56	com/google/gson/JsonSyntaxException:<init>	(Ljava/lang/Throwable;)V
    //   48: aload_2
    //   49: athrow
    //   50: astore_2
    //   51: aload_1
    //   52: monitorexit
    //   53: aload_2
    //   54: athrow
    //   55: astore_3
    //   56: new 58	com/google/gson/JsonIOException
    //   59: astore_2
    //   60: aload_2
    //   61: aload_3
    //   62: invokespecial 59	com/google/gson/JsonIOException:<init>	(Ljava/lang/Throwable;)V
    //   65: aload_2
    //   66: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	67	0	this	JsonStreamParser
    //   14	35	2	localObject2	Object
    //   50	4	2	localObject3	Object
    //   59	7	2	localJsonIOException	JsonIOException
    //   18	3	3	localJsonToken	com.google.gson.stream.JsonToken
    //   38	7	3	localMalformedJsonException	com.google.gson.stream.MalformedJsonException
    //   55	7	3	localIOException	java.io.IOException
    //   25	9	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   7	19	38	com/google/gson/stream/MalformedJsonException
    //   7	19	50	finally
    //   27	29	50	finally
    //   39	50	50	finally
    //   51	53	50	finally
    //   56	67	50	finally
    //   7	19	55	java/io/IOException
  }
  
  public JsonElement next()
    throws JsonParseException
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    try
    {
      JsonElement localJsonElement = Streams.parse(this.parser);
      return localJsonElement;
    }
    catch (StackOverflowError localStackOverflowError)
    {
      throw new JsonParseException("Failed parsing JSON source to Json", localStackOverflowError);
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      throw new JsonParseException("Failed parsing JSON source to Json", localOutOfMemoryError);
    }
    catch (JsonParseException localJsonParseException)
    {
      Object localObject = localJsonParseException;
      if ((localJsonParseException.getCause() instanceof EOFException)) {
        localObject = new NoSuchElementException();
      }
      throw ((Throwable)localObject);
    }
  }
  
  public void remove()
  {
    throw new UnsupportedOperationException();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/google/gson/JsonStreamParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */