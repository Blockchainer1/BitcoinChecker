package com.google.gson.internal;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Properties;

public final class $Gson$Types
{
  static final Type[] EMPTY_TYPE_ARRAY = new Type[0];
  
  public static GenericArrayType arrayOf(Type paramType)
  {
    return new GenericArrayTypeImpl(paramType);
  }
  
  public static Type canonicalize(Type paramType)
  {
    if ((paramType instanceof Class))
    {
      Class localClass = (Class)paramType;
      paramType = localClass;
      if (localClass.isArray()) {
        paramType = new GenericArrayTypeImpl(canonicalize(localClass.getComponentType()));
      }
    }
    for (;;)
    {
      return paramType;
      if ((paramType instanceof ParameterizedType))
      {
        paramType = (ParameterizedType)paramType;
        paramType = new ParameterizedTypeImpl(paramType.getOwnerType(), paramType.getRawType(), paramType.getActualTypeArguments());
      }
      else if ((paramType instanceof GenericArrayType))
      {
        paramType = new GenericArrayTypeImpl(((GenericArrayType)paramType).getGenericComponentType());
      }
      else if ((paramType instanceof WildcardType))
      {
        paramType = (WildcardType)paramType;
        paramType = new WildcardTypeImpl(paramType.getUpperBounds(), paramType.getLowerBounds());
      }
    }
  }
  
  private static void checkNotPrimitive(Type paramType)
  {
    if ((!(paramType instanceof Class)) || (!((Class)paramType).isPrimitive())) {}
    for (boolean bool = true;; bool = false)
    {
      .Gson.Preconditions.checkArgument(bool);
      return;
    }
  }
  
  private static Class<?> declaringClassOf(TypeVariable<?> paramTypeVariable)
  {
    paramTypeVariable = paramTypeVariable.getGenericDeclaration();
    if ((paramTypeVariable instanceof Class)) {}
    for (paramTypeVariable = (Class)paramTypeVariable;; paramTypeVariable = null) {
      return paramTypeVariable;
    }
  }
  
  static boolean equal(Object paramObject1, Object paramObject2)
  {
    if ((paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static boolean equals(Type paramType1, Type paramType2)
  {
    boolean bool1 = true;
    boolean bool2 = true;
    boolean bool3 = true;
    boolean bool4 = false;
    if (paramType1 == paramType2) {
      bool5 = true;
    }
    do
    {
      do
      {
        do
        {
          for (;;)
          {
            return bool5;
            if ((paramType1 instanceof Class))
            {
              bool5 = paramType1.equals(paramType2);
            }
            else if ((paramType1 instanceof ParameterizedType))
            {
              bool5 = bool4;
              if ((paramType2 instanceof ParameterizedType))
              {
                paramType1 = (ParameterizedType)paramType1;
                paramType2 = (ParameterizedType)paramType2;
                if ((equal(paramType1.getOwnerType(), paramType2.getOwnerType())) && (paramType1.getRawType().equals(paramType2.getRawType())) && (Arrays.equals(paramType1.getActualTypeArguments(), paramType2.getActualTypeArguments()))) {}
                for (bool5 = bool3;; bool5 = false) {
                  break;
                }
              }
            }
            else
            {
              if (!(paramType1 instanceof GenericArrayType)) {
                break;
              }
              bool5 = bool4;
              if ((paramType2 instanceof GenericArrayType))
              {
                paramType1 = (GenericArrayType)paramType1;
                paramType2 = (GenericArrayType)paramType2;
                bool5 = equals(paramType1.getGenericComponentType(), paramType2.getGenericComponentType());
              }
            }
          }
          if (!(paramType1 instanceof WildcardType)) {
            break;
          }
          bool5 = bool4;
        } while (!(paramType2 instanceof WildcardType));
        paramType1 = (WildcardType)paramType1;
        paramType2 = (WildcardType)paramType2;
        if ((Arrays.equals(paramType1.getUpperBounds(), paramType2.getUpperBounds())) && (Arrays.equals(paramType1.getLowerBounds(), paramType2.getLowerBounds()))) {}
        for (bool5 = bool1;; bool5 = false) {
          break;
        }
        bool5 = bool4;
      } while (!(paramType1 instanceof TypeVariable));
      bool5 = bool4;
    } while (!(paramType2 instanceof TypeVariable));
    paramType1 = (TypeVariable)paramType1;
    paramType2 = (TypeVariable)paramType2;
    if ((paramType1.getGenericDeclaration() == paramType2.getGenericDeclaration()) && (paramType1.getName().equals(paramType2.getName()))) {}
    for (boolean bool5 = bool2;; bool5 = false) {
      break;
    }
  }
  
  public static Type getArrayComponentType(Type paramType)
  {
    if ((paramType instanceof GenericArrayType)) {}
    for (paramType = ((GenericArrayType)paramType).getGenericComponentType();; paramType = ((Class)paramType).getComponentType()) {
      return paramType;
    }
  }
  
  public static Type getCollectionElementType(Type paramType, Class<?> paramClass)
  {
    paramClass = getSupertype(paramType, paramClass, Collection.class);
    paramType = paramClass;
    if ((paramClass instanceof WildcardType)) {
      paramType = ((WildcardType)paramClass).getUpperBounds()[0];
    }
    if ((paramType instanceof ParameterizedType)) {}
    for (paramType = ((ParameterizedType)paramType).getActualTypeArguments()[0];; paramType = Object.class) {
      return paramType;
    }
  }
  
  static Type getGenericSupertype(Type paramType, Class<?> paramClass1, Class<?> paramClass2)
  {
    if (paramClass2 == paramClass1) {}
    for (;;)
    {
      return paramType;
      if (paramClass2.isInterface())
      {
        paramType = paramClass1.getInterfaces();
        int i = 0;
        int j = paramType.length;
        for (;;)
        {
          if (i >= j) {
            break label81;
          }
          if (paramType[i] == paramClass2)
          {
            paramType = paramClass1.getGenericInterfaces()[i];
            break;
          }
          if (paramClass2.isAssignableFrom(paramType[i]))
          {
            paramType = getGenericSupertype(paramClass1.getGenericInterfaces()[i], paramType[i], paramClass2);
            break;
          }
          i++;
        }
      }
      label81:
      if (!paramClass1.isInterface()) {
        for (;;)
        {
          if (paramClass1 == Object.class) {
            break label138;
          }
          paramType = paramClass1.getSuperclass();
          if (paramType == paramClass2)
          {
            paramType = paramClass1.getGenericSuperclass();
            break;
          }
          if (paramClass2.isAssignableFrom(paramType))
          {
            paramType = getGenericSupertype(paramClass1.getGenericSuperclass(), paramType, paramClass2);
            break;
          }
          paramClass1 = paramType;
        }
      }
      label138:
      paramType = paramClass2;
    }
  }
  
  public static Type[] getMapKeyAndValueTypes(Type paramType, Class<?> paramClass)
  {
    if (paramType == Properties.class)
    {
      paramType = new Type[2];
      paramType[0] = String.class;
      paramType[1] = String.class;
    }
    for (;;)
    {
      return paramType;
      paramType = getSupertype(paramType, paramClass, Map.class);
      if ((paramType instanceof ParameterizedType))
      {
        paramType = ((ParameterizedType)paramType).getActualTypeArguments();
      }
      else
      {
        paramType = new Type[2];
        paramType[0] = Object.class;
        paramType[1] = Object.class;
      }
    }
  }
  
  public static Class<?> getRawType(Type paramType)
  {
    if ((paramType instanceof Class)) {
      paramType = (Class)paramType;
    }
    for (;;)
    {
      return paramType;
      if ((paramType instanceof ParameterizedType))
      {
        paramType = ((ParameterizedType)paramType).getRawType();
        .Gson.Preconditions.checkArgument(paramType instanceof Class);
        paramType = (Class)paramType;
      }
      else if ((paramType instanceof GenericArrayType))
      {
        paramType = Array.newInstance(getRawType(((GenericArrayType)paramType).getGenericComponentType()), 0).getClass();
      }
      else if ((paramType instanceof TypeVariable))
      {
        paramType = Object.class;
      }
      else
      {
        if (!(paramType instanceof WildcardType)) {
          break;
        }
        paramType = getRawType(((WildcardType)paramType).getUpperBounds()[0]);
      }
    }
    if (paramType == null) {}
    for (String str = "null";; str = paramType.getClass().getName()) {
      throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + paramType + "> is of type " + str);
    }
  }
  
  static Type getSupertype(Type paramType, Class<?> paramClass1, Class<?> paramClass2)
  {
    .Gson.Preconditions.checkArgument(paramClass2.isAssignableFrom(paramClass1));
    return resolve(paramType, paramClass1, getGenericSupertype(paramType, paramClass1, paramClass2));
  }
  
  private static int hashCodeOrZero(Object paramObject)
  {
    if (paramObject != null) {}
    for (int i = paramObject.hashCode();; i = 0) {
      return i;
    }
  }
  
  private static int indexOf(Object[] paramArrayOfObject, Object paramObject)
  {
    for (int i = 0; i < paramArrayOfObject.length; i++) {
      if (paramObject.equals(paramArrayOfObject[i])) {
        return i;
      }
    }
    throw new NoSuchElementException();
  }
  
  public static ParameterizedType newParameterizedTypeWithOwner(Type paramType1, Type paramType2, Type... paramVarArgs)
  {
    return new ParameterizedTypeImpl(paramType1, paramType2, paramVarArgs);
  }
  
  public static Type resolve(Type paramType1, Class<?> paramClass, Type paramType2)
  {
    Object localObject1;
    Object localObject2;
    while ((paramType2 instanceof TypeVariable))
    {
      localObject1 = (TypeVariable)paramType2;
      localObject2 = resolveTypeVariable(paramType1, paramClass, (TypeVariable)localObject1);
      paramType2 = (Type)localObject2;
      if (localObject2 == localObject1) {
        paramType2 = (Type)localObject2;
      }
    }
    for (;;)
    {
      return paramType2;
      if (((paramType2 instanceof Class)) && (((Class)paramType2).isArray()))
      {
        paramType2 = (Class)paramType2;
        localObject2 = paramType2.getComponentType();
        paramType1 = resolve(paramType1, paramClass, (Type)localObject2);
        if (localObject2 == paramType1) {}
        for (paramType1 = paramType2;; paramType1 = arrayOf(paramType1))
        {
          paramType2 = paramType1;
          break;
        }
      }
      if ((paramType2 instanceof GenericArrayType))
      {
        paramType2 = (GenericArrayType)paramType2;
        localObject2 = paramType2.getGenericComponentType();
        paramType1 = resolve(paramType1, paramClass, (Type)localObject2);
        if (localObject2 != paramType1) {
          paramType2 = arrayOf(paramType1);
        }
      }
      else
      {
        Object localObject3;
        if ((paramType2 instanceof ParameterizedType))
        {
          localObject1 = (ParameterizedType)paramType2;
          paramType2 = ((ParameterizedType)localObject1).getOwnerType();
          localObject3 = resolve(paramType1, paramClass, paramType2);
          if (localObject3 != paramType2) {}
          for (int i = 1;; i = 0)
          {
            localObject2 = ((ParameterizedType)localObject1).getActualTypeArguments();
            int j = 0;
            int k = localObject2.length;
            while (j < k)
            {
              Type localType = resolve(paramType1, paramClass, localObject2[j]);
              paramType2 = (Type)localObject2;
              int m = i;
              if (localType != localObject2[j])
              {
                paramType2 = (Type)localObject2;
                m = i;
                if (i == 0)
                {
                  paramType2 = (Type[])((Type[])localObject2).clone();
                  m = 1;
                }
                paramType2[j] = localType;
              }
              j++;
              localObject2 = paramType2;
              i = m;
            }
          }
          paramType2 = (Type)localObject1;
          if (i != 0) {
            paramType2 = newParameterizedTypeWithOwner((Type)localObject3, ((ParameterizedType)localObject1).getRawType(), (Type[])localObject2);
          }
        }
        else if ((paramType2 instanceof WildcardType))
        {
          localObject2 = (WildcardType)paramType2;
          localObject1 = ((WildcardType)localObject2).getLowerBounds();
          localObject3 = ((WildcardType)localObject2).getUpperBounds();
          if (localObject1.length == 1)
          {
            paramType1 = resolve(paramType1, paramClass, localObject1[0]);
            paramType2 = (Type)localObject2;
            if (paramType1 != localObject1[0]) {
              paramType2 = supertypeOf(paramType1);
            }
          }
          else
          {
            paramType2 = (Type)localObject2;
            if (localObject3.length == 1)
            {
              paramType1 = resolve(paramType1, paramClass, localObject3[0]);
              paramType2 = (Type)localObject2;
              if (paramType1 != localObject3[0]) {
                paramType2 = subtypeOf(paramType1);
              }
            }
          }
        }
      }
    }
  }
  
  static Type resolveTypeVariable(Type paramType, Class<?> paramClass, TypeVariable<?> paramTypeVariable)
  {
    Class localClass = declaringClassOf(paramTypeVariable);
    if (localClass == null) {
      paramType = paramTypeVariable;
    }
    for (;;)
    {
      return paramType;
      paramClass = getGenericSupertype(paramType, paramClass, localClass);
      paramType = paramTypeVariable;
      if ((paramClass instanceof ParameterizedType))
      {
        int i = indexOf(localClass.getTypeParameters(), paramTypeVariable);
        paramType = ((ParameterizedType)paramClass).getActualTypeArguments()[i];
      }
    }
  }
  
  public static WildcardType subtypeOf(Type paramType)
  {
    Type[] arrayOfType = EMPTY_TYPE_ARRAY;
    return new WildcardTypeImpl(new Type[] { paramType }, arrayOfType);
  }
  
  public static WildcardType supertypeOf(Type paramType)
  {
    return new WildcardTypeImpl(new Type[] { Object.class }, new Type[] { paramType });
  }
  
  public static String typeToString(Type paramType)
  {
    if ((paramType instanceof Class)) {}
    for (paramType = ((Class)paramType).getName();; paramType = paramType.toString()) {
      return paramType;
    }
  }
  
  private static final class GenericArrayTypeImpl
    implements GenericArrayType, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Type componentType;
    
    public GenericArrayTypeImpl(Type paramType)
    {
      this.componentType = .Gson.Types.canonicalize(paramType);
    }
    
    public boolean equals(Object paramObject)
    {
      if (((paramObject instanceof GenericArrayType)) && (.Gson.Types.equals(this, (GenericArrayType)paramObject))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public Type getGenericComponentType()
    {
      return this.componentType;
    }
    
    public int hashCode()
    {
      return this.componentType.hashCode();
    }
    
    public String toString()
    {
      return .Gson.Types.typeToString(this.componentType) + "[]";
    }
  }
  
  private static final class ParameterizedTypeImpl
    implements ParameterizedType, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Type ownerType;
    private final Type rawType;
    private final Type[] typeArguments;
    
    public ParameterizedTypeImpl(Type paramType1, Type paramType2, Type... paramVarArgs)
    {
      boolean bool2;
      if ((paramType2 instanceof Class))
      {
        Class localClass = (Class)paramType2;
        if ((paramType1 != null) || (localClass.getEnclosingClass() == null))
        {
          bool2 = true;
          .Gson.Preconditions.checkArgument(bool2);
          if (paramType1 != null)
          {
            bool2 = bool1;
            if (localClass.getEnclosingClass() == null) {}
          }
          else
          {
            bool2 = true;
          }
          .Gson.Preconditions.checkArgument(bool2);
        }
      }
      else
      {
        if (paramType1 != null) {
          break label157;
        }
      }
      label157:
      for (paramType1 = null;; paramType1 = .Gson.Types.canonicalize(paramType1))
      {
        this.ownerType = paramType1;
        this.rawType = .Gson.Types.canonicalize(paramType2);
        this.typeArguments = ((Type[])paramVarArgs.clone());
        for (int i = 0; i < this.typeArguments.length; i++)
        {
          .Gson.Preconditions.checkNotNull(this.typeArguments[i]);
          .Gson.Types.checkNotPrimitive(this.typeArguments[i]);
          this.typeArguments[i] = .Gson.Types.canonicalize(this.typeArguments[i]);
        }
        bool2 = false;
        break;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (((paramObject instanceof ParameterizedType)) && (.Gson.Types.equals(this, (ParameterizedType)paramObject))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public Type[] getActualTypeArguments()
    {
      return (Type[])this.typeArguments.clone();
    }
    
    public Type getOwnerType()
    {
      return this.ownerType;
    }
    
    public Type getRawType()
    {
      return this.rawType;
    }
    
    public int hashCode()
    {
      return Arrays.hashCode(this.typeArguments) ^ this.rawType.hashCode() ^ .Gson.Types.hashCodeOrZero(this.ownerType);
    }
    
    public String toString()
    {
      Object localObject = new StringBuilder((this.typeArguments.length + 1) * 30);
      ((StringBuilder)localObject).append(.Gson.Types.typeToString(this.rawType));
      if (this.typeArguments.length == 0) {}
      for (localObject = ((StringBuilder)localObject).toString();; localObject = ">")
      {
        return (String)localObject;
        ((StringBuilder)localObject).append("<").append(.Gson.Types.typeToString(this.typeArguments[0]));
        for (int i = 1; i < this.typeArguments.length; i++) {
          ((StringBuilder)localObject).append(", ").append(.Gson.Types.typeToString(this.typeArguments[i]));
        }
      }
    }
  }
  
  private static final class WildcardTypeImpl
    implements WildcardType, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Type lowerBound;
    private final Type upperBound;
    
    public WildcardTypeImpl(Type[] paramArrayOfType1, Type[] paramArrayOfType2)
    {
      boolean bool2;
      if (paramArrayOfType2.length <= 1)
      {
        bool2 = true;
        .Gson.Preconditions.checkArgument(bool2);
        if (paramArrayOfType1.length != 1) {
          break label92;
        }
        bool2 = true;
        label29:
        .Gson.Preconditions.checkArgument(bool2);
        if (paramArrayOfType2.length != 1) {
          break label104;
        }
        .Gson.Preconditions.checkNotNull(paramArrayOfType2[0]);
        .Gson.Types.checkNotPrimitive(paramArrayOfType2[0]);
        if (paramArrayOfType1[0] != Object.class) {
          break label98;
        }
        bool2 = bool1;
        label64:
        .Gson.Preconditions.checkArgument(bool2);
        this.lowerBound = .Gson.Types.canonicalize(paramArrayOfType2[0]);
      }
      for (this.upperBound = Object.class;; this.upperBound = .Gson.Types.canonicalize(paramArrayOfType1[0]))
      {
        return;
        bool2 = false;
        break;
        label92:
        bool2 = false;
        break label29;
        label98:
        bool2 = false;
        break label64;
        label104:
        .Gson.Preconditions.checkNotNull(paramArrayOfType1[0]);
        .Gson.Types.checkNotPrimitive(paramArrayOfType1[0]);
        this.lowerBound = null;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      if (((paramObject instanceof WildcardType)) && (.Gson.Types.equals(this, (WildcardType)paramObject))) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public Type[] getLowerBounds()
    {
      Type[] arrayOfType;
      if (this.lowerBound != null)
      {
        arrayOfType = new Type[1];
        arrayOfType[0] = this.lowerBound;
      }
      for (;;)
      {
        return arrayOfType;
        arrayOfType = .Gson.Types.EMPTY_TYPE_ARRAY;
      }
    }
    
    public Type[] getUpperBounds()
    {
      return new Type[] { this.upperBound };
    }
    
    public int hashCode()
    {
      if (this.lowerBound != null) {}
      for (int i = this.lowerBound.hashCode() + 31;; i = 1) {
        return i ^ this.upperBound.hashCode() + 31;
      }
    }
    
    public String toString()
    {
      String str;
      if (this.lowerBound != null) {
        str = "? super " + .Gson.Types.typeToString(this.lowerBound);
      }
      for (;;)
      {
        return str;
        if (this.upperBound == Object.class) {
          str = "?";
        } else {
          str = "? extends " + .Gson.Types.typeToString(this.upperBound);
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/google/gson/internal/$Gson$Types.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */