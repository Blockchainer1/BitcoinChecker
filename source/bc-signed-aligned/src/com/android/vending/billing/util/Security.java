package com.android.vending.billing.util;

import android.text.TextUtils;
import android.util.Log;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;

public class Security
{
  private static final String KEY_FACTORY_ALGORITHM = "RSA";
  private static final String SIGNATURE_ALGORITHM = "SHA1withRSA";
  private static final String TAG = "IABUtil/Security";
  
  public static PublicKey generatePublicKey(String paramString)
  {
    try
    {
      byte[] arrayOfByte = Base64.decode(paramString);
      KeyFactory localKeyFactory = KeyFactory.getInstance("RSA");
      paramString = new java/security/spec/X509EncodedKeySpec;
      paramString.<init>(arrayOfByte);
      paramString = localKeyFactory.generatePublic(paramString);
      return paramString;
    }
    catch (NoSuchAlgorithmException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (InvalidKeySpecException paramString)
    {
      Log.e("IABUtil/Security", "Invalid key specification.");
      throw new IllegalArgumentException(paramString);
    }
    catch (Base64DecoderException paramString)
    {
      Log.e("IABUtil/Security", "Base64 decoding failed.");
      throw new IllegalArgumentException(paramString);
    }
  }
  
  public static boolean verify(PublicKey paramPublicKey, String paramString1, String paramString2)
  {
    boolean bool = false;
    try
    {
      Signature localSignature = Signature.getInstance("SHA1withRSA");
      localSignature.initVerify(paramPublicKey);
      localSignature.update(paramString1.getBytes());
      if (!localSignature.verify(Base64.decode(paramString2))) {
        Log.e("IABUtil/Security", "Signature verification failed.");
      }
      for (;;)
      {
        return bool;
        bool = true;
      }
    }
    catch (NoSuchAlgorithmException paramPublicKey)
    {
      for (;;)
      {
        Log.e("IABUtil/Security", "NoSuchAlgorithmException.");
      }
    }
    catch (InvalidKeyException paramPublicKey)
    {
      for (;;)
      {
        Log.e("IABUtil/Security", "Invalid key specification.");
      }
    }
    catch (SignatureException paramPublicKey)
    {
      for (;;)
      {
        Log.e("IABUtil/Security", "Signature exception.");
      }
    }
    catch (Base64DecoderException paramPublicKey)
    {
      for (;;)
      {
        Log.e("IABUtil/Security", "Base64 decoding failed.");
      }
    }
  }
  
  public static boolean verifyPurchase(String paramString1, String paramString2, String paramString3)
  {
    if ((TextUtils.isEmpty(paramString2)) || (TextUtils.isEmpty(paramString1)) || (TextUtils.isEmpty(paramString3))) {
      Log.e("IABUtil/Security", "Purchase verification failed: missing data.");
    }
    for (boolean bool = false;; bool = verify(generatePublicKey(paramString1), paramString2, paramString3)) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/vending/billing/util/Security.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */