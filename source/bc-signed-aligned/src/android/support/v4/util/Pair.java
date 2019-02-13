package android.support.v4.util;

public class Pair<F, S>
{
  public final F first;
  public final S second;
  
  public Pair(F paramF, S paramS)
  {
    this.first = paramF;
    this.second = paramS;
  }
  
  public static <A, B> Pair<A, B> create(A paramA, B paramB)
  {
    return new Pair(paramA, paramB);
  }
  
  private static boolean objectsEqual(Object paramObject1, Object paramObject2)
  {
    if ((paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool1 = false;
    boolean bool2;
    if (!(paramObject instanceof Pair)) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      paramObject = (Pair)paramObject;
      bool2 = bool1;
      if (objectsEqual(((Pair)paramObject).first, this.first))
      {
        bool2 = bool1;
        if (objectsEqual(((Pair)paramObject).second, this.second)) {
          bool2 = true;
        }
      }
    }
  }
  
  public int hashCode()
  {
    int i = 0;
    int j;
    if (this.first == null)
    {
      j = 0;
      if (this.second != null) {
        break label33;
      }
    }
    for (;;)
    {
      return j ^ i;
      j = this.first.hashCode();
      break;
      label33:
      i = this.second.hashCode();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/util/Pair.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */