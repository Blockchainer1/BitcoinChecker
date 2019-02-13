package com.robotoworks.mechanoid.internal.util;

import java.io.Serializable;
import java.util.AbstractSet;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Collections
{
  public static <E> Set<E> newSetFromMap(Map<E, Boolean> paramMap)
  {
    if (paramMap.isEmpty()) {
      return new SetFromMap(paramMap);
    }
    throw new IllegalArgumentException();
  }
  
  private static class SetFromMap<E>
    extends AbstractSet<E>
    implements Serializable
  {
    private static final long serialVersionUID = 2454657854757543876L;
    private transient Set<E> backingSet;
    private Map<E, Boolean> m;
    
    SetFromMap(Map<E, Boolean> paramMap)
    {
      this.m = paramMap;
      this.backingSet = paramMap.keySet();
    }
    
    public boolean add(E paramE)
    {
      if (this.m.put(paramE, Boolean.TRUE) == null) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public void clear()
    {
      this.m.clear();
    }
    
    public boolean contains(Object paramObject)
    {
      return this.backingSet.contains(paramObject);
    }
    
    public boolean containsAll(Collection<?> paramCollection)
    {
      return this.backingSet.containsAll(paramCollection);
    }
    
    public boolean equals(Object paramObject)
    {
      return this.backingSet.equals(paramObject);
    }
    
    public int hashCode()
    {
      return this.backingSet.hashCode();
    }
    
    public boolean isEmpty()
    {
      return this.m.isEmpty();
    }
    
    public Iterator<E> iterator()
    {
      return this.backingSet.iterator();
    }
    
    public boolean remove(Object paramObject)
    {
      if (this.m.remove(paramObject) != null) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return this.backingSet.retainAll(paramCollection);
    }
    
    public int size()
    {
      return this.m.size();
    }
    
    public Object[] toArray()
    {
      return this.backingSet.toArray();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return this.backingSet.toArray(paramArrayOfT);
    }
    
    public String toString()
    {
      return this.backingSet.toString();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/internal/util/Collections.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */