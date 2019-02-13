package com.google.gson;

import com.google.gson.internal..Gson.Preconditions;
import com.google.gson.internal.LazilyParsedNumber;
import java.math.BigDecimal;
import java.math.BigInteger;

public final class JsonPrimitive
  extends JsonElement
{
  private static final Class<?>[] PRIMITIVE_TYPES = { Integer.TYPE, Long.TYPE, Short.TYPE, Float.TYPE, Double.TYPE, Byte.TYPE, Boolean.TYPE, Character.TYPE, Integer.class, Long.class, Short.class, Float.class, Double.class, Byte.class, Boolean.class, Character.class };
  private Object value;
  
  public JsonPrimitive(Boolean paramBoolean)
  {
    setValue(paramBoolean);
  }
  
  public JsonPrimitive(Character paramCharacter)
  {
    setValue(paramCharacter);
  }
  
  public JsonPrimitive(Number paramNumber)
  {
    setValue(paramNumber);
  }
  
  JsonPrimitive(Object paramObject)
  {
    setValue(paramObject);
  }
  
  public JsonPrimitive(String paramString)
  {
    setValue(paramString);
  }
  
  private static boolean isIntegral(JsonPrimitive paramJsonPrimitive)
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    if ((paramJsonPrimitive.value instanceof Number))
    {
      paramJsonPrimitive = (Number)paramJsonPrimitive.value;
      if ((!(paramJsonPrimitive instanceof BigInteger)) && (!(paramJsonPrimitive instanceof Long)) && (!(paramJsonPrimitive instanceof Integer)) && (!(paramJsonPrimitive instanceof Short)))
      {
        bool2 = bool1;
        if (!(paramJsonPrimitive instanceof Byte)) {}
      }
      else
      {
        bool2 = true;
      }
    }
    return bool2;
  }
  
  private static boolean isPrimitiveOrString(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool2;
    if ((paramObject instanceof String)) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      Class localClass = paramObject.getClass();
      paramObject = PRIMITIVE_TYPES;
      int i = paramObject.length;
      for (int j = 0;; j++)
      {
        if (j >= i) {
          break label55;
        }
        bool2 = bool1;
        if (paramObject[j].isAssignableFrom(localClass)) {
          break;
        }
      }
      label55:
      bool2 = false;
    }
  }
  
  JsonPrimitive deepCopy()
  {
    return this;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool2 = false;
    if (this == paramObject) {}
    for (;;)
    {
      return bool1;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
      {
        bool1 = false;
      }
      else
      {
        paramObject = (JsonPrimitive)paramObject;
        if (this.value == null)
        {
          if (((JsonPrimitive)paramObject).value != null) {
            bool1 = false;
          }
        }
        else if ((isIntegral(this)) && (isIntegral((JsonPrimitive)paramObject)))
        {
          if (getAsNumber().longValue() != ((JsonPrimitive)paramObject).getAsNumber().longValue()) {
            bool1 = false;
          }
        }
        else if (((this.value instanceof Number)) && ((((JsonPrimitive)paramObject).value instanceof Number)))
        {
          double d1 = getAsNumber().doubleValue();
          double d2 = ((JsonPrimitive)paramObject).getAsNumber().doubleValue();
          if (d1 != d2)
          {
            bool1 = bool2;
            if (Double.isNaN(d1))
            {
              bool1 = bool2;
              if (!Double.isNaN(d2)) {}
            }
          }
          else
          {
            bool1 = true;
          }
        }
        else
        {
          bool1 = this.value.equals(((JsonPrimitive)paramObject).value);
        }
      }
    }
  }
  
  public BigDecimal getAsBigDecimal()
  {
    if ((this.value instanceof BigDecimal)) {}
    for (BigDecimal localBigDecimal = (BigDecimal)this.value;; localBigDecimal = new BigDecimal(this.value.toString())) {
      return localBigDecimal;
    }
  }
  
  public BigInteger getAsBigInteger()
  {
    if ((this.value instanceof BigInteger)) {}
    for (BigInteger localBigInteger = (BigInteger)this.value;; localBigInteger = new BigInteger(this.value.toString())) {
      return localBigInteger;
    }
  }
  
  public boolean getAsBoolean()
  {
    if (isBoolean()) {}
    for (boolean bool = getAsBooleanWrapper().booleanValue();; bool = Boolean.parseBoolean(getAsString())) {
      return bool;
    }
  }
  
  Boolean getAsBooleanWrapper()
  {
    return (Boolean)this.value;
  }
  
  public byte getAsByte()
  {
    byte b1;
    if (isNumber()) {
      b1 = getAsNumber().byteValue();
    }
    for (byte b2 = b1;; b2 = b1)
    {
      return b2;
      b1 = Byte.parseByte(getAsString());
    }
  }
  
  public char getAsCharacter()
  {
    return getAsString().charAt(0);
  }
  
  public double getAsDouble()
  {
    if (isNumber()) {}
    for (double d = getAsNumber().doubleValue();; d = Double.parseDouble(getAsString())) {
      return d;
    }
  }
  
  public float getAsFloat()
  {
    if (isNumber()) {}
    for (float f = getAsNumber().floatValue();; f = Float.parseFloat(getAsString())) {
      return f;
    }
  }
  
  public int getAsInt()
  {
    if (isNumber()) {}
    for (int i = getAsNumber().intValue();; i = Integer.parseInt(getAsString())) {
      return i;
    }
  }
  
  public long getAsLong()
  {
    if (isNumber()) {}
    for (long l = getAsNumber().longValue();; l = Long.parseLong(getAsString())) {
      return l;
    }
  }
  
  public Number getAsNumber()
  {
    if ((this.value instanceof String)) {}
    for (Object localObject = new LazilyParsedNumber((String)this.value);; localObject = (Number)this.value) {
      return (Number)localObject;
    }
  }
  
  public short getAsShort()
  {
    short s1;
    if (isNumber()) {
      s1 = getAsNumber().shortValue();
    }
    for (short s2 = s1;; s2 = s1)
    {
      return s2;
      s1 = Short.parseShort(getAsString());
    }
  }
  
  public String getAsString()
  {
    String str;
    if (isNumber()) {
      str = getAsNumber().toString();
    }
    for (;;)
    {
      return str;
      if (isBoolean()) {
        str = getAsBooleanWrapper().toString();
      } else {
        str = (String)this.value;
      }
    }
  }
  
  public int hashCode()
  {
    int i;
    if (this.value == null) {
      i = 31;
    }
    for (;;)
    {
      return i;
      long l;
      if (isIntegral(this))
      {
        l = getAsNumber().longValue();
        i = (int)(l >>> 32 ^ l);
      }
      else if ((this.value instanceof Number))
      {
        l = Double.doubleToLongBits(getAsNumber().doubleValue());
        i = (int)(l >>> 32 ^ l);
      }
      else
      {
        i = this.value.hashCode();
      }
    }
  }
  
  public boolean isBoolean()
  {
    return this.value instanceof Boolean;
  }
  
  public boolean isNumber()
  {
    return this.value instanceof Number;
  }
  
  public boolean isString()
  {
    return this.value instanceof String;
  }
  
  void setValue(Object paramObject)
  {
    if ((paramObject instanceof Character))
    {
      this.value = String.valueOf(((Character)paramObject).charValue());
      return;
    }
    if (((paramObject instanceof Number)) || (isPrimitiveOrString(paramObject))) {}
    for (boolean bool = true;; bool = false)
    {
      .Gson.Preconditions.checkArgument(bool);
      this.value = paramObject;
      break;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/google/gson/JsonPrimitive.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */