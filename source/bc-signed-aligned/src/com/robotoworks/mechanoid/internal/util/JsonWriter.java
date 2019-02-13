package com.robotoworks.mechanoid.internal.util;

import java.io.Closeable;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public final class JsonWriter
  implements Closeable
{
  private String indent;
  private boolean lenient;
  private final Writer out;
  private String separator;
  private final List<JsonScope> stack = new ArrayList();
  
  public JsonWriter(Writer paramWriter)
  {
    this.stack.add(JsonScope.EMPTY_DOCUMENT);
    this.separator = ":";
    if (paramWriter == null) {
      throw new NullPointerException("out == null");
    }
    this.out = paramWriter;
  }
  
  private void beforeName()
    throws IOException
  {
    JsonScope localJsonScope = peek();
    if (localJsonScope == JsonScope.NONEMPTY_OBJECT) {
      this.out.write(44);
    }
    while (localJsonScope == JsonScope.EMPTY_OBJECT)
    {
      newline();
      replaceTop(JsonScope.DANGLING_NAME);
      return;
    }
    throw new IllegalStateException("Nesting problem: " + this.stack);
  }
  
  private void beforeValue(boolean paramBoolean)
    throws IOException
  {
    switch (peek())
    {
    default: 
      throw new IllegalStateException("Nesting problem: " + this.stack);
    case ???: 
      if ((!this.lenient) && (!paramBoolean)) {
        throw new IllegalStateException("JSON must start with an array or an object.");
      }
      replaceTop(JsonScope.NONEMPTY_DOCUMENT);
    case ???: 
    case ???: 
    case ???: 
      for (;;)
      {
        return;
        replaceTop(JsonScope.NONEMPTY_ARRAY);
        newline();
        continue;
        this.out.append(',');
        newline();
        continue;
        this.out.append(this.separator);
        replaceTop(JsonScope.NONEMPTY_OBJECT);
      }
    }
    throw new IllegalStateException("JSON must have only one top-level value.");
  }
  
  private JsonWriter close(JsonScope paramJsonScope1, JsonScope paramJsonScope2, String paramString)
    throws IOException
  {
    JsonScope localJsonScope = peek();
    if ((localJsonScope != paramJsonScope2) && (localJsonScope != paramJsonScope1)) {
      throw new IllegalStateException("Nesting problem: " + this.stack);
    }
    this.stack.remove(this.stack.size() - 1);
    if (localJsonScope == paramJsonScope2) {
      newline();
    }
    this.out.write(paramString);
    return this;
  }
  
  private void newline()
    throws IOException
  {
    if (this.indent == null) {}
    for (;;)
    {
      return;
      this.out.write("\n");
      for (int i = 1; i < this.stack.size(); i++) {
        this.out.write(this.indent);
      }
    }
  }
  
  private JsonWriter open(JsonScope paramJsonScope, String paramString)
    throws IOException
  {
    beforeValue(true);
    this.stack.add(paramJsonScope);
    this.out.write(paramString);
    return this;
  }
  
  private JsonScope peek()
  {
    return (JsonScope)this.stack.get(this.stack.size() - 1);
  }
  
  private void replaceTop(JsonScope paramJsonScope)
  {
    this.stack.set(this.stack.size() - 1, paramJsonScope);
  }
  
  private void string(String paramString)
    throws IOException
  {
    this.out.write("\"");
    int i = 0;
    int j = paramString.length();
    if (i < j)
    {
      int k = paramString.charAt(i);
      switch (k)
      {
      default: 
        if (k <= 31) {
          this.out.write(String.format("\\u%04x", new Object[] { Integer.valueOf(k) }));
        }
        break;
      }
      for (;;)
      {
        i++;
        break;
        this.out.write(92);
        this.out.write(k);
        continue;
        this.out.write("\\t");
        continue;
        this.out.write("\\b");
        continue;
        this.out.write("\\n");
        continue;
        this.out.write("\\r");
        continue;
        this.out.write("\\f");
        continue;
        this.out.write(String.format("\\u%04x", new Object[] { Integer.valueOf(k) }));
        continue;
        this.out.write(k);
      }
    }
    this.out.write("\"");
  }
  
  public JsonWriter beginArray()
    throws IOException
  {
    return open(JsonScope.EMPTY_ARRAY, "[");
  }
  
  public JsonWriter beginObject()
    throws IOException
  {
    return open(JsonScope.EMPTY_OBJECT, "{");
  }
  
  public void close()
    throws IOException
  {
    this.out.close();
    if (peek() != JsonScope.NONEMPTY_DOCUMENT) {
      throw new IOException("Incomplete document");
    }
  }
  
  public JsonWriter endArray()
    throws IOException
  {
    return close(JsonScope.EMPTY_ARRAY, JsonScope.NONEMPTY_ARRAY, "]");
  }
  
  public JsonWriter endObject()
    throws IOException
  {
    return close(JsonScope.EMPTY_OBJECT, JsonScope.NONEMPTY_OBJECT, "}");
  }
  
  public void flush()
    throws IOException
  {
    this.out.flush();
  }
  
  public boolean isLenient()
  {
    return this.lenient;
  }
  
  public JsonWriter name(String paramString)
    throws IOException
  {
    if (paramString == null) {
      throw new NullPointerException("name == null");
    }
    beforeName();
    string(paramString);
    return this;
  }
  
  public JsonWriter nullValue()
    throws IOException
  {
    beforeValue(false);
    this.out.write("null");
    return this;
  }
  
  public void setIndent(String paramString)
  {
    if (paramString.isEmpty()) {
      this.indent = null;
    }
    for (this.separator = ":";; this.separator = ": ")
    {
      return;
      this.indent = paramString;
    }
  }
  
  public void setLenient(boolean paramBoolean)
  {
    this.lenient = paramBoolean;
  }
  
  public JsonWriter value(double paramDouble)
    throws IOException
  {
    if ((!this.lenient) && ((Double.isNaN(paramDouble)) || (Double.isInfinite(paramDouble)))) {
      throw new IllegalArgumentException("Numeric values must be finite, but was " + paramDouble);
    }
    beforeValue(false);
    this.out.append(Double.toString(paramDouble));
    return this;
  }
  
  public JsonWriter value(long paramLong)
    throws IOException
  {
    beforeValue(false);
    this.out.write(Long.toString(paramLong));
    return this;
  }
  
  public JsonWriter value(Number paramNumber)
    throws IOException
  {
    if (paramNumber == null) {}
    for (paramNumber = nullValue();; paramNumber = this)
    {
      return paramNumber;
      String str = paramNumber.toString();
      if ((!this.lenient) && ((str.equals("-Infinity")) || (str.equals("Infinity")) || (str.equals("NaN")))) {
        throw new IllegalArgumentException("Numeric values must be finite, but was " + paramNumber);
      }
      beforeValue(false);
      this.out.append(str);
    }
  }
  
  public JsonWriter value(String paramString)
    throws IOException
  {
    if (paramString == null) {}
    for (paramString = nullValue();; paramString = this)
    {
      return paramString;
      beforeValue(false);
      string(paramString);
    }
  }
  
  public JsonWriter value(boolean paramBoolean)
    throws IOException
  {
    beforeValue(false);
    Writer localWriter = this.out;
    if (paramBoolean) {}
    for (String str = "true";; str = "false")
    {
      localWriter.write(str);
      return this;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/internal/util/JsonWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */