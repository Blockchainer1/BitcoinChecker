package com.robotoworks.mechanoid.internal.util;

import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public final class JsonReader
  implements Closeable
{
  private static final String FALSE = "false";
  private static final String TRUE = "true";
  private final char[] buffer = new char['Ѐ'];
  private int bufferStartColumn = 1;
  private int bufferStartLine = 1;
  private final Reader in;
  private boolean lenient = false;
  private int limit = 0;
  private String name;
  private int pos = 0;
  private boolean skipping;
  private final List<JsonScope> stack = new ArrayList();
  private final StringPool stringPool = new StringPool();
  private JsonToken token;
  private String value;
  private int valueLength;
  private int valuePos;
  
  public JsonReader(Reader paramReader)
  {
    push(JsonScope.EMPTY_DOCUMENT);
    this.skipping = false;
    if (paramReader == null) {
      throw new NullPointerException("in == null");
    }
    this.in = paramReader;
  }
  
  private JsonToken advance()
    throws IOException
  {
    peek();
    JsonToken localJsonToken = this.token;
    this.token = null;
    this.value = null;
    this.name = null;
    return localJsonToken;
  }
  
  private void checkLenient()
    throws IOException
  {
    if (!this.lenient) {
      throw syntaxError("Use JsonReader.setLenient(true) to accept malformed JSON");
    }
  }
  
  private JsonToken decodeLiteral()
    throws IOException
  {
    JsonToken localJsonToken;
    if (this.valuePos == -1) {
      localJsonToken = JsonToken.STRING;
    }
    for (;;)
    {
      return localJsonToken;
      if ((this.valueLength == 4) && (('n' == this.buffer[this.valuePos]) || ('N' == this.buffer[this.valuePos])) && (('u' == this.buffer[(this.valuePos + 1)]) || ('U' == this.buffer[(this.valuePos + 1)])) && (('l' == this.buffer[(this.valuePos + 2)]) || ('L' == this.buffer[(this.valuePos + 2)])) && (('l' == this.buffer[(this.valuePos + 3)]) || ('L' == this.buffer[(this.valuePos + 3)])))
      {
        this.value = "null";
        localJsonToken = JsonToken.NULL;
      }
      else if ((this.valueLength == 4) && (('t' == this.buffer[this.valuePos]) || ('T' == this.buffer[this.valuePos])) && (('r' == this.buffer[(this.valuePos + 1)]) || ('R' == this.buffer[(this.valuePos + 1)])) && (('u' == this.buffer[(this.valuePos + 2)]) || ('U' == this.buffer[(this.valuePos + 2)])) && (('e' == this.buffer[(this.valuePos + 3)]) || ('E' == this.buffer[(this.valuePos + 3)])))
      {
        this.value = "true";
        localJsonToken = JsonToken.BOOLEAN;
      }
      else if ((this.valueLength == 5) && (('f' == this.buffer[this.valuePos]) || ('F' == this.buffer[this.valuePos])) && (('a' == this.buffer[(this.valuePos + 1)]) || ('A' == this.buffer[(this.valuePos + 1)])) && (('l' == this.buffer[(this.valuePos + 2)]) || ('L' == this.buffer[(this.valuePos + 2)])) && (('s' == this.buffer[(this.valuePos + 3)]) || ('S' == this.buffer[(this.valuePos + 3)])) && (('e' == this.buffer[(this.valuePos + 4)]) || ('E' == this.buffer[(this.valuePos + 4)])))
      {
        this.value = "false";
        localJsonToken = JsonToken.BOOLEAN;
      }
      else
      {
        this.value = this.stringPool.get(this.buffer, this.valuePos, this.valueLength);
        localJsonToken = decodeNumber(this.buffer, this.valuePos, this.valueLength);
      }
    }
  }
  
  private JsonToken decodeNumber(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    int j = paramArrayOfChar[i];
    int k = j;
    int m = i;
    if (j == 45)
    {
      m = i + 1;
      k = paramArrayOfChar[m];
    }
    if (k == 48)
    {
      i = m + 1;
      k = paramArrayOfChar[i];
      j = k;
      m = i;
      if (k == 46)
      {
        k = i + 1;
        for (i = paramArrayOfChar[k];; i = paramArrayOfChar[k])
        {
          j = i;
          m = k;
          if (i < 48) {
            break;
          }
          j = i;
          m = k;
          if (i > 57) {
            break;
          }
          k++;
        }
      }
    }
    else
    {
      if ((k >= 49) && (k <= 57))
      {
        j = m + 1;
        for (m = paramArrayOfChar[j];; m = paramArrayOfChar[j])
        {
          k = m;
          i = j;
          if (m < 48) {
            break;
          }
          k = m;
          i = j;
          if (m > 57) {
            break;
          }
          j++;
        }
      }
      paramArrayOfChar = JsonToken.STRING;
    }
    for (;;)
    {
      return paramArrayOfChar;
      if (j != 101)
      {
        i = m;
        if (j != 69) {}
      }
      else
      {
        k = m + 1;
        j = paramArrayOfChar[k];
        if (j != 43)
        {
          i = j;
          m = k;
          if (j != 45) {}
        }
        else
        {
          m = k + 1;
          i = paramArrayOfChar[m];
        }
        if ((i >= 48) && (i <= 57))
        {
          m++;
          for (k = paramArrayOfChar[m];; k = paramArrayOfChar[m])
          {
            i = m;
            if (k < 48) {
              break;
            }
            i = m;
            if (k > 57) {
              break;
            }
            m++;
          }
        }
        paramArrayOfChar = JsonToken.STRING;
        continue;
      }
      if (i == paramInt1 + paramInt2) {
        paramArrayOfChar = JsonToken.NUMBER;
      } else {
        paramArrayOfChar = JsonToken.STRING;
      }
    }
  }
  
  private void expect(JsonToken paramJsonToken)
    throws IOException
  {
    peek();
    if (this.token != paramJsonToken) {
      throw new IllegalStateException("Expected " + paramJsonToken + " but was " + peek());
    }
    advance();
  }
  
  private boolean fillBuffer(int paramInt)
    throws IOException
  {
    boolean bool = true;
    int i = 0;
    if (i < this.pos)
    {
      if (this.buffer[i] == '\n') {
        this.bufferStartLine += 1;
      }
      for (this.bufferStartColumn = 1;; this.bufferStartColumn += 1)
      {
        i++;
        break;
      }
    }
    if (this.limit != this.pos)
    {
      this.limit -= this.pos;
      System.arraycopy(this.buffer, this.pos, this.buffer, 0, this.limit);
      this.pos = 0;
      do
      {
        i = this.in.read(this.buffer, this.limit, this.buffer.length - this.limit);
        if (i == -1) {
          break;
        }
        this.limit += i;
        if ((this.bufferStartLine == 1) && (this.bufferStartColumn == 1) && (this.limit > 0) && (this.buffer[0] == 65279))
        {
          this.pos += 1;
          this.bufferStartColumn -= 1;
        }
      } while (this.limit < paramInt);
    }
    for (;;)
    {
      return bool;
      this.limit = 0;
      break;
      bool = false;
    }
  }
  
  private int getColumnNumber()
  {
    int i = this.bufferStartColumn;
    int j = 0;
    if (j < this.pos)
    {
      if (this.buffer[j] == '\n') {}
      for (i = 1;; i++)
      {
        j++;
        break;
      }
    }
    return i;
  }
  
  private int getLineNumber()
  {
    int i = this.bufferStartLine;
    int j = 0;
    while (j < this.pos)
    {
      int k = i;
      if (this.buffer[j] == '\n') {
        k = i + 1;
      }
      j++;
      i = k;
    }
    return i;
  }
  
  private CharSequence getSnippet()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = Math.min(this.pos, 20);
    localStringBuilder.append(this.buffer, this.pos - i, i);
    i = Math.min(this.limit - this.pos, 20);
    localStringBuilder.append(this.buffer, this.pos, i);
    return localStringBuilder;
  }
  
  private JsonToken nextInArray(boolean paramBoolean)
    throws IOException
  {
    label11:
    JsonToken localJsonToken;
    if (paramBoolean)
    {
      replaceTop(JsonScope.NONEMPTY_ARRAY);
      switch (nextNonWhitespace())
      {
      default: 
        this.pos -= 1;
        localJsonToken = nextValue();
      }
    }
    for (;;)
    {
      return localJsonToken;
      switch (nextNonWhitespace())
      {
      case 44: 
      default: 
        throw syntaxError("Unterminated array");
      case 93: 
        pop();
        localJsonToken = JsonToken.END_ARRAY;
        this.token = localJsonToken;
        break;
      case 59: 
        checkLenient();
        break label11;
        if (paramBoolean)
        {
          pop();
          localJsonToken = JsonToken.END_ARRAY;
          this.token = localJsonToken;
        }
        else
        {
          checkLenient();
          this.pos -= 1;
          this.value = "null";
          localJsonToken = JsonToken.NULL;
          this.token = localJsonToken;
        }
        break;
      }
    }
  }
  
  private JsonToken nextInObject(boolean paramBoolean)
    throws IOException
  {
    int i;
    JsonToken localJsonToken;
    if (paramBoolean) {
      switch (nextNonWhitespace())
      {
      default: 
        this.pos -= 1;
        i = nextNonWhitespace();
        switch (i)
        {
        default: 
          checkLenient();
          this.pos -= 1;
          this.name = nextLiteral(false);
          if (this.name.isEmpty()) {
            throw syntaxError("Expected name");
          }
          break;
        }
      case 125: 
        pop();
        localJsonToken = JsonToken.END_OBJECT;
        this.token = localJsonToken;
      }
    }
    for (;;)
    {
      return localJsonToken;
      switch (nextNonWhitespace())
      {
      case 44: 
      case 59: 
      default: 
        throw syntaxError("Unterminated object");
      }
      pop();
      localJsonToken = JsonToken.END_OBJECT;
      this.token = localJsonToken;
      continue;
      checkLenient();
      this.name = nextString((char)i);
      replaceTop(JsonScope.DANGLING_NAME);
      localJsonToken = JsonToken.NAME;
      this.token = localJsonToken;
    }
  }
  
  private String nextLiteral(boolean paramBoolean)
    throws IOException
  {
    Object localObject1 = null;
    this.valuePos = -1;
    this.valueLength = 0;
    int i = 0;
    Object localObject2;
    int j;
    while (this.pos + i < this.limit)
    {
      localObject2 = localObject1;
      j = i;
      switch (this.buffer[(this.pos + i)])
      {
      default: 
        i++;
        break;
      case '#': 
      case '/': 
      case ';': 
      case '=': 
      case '\\': 
        checkLenient();
        j = i;
        localObject2 = localObject1;
      case '\t': 
      case '\n': 
      case '\f': 
      case '\r': 
      case ' ': 
      case ',': 
      case ':': 
      case '[': 
      case ']': 
      case '{': 
      case '}': 
        label200:
        if ((!paramBoolean) || (localObject2 != null)) {
          break label352;
        }
        this.valuePos = this.pos;
        localObject1 = null;
      }
    }
    for (;;)
    {
      this.valueLength += j;
      this.pos += j;
      return (String)localObject1;
      if (i < this.buffer.length)
      {
        if (fillBuffer(i + 1)) {
          break;
        }
        this.buffer[this.limit] = ((char)0);
        localObject2 = localObject1;
        j = i;
        break label200;
      }
      localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = new StringBuilder();
      }
      ((StringBuilder)localObject2).append(this.buffer, this.pos, i);
      this.valueLength += i;
      this.pos += i;
      j = 0;
      i = 0;
      localObject1 = localObject2;
      if (fillBuffer(1)) {
        break;
      }
      break label200;
      label352:
      if (this.skipping)
      {
        localObject1 = "skipped!";
      }
      else if (localObject2 == null)
      {
        localObject1 = this.stringPool.get(this.buffer, this.pos, j);
      }
      else
      {
        ((StringBuilder)localObject2).append(this.buffer, this.pos, j);
        localObject1 = ((StringBuilder)localObject2).toString();
      }
    }
  }
  
  private int nextNonWhitespace()
    throws IOException
  {
    while ((this.pos < this.limit) || (fillBuffer(1)))
    {
      char[] arrayOfChar = this.buffer;
      int i = this.pos;
      this.pos = (i + 1);
      i = arrayOfChar[i];
      switch (i)
      {
      case 9: 
      case 10: 
      case 13: 
      case 32: 
      default: 
      case 47: 
        for (;;)
        {
          return i;
          if ((this.pos != this.limit) || (fillBuffer(1)))
          {
            checkLenient();
            switch (this.buffer[this.pos])
            {
            }
          }
        }
        this.pos += 1;
        if (!skipTo("*/")) {
          throw syntaxError("Unterminated comment");
        }
        this.pos += 2;
        continue;
        this.pos += 1;
        skipToEndOfLine();
        break;
      case 35: 
        checkLenient();
        skipToEndOfLine();
      }
    }
    throw new EOFException("End of input");
  }
  
  private String nextString(char paramChar)
    throws IOException
  {
    Object localObject1 = null;
    do
    {
      int i = this.pos;
      while (this.pos < this.limit)
      {
        localObject2 = this.buffer;
        char c = this.pos;
        this.pos = (c + '\001');
        c = localObject2[c];
        if (c == paramChar)
        {
          if (this.skipping) {
            localObject1 = "skipped!";
          }
          for (;;)
          {
            return (String)localObject1;
            if (localObject1 == null)
            {
              localObject1 = this.stringPool.get(this.buffer, i, this.pos - i - 1);
            }
            else
            {
              ((StringBuilder)localObject1).append(this.buffer, i, this.pos - i - 1);
              localObject1 = ((StringBuilder)localObject1).toString();
            }
          }
        }
        if (c == '\\')
        {
          localObject2 = localObject1;
          if (localObject1 == null) {
            localObject2 = new StringBuilder();
          }
          ((StringBuilder)localObject2).append(this.buffer, i, this.pos - i - 1);
          ((StringBuilder)localObject2).append(readEscapeCharacter());
          i = this.pos;
          localObject1 = localObject2;
        }
      }
      Object localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = new StringBuilder();
      }
      ((StringBuilder)localObject2).append(this.buffer, i, this.pos - i);
      localObject1 = localObject2;
    } while (fillBuffer(1));
    throw syntaxError("Unterminated string");
  }
  
  private JsonToken nextValue()
    throws IOException
  {
    int i = nextNonWhitespace();
    JsonToken localJsonToken;
    switch (i)
    {
    default: 
      this.pos -= 1;
      localJsonToken = readLiteral();
    }
    for (;;)
    {
      return localJsonToken;
      push(JsonScope.EMPTY_OBJECT);
      localJsonToken = JsonToken.BEGIN_OBJECT;
      this.token = localJsonToken;
      continue;
      push(JsonScope.EMPTY_ARRAY);
      localJsonToken = JsonToken.BEGIN_ARRAY;
      this.token = localJsonToken;
      continue;
      checkLenient();
      this.value = nextString((char)i);
      localJsonToken = JsonToken.STRING;
      this.token = localJsonToken;
    }
  }
  
  private JsonToken objectValue()
    throws IOException
  {
    switch (nextNonWhitespace())
    {
    case 59: 
    case 60: 
    default: 
      throw syntaxError("Expected ':'");
    case 61: 
      checkLenient();
      if (((this.pos < this.limit) || (fillBuffer(1))) && (this.buffer[this.pos] == '>')) {
        this.pos += 1;
      }
      break;
    }
    replaceTop(JsonScope.NONEMPTY_OBJECT);
    return nextValue();
  }
  
  private JsonScope peekStack()
  {
    return (JsonScope)this.stack.get(this.stack.size() - 1);
  }
  
  private JsonScope pop()
  {
    return (JsonScope)this.stack.remove(this.stack.size() - 1);
  }
  
  private void push(JsonScope paramJsonScope)
  {
    this.stack.add(paramJsonScope);
  }
  
  private char readEscapeCharacter()
    throws IOException
  {
    if ((this.pos == this.limit) && (!fillBuffer(1))) {
      throw syntaxError("Unterminated escape sequence");
    }
    Object localObject = this.buffer;
    int i = this.pos;
    this.pos = (i + 1);
    i = localObject[i];
    int j;
    switch (i)
    {
    default: 
      j = i;
    }
    for (;;)
    {
      return j;
      if ((this.pos + 4 > this.limit) && (!fillBuffer(4))) {
        throw syntaxError("Unterminated escape sequence");
      }
      localObject = this.stringPool.get(this.buffer, this.pos, 4);
      this.pos += 4;
      i = (char)Integer.parseInt((String)localObject, 16);
      j = i;
      continue;
      i = 9;
      j = i;
      continue;
      i = 8;
      j = i;
      continue;
      i = 10;
      j = i;
      continue;
      i = 13;
      j = i;
      continue;
      i = 12;
      j = i;
    }
  }
  
  private JsonToken readLiteral()
    throws IOException
  {
    this.value = nextLiteral(true);
    if (this.valueLength == 0) {
      throw syntaxError("Expected literal value");
    }
    this.token = decodeLiteral();
    if (this.token == JsonToken.STRING) {
      checkLenient();
    }
    return this.token;
  }
  
  private void replaceTop(JsonScope paramJsonScope)
  {
    this.stack.set(this.stack.size() - 1, paramJsonScope);
  }
  
  private boolean skipTo(String paramString)
    throws IOException
  {
    if ((this.pos + paramString.length() <= this.limit) || (fillBuffer(paramString.length()))) {
      for (int i = 0;; i++)
      {
        if (i >= paramString.length()) {
          break label75;
        }
        if (this.buffer[(this.pos + i)] != paramString.charAt(i))
        {
          this.pos += 1;
          break;
        }
      }
    }
    label75:
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private void skipToEndOfLine()
    throws IOException
  {
    int i;
    do
    {
      if ((this.pos >= this.limit) && (!fillBuffer(1))) {
        break;
      }
      char[] arrayOfChar = this.buffer;
      i = this.pos;
      this.pos = (i + 1);
      i = arrayOfChar[i];
    } while ((i != 13) && (i != 10));
  }
  
  private IOException syntaxError(String paramString)
    throws IOException
  {
    throw new MalformedJsonException(paramString + " at line " + getLineNumber() + " column " + getColumnNumber());
  }
  
  public void beginArray()
    throws IOException
  {
    expect(JsonToken.BEGIN_ARRAY);
  }
  
  public void beginObject()
    throws IOException
  {
    expect(JsonToken.BEGIN_OBJECT);
  }
  
  public void close()
    throws IOException
  {
    this.value = null;
    this.token = null;
    this.stack.clear();
    this.stack.add(JsonScope.CLOSED);
    this.in.close();
  }
  
  public void endArray()
    throws IOException
  {
    expect(JsonToken.END_ARRAY);
  }
  
  public void endObject()
    throws IOException
  {
    expect(JsonToken.END_OBJECT);
  }
  
  public boolean hasNext()
    throws IOException
  {
    peek();
    if ((this.token != JsonToken.END_OBJECT) && (this.token != JsonToken.END_ARRAY)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isLenient()
  {
    return this.lenient;
  }
  
  public boolean nextBoolean()
    throws IOException
  {
    peek();
    if (this.token != JsonToken.BOOLEAN) {
      throw new IllegalStateException("Expected a boolean but was " + this.token);
    }
    if (this.value == "true") {}
    for (boolean bool = true;; bool = false)
    {
      advance();
      return bool;
    }
  }
  
  public double nextDouble()
    throws IOException
  {
    peek();
    if ((this.token != JsonToken.STRING) && (this.token != JsonToken.NUMBER)) {
      throw new IllegalStateException("Expected a double but was " + this.token);
    }
    double d = Double.parseDouble(this.value);
    advance();
    return d;
  }
  
  public int nextInt()
    throws IOException
  {
    peek();
    if ((this.token != JsonToken.STRING) && (this.token != JsonToken.NUMBER)) {
      throw new IllegalStateException("Expected an int but was " + this.token);
    }
    try
    {
      i = Integer.parseInt(this.value);
      advance();
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      double d;
      int j;
      do
      {
        d = Double.parseDouble(this.value);
        j = (int)d;
        int i = j;
      } while (j == d);
      throw new NumberFormatException(this.value);
    }
  }
  
  public long nextLong()
    throws IOException
  {
    peek();
    if ((this.token != JsonToken.STRING) && (this.token != JsonToken.NUMBER)) {
      throw new IllegalStateException("Expected a long but was " + this.token);
    }
    try
    {
      l1 = Long.parseLong(this.value);
      advance();
      return l1;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      double d;
      long l2;
      do
      {
        d = Double.parseDouble(this.value);
        l2 = d;
        long l1 = l2;
      } while (l2 == d);
      throw new NumberFormatException(this.value);
    }
  }
  
  public String nextName()
    throws IOException
  {
    peek();
    if (this.token != JsonToken.NAME) {
      throw new IllegalStateException("Expected a name but was " + peek());
    }
    String str = this.name;
    advance();
    return str;
  }
  
  public void nextNull()
    throws IOException
  {
    peek();
    if (this.token != JsonToken.NULL) {
      throw new IllegalStateException("Expected null but was " + this.token);
    }
    advance();
  }
  
  public String nextString()
    throws IOException
  {
    peek();
    if ((this.token != JsonToken.STRING) && (this.token != JsonToken.NUMBER)) {
      throw new IllegalStateException("Expected a string but was " + peek());
    }
    String str = this.value;
    advance();
    return str;
  }
  
  public JsonToken peek()
    throws IOException
  {
    Object localObject;
    if (this.token != null) {
      localObject = this.token;
    }
    for (;;)
    {
      return (JsonToken)localObject;
      switch (peekStack())
      {
      default: 
        throw new AssertionError();
      case ???: 
        replaceTop(JsonScope.NONEMPTY_DOCUMENT);
        JsonToken localJsonToken2 = nextValue();
        localObject = localJsonToken2;
        if (!this.lenient)
        {
          localObject = localJsonToken2;
          if (this.token != JsonToken.BEGIN_ARRAY)
          {
            localObject = localJsonToken2;
            if (this.token != JsonToken.BEGIN_OBJECT) {
              throw new IOException("Expected JSON document to start with '[' or '{' but was " + this.token);
            }
          }
        }
        break;
      case ???: 
        localObject = nextInArray(true);
        break;
      case ???: 
        localObject = nextInArray(false);
        break;
      case ???: 
        localObject = nextInObject(true);
        break;
      case ???: 
        localObject = objectValue();
        break;
      case ???: 
        localObject = nextInObject(false);
        break;
      case ???: 
        try
        {
          localObject = nextValue();
          if (!this.lenient) {
            throw syntaxError("Expected EOF");
          }
        }
        catch (EOFException localEOFException)
        {
          JsonToken localJsonToken1 = JsonToken.END_DOCUMENT;
          this.token = localJsonToken1;
        }
      }
    }
    throw new IllegalStateException("JsonReader is closed");
  }
  
  public void setLenient(boolean paramBoolean)
  {
    this.lenient = paramBoolean;
  }
  
  /* Error */
  public void skipValue()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: iconst_1
    //   2: putfield 77	com/robotoworks/mechanoid/internal/util/JsonReader:skipping	Z
    //   5: iconst_0
    //   6: istore_1
    //   7: aload_0
    //   8: invokespecial 162	com/robotoworks/mechanoid/internal/util/JsonReader:advance	()Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    //   11: astore_2
    //   12: aload_2
    //   13: getstatic 288	com/robotoworks/mechanoid/internal/util/JsonToken:BEGIN_ARRAY	Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    //   16: if_acmpeq +12 -> 28
    //   19: getstatic 282	com/robotoworks/mechanoid/internal/util/JsonToken:BEGIN_OBJECT	Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    //   22: astore_3
    //   23: aload_2
    //   24: aload_3
    //   25: if_acmpne +22 -> 47
    //   28: iload_1
    //   29: iconst_1
    //   30: iadd
    //   31: istore 4
    //   33: iload 4
    //   35: istore_1
    //   36: iload 4
    //   38: ifne -31 -> 7
    //   41: aload_0
    //   42: iconst_0
    //   43: putfield 77	com/robotoworks/mechanoid/internal/util/JsonReader:skipping	Z
    //   46: return
    //   47: aload_2
    //   48: getstatic 214	com/robotoworks/mechanoid/internal/util/JsonToken:END_ARRAY	Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    //   51: if_acmpeq +15 -> 66
    //   54: getstatic 232	com/robotoworks/mechanoid/internal/util/JsonToken:END_OBJECT	Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    //   57: astore_3
    //   58: iload_1
    //   59: istore 4
    //   61: aload_2
    //   62: aload_3
    //   63: if_acmpne -30 -> 33
    //   66: iload_1
    //   67: iconst_1
    //   68: isub
    //   69: istore 4
    //   71: goto -38 -> 33
    //   74: astore_2
    //   75: aload_0
    //   76: iconst_0
    //   77: putfield 77	com/robotoworks/mechanoid/internal/util/JsonReader:skipping	Z
    //   80: aload_2
    //   81: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	82	0	this	JsonReader
    //   6	63	1	i	int
    //   11	51	2	localJsonToken1	JsonToken
    //   74	7	2	localObject	Object
    //   22	41	3	localJsonToken2	JsonToken
    //   31	39	4	j	int
    // Exception table:
    //   from	to	target	type
    //   7	23	74	finally
    //   47	58	74	finally
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + " near " + getSnippet();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/internal/util/JsonReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */