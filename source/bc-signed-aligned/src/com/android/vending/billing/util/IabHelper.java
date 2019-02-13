package com.android.vending.billing.util;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.android.vending.billing.IInAppBillingService;
import com.android.vending.billing.IInAppBillingService.Stub;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;

public class IabHelper
{
  public static final int BILLING_RESPONSE_RESULT_BILLING_UNAVAILABLE = 3;
  public static final int BILLING_RESPONSE_RESULT_DEVELOPER_ERROR = 5;
  public static final int BILLING_RESPONSE_RESULT_ERROR = 6;
  public static final int BILLING_RESPONSE_RESULT_ITEM_ALREADY_OWNED = 7;
  public static final int BILLING_RESPONSE_RESULT_ITEM_NOT_OWNED = 8;
  public static final int BILLING_RESPONSE_RESULT_ITEM_UNAVAILABLE = 4;
  public static final int BILLING_RESPONSE_RESULT_OK = 0;
  public static final int BILLING_RESPONSE_RESULT_USER_CANCELED = 1;
  public static final String GET_SKU_DETAILS_ITEM_LIST = "ITEM_ID_LIST";
  public static final String GET_SKU_DETAILS_ITEM_TYPE_LIST = "ITEM_TYPE_LIST";
  public static final int IABHELPER_BAD_RESPONSE = -1002;
  public static final int IABHELPER_ERROR_BASE = -1000;
  public static final int IABHELPER_INVALID_CONSUMPTION = -1010;
  public static final int IABHELPER_MISSING_TOKEN = -1007;
  public static final int IABHELPER_REMOTE_EXCEPTION = -1001;
  public static final int IABHELPER_SEND_INTENT_FAILED = -1004;
  public static final int IABHELPER_SUBSCRIPTIONS_NOT_AVAILABLE = -1009;
  public static final int IABHELPER_UNKNOWN_ERROR = -1008;
  public static final int IABHELPER_UNKNOWN_PURCHASE_RESPONSE = -1006;
  public static final int IABHELPER_USER_CANCELLED = -1005;
  public static final int IABHELPER_VERIFICATION_FAILED = -1003;
  public static final String INAPP_CONTINUATION_TOKEN = "INAPP_CONTINUATION_TOKEN";
  public static final String ITEM_TYPE_INAPP = "inapp";
  public static final String ITEM_TYPE_SUBS = "subs";
  public static final String RESPONSE_BUY_INTENT = "BUY_INTENT";
  public static final String RESPONSE_CODE = "RESPONSE_CODE";
  public static final String RESPONSE_GET_SKU_DETAILS_LIST = "DETAILS_LIST";
  public static final String RESPONSE_INAPP_ITEM_LIST = "INAPP_PURCHASE_ITEM_LIST";
  public static final String RESPONSE_INAPP_PURCHASE_DATA = "INAPP_PURCHASE_DATA";
  public static final String RESPONSE_INAPP_PURCHASE_DATA_LIST = "INAPP_PURCHASE_DATA_LIST";
  public static final String RESPONSE_INAPP_SIGNATURE = "INAPP_DATA_SIGNATURE";
  public static final String RESPONSE_INAPP_SIGNATURE_LIST = "INAPP_DATA_SIGNATURE_LIST";
  boolean mAsyncInProgress = false;
  String mAsyncOperation = "";
  Context mContext;
  boolean mDebugLog = false;
  String mDebugTag = "IabHelper";
  boolean mDisposed = false;
  OnIabPurchaseFinishedListener mPurchaseListener;
  String mPurchasingItemType;
  int mRequestCode;
  IInAppBillingService mService;
  ServiceConnection mServiceConn;
  boolean mSetupDone = false;
  String mSignatureBase64 = null;
  boolean mSubscriptionsSupported = false;
  
  public IabHelper(Context paramContext, String paramString)
  {
    this.mContext = paramContext.getApplicationContext();
    this.mSignatureBase64 = paramString;
    logDebug("IAB helper created.");
  }
  
  private void checkNotDisposed()
  {
    if (this.mDisposed) {
      throw new IllegalStateException("IabHelper was disposed of, so it cannot be used.");
    }
  }
  
  public static String getResponseDesc(int paramInt)
  {
    String[] arrayOfString = "OK/User Canceled/Unknown/Billing Unavailable/Item unavailable/Developer Error/Error/Item Already Owned/Item not owned".split("/");
    Object localObject = "OK/Remote exception during initialization/Bad response received/Purchase signature verification failed/Send intent failed/User cancelled/Unknown purchase response/Missing token/Unknown error/Subscriptions not available/Invalid consumption attempt".split("/");
    if (paramInt <= 64536)
    {
      int i = 64536 - paramInt;
      if ((i >= 0) && (i < localObject.length)) {
        localObject = localObject[i];
      }
    }
    for (;;)
    {
      return (String)localObject;
      localObject = String.valueOf(paramInt) + ":Unknown IAB Helper Error";
      continue;
      if ((paramInt < 0) || (paramInt >= arrayOfString.length)) {
        localObject = String.valueOf(paramInt) + ":Unknown";
      } else {
        localObject = arrayOfString[paramInt];
      }
    }
  }
  
  void checkSetupDone(String paramString)
  {
    if (!this.mSetupDone)
    {
      logError("Illegal state for operation (" + paramString + "): IAB helper is not set up.");
      throw new IllegalStateException("IAB helper is not set up. Can't perform operation: " + paramString);
    }
  }
  
  void consume(Purchase paramPurchase)
    throws IabException
  {
    checkNotDisposed();
    checkSetupDone("consume");
    if (!paramPurchase.mItemType.equals("inapp")) {
      throw new IabException(64526, "Items of type '" + paramPurchase.mItemType + "' can't be consumed.");
    }
    try
    {
      localObject1 = paramPurchase.getToken();
      String str = paramPurchase.getSku();
      if ((localObject1 == null) || (((String)localObject1).equals("")))
      {
        localObject1 = new java/lang/StringBuilder;
        ((StringBuilder)localObject1).<init>();
        logError("Can't consume " + str + ". No token.");
        localObject1 = new com/android/vending/billing/util/IabException;
        localObject2 = new java/lang/StringBuilder;
        ((StringBuilder)localObject2).<init>();
        ((IabException)localObject1).<init>(64529, "PurchaseInfo is missing token for sku: " + str + " " + paramPurchase);
        throw ((Throwable)localObject1);
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new IabException(64535, "Remote exception while consuming. PurchaseInfo: " + paramPurchase, localRemoteException);
    }
    Object localObject2 = new java/lang/StringBuilder;
    ((StringBuilder)localObject2).<init>();
    logDebug("Consuming sku: " + localRemoteException + ", token: " + (String)localObject1);
    int i = this.mService.consumePurchase(3, this.mContext.getPackageName(), (String)localObject1);
    if (i == 0)
    {
      localObject1 = new java/lang/StringBuilder;
      ((StringBuilder)localObject1).<init>();
      logDebug("Successfully consumed sku: " + localRemoteException);
      return;
    }
    Object localObject1 = new java/lang/StringBuilder;
    ((StringBuilder)localObject1).<init>();
    logDebug("Error consuming consuming sku " + localRemoteException + ". " + getResponseDesc(i));
    localObject2 = new com/android/vending/billing/util/IabException;
    localObject1 = new java/lang/StringBuilder;
    ((StringBuilder)localObject1).<init>();
    ((IabException)localObject2).<init>(i, "Error consuming sku " + localRemoteException);
    throw ((Throwable)localObject2);
  }
  
  public void consumeAsync(Purchase paramPurchase, OnConsumeFinishedListener paramOnConsumeFinishedListener)
  {
    checkNotDisposed();
    checkSetupDone("consume");
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramPurchase);
    consumeAsyncInternal(localArrayList, paramOnConsumeFinishedListener, null);
  }
  
  public void consumeAsync(List<Purchase> paramList, OnConsumeMultiFinishedListener paramOnConsumeMultiFinishedListener)
  {
    checkNotDisposed();
    checkSetupDone("consume");
    consumeAsyncInternal(paramList, null, paramOnConsumeMultiFinishedListener);
  }
  
  void consumeAsyncInternal(final List<Purchase> paramList, final OnConsumeFinishedListener paramOnConsumeFinishedListener, final OnConsumeMultiFinishedListener paramOnConsumeMultiFinishedListener)
  {
    final Handler localHandler = new Handler();
    flagStartAsync("consume");
    new Thread(new Runnable()
    {
      public void run()
      {
        final ArrayList localArrayList = new ArrayList();
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          Purchase localPurchase = (Purchase)localIterator.next();
          try
          {
            IabHelper.this.consume(localPurchase);
            IabResult localIabResult = new com/android/vending/billing/util/IabResult;
            StringBuilder localStringBuilder = new java/lang/StringBuilder;
            localStringBuilder.<init>();
            localIabResult.<init>(0, "Successful consume of sku " + localPurchase.getSku());
            localArrayList.add(localIabResult);
          }
          catch (IabException localIabException)
          {
            localArrayList.add(localIabException.getResult());
          }
        }
        IabHelper.this.flagEndAsync();
        if ((!IabHelper.this.mDisposed) && (paramOnConsumeFinishedListener != null)) {
          localHandler.post(new Runnable()
          {
            public void run()
            {
              IabHelper.3.this.val$singleListener.onConsumeFinished((Purchase)IabHelper.3.this.val$purchases.get(0), (IabResult)localArrayList.get(0));
            }
          });
        }
        if ((!IabHelper.this.mDisposed) && (paramOnConsumeMultiFinishedListener != null)) {
          localHandler.post(new Runnable()
          {
            public void run()
            {
              IabHelper.3.this.val$multiListener.onConsumeMultiFinished(IabHelper.3.this.val$purchases, localArrayList);
            }
          });
        }
      }
    }).start();
  }
  
  public void dispose()
  {
    logDebug("Disposing.");
    this.mSetupDone = false;
    if (this.mServiceConn != null) {
      logDebug("Unbinding from service.");
    }
    try
    {
      if (this.mContext != null) {
        this.mContext.unbindService(this.mServiceConn);
      }
      this.mDisposed = true;
      this.mContext = null;
      this.mServiceConn = null;
      this.mService = null;
      this.mPurchaseListener = null;
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;) {}
    }
  }
  
  public void enableDebugLogging(boolean paramBoolean)
  {
    checkNotDisposed();
    this.mDebugLog = paramBoolean;
  }
  
  public void enableDebugLogging(boolean paramBoolean, String paramString)
  {
    checkNotDisposed();
    this.mDebugLog = paramBoolean;
    this.mDebugTag = paramString;
  }
  
  void flagEndAsync()
  {
    logDebug("Ending async operation: " + this.mAsyncOperation);
    this.mAsyncOperation = "";
    this.mAsyncInProgress = false;
  }
  
  void flagStartAsync(String paramString)
  {
    if (this.mAsyncInProgress) {
      throw new IllegalStateException("Can't start async operation (" + paramString + ") because another async operation(" + this.mAsyncOperation + ") is in progress.");
    }
    this.mAsyncOperation = paramString;
    this.mAsyncInProgress = true;
    logDebug("Starting async operation: " + paramString);
  }
  
  int getResponseCodeFromBundle(Bundle paramBundle)
  {
    paramBundle = paramBundle.get("RESPONSE_CODE");
    int i;
    if (paramBundle == null)
    {
      logDebug("Bundle with null response code, assuming OK (known issue)");
      i = 0;
    }
    for (;;)
    {
      return i;
      if ((paramBundle instanceof Integer))
      {
        i = ((Integer)paramBundle).intValue();
      }
      else
      {
        if (!(paramBundle instanceof Long)) {
          break;
        }
        i = (int)((Long)paramBundle).longValue();
      }
    }
    logError("Unexpected type for bundle response code.");
    logError(paramBundle.getClass().getName());
    throw new RuntimeException("Unexpected type for bundle response code: " + paramBundle.getClass().getName());
  }
  
  int getResponseCodeFromIntent(Intent paramIntent)
  {
    paramIntent = paramIntent.getExtras().get("RESPONSE_CODE");
    int i;
    if (paramIntent == null)
    {
      logError("Intent with no response code, assuming OK (known issue)");
      i = 0;
    }
    for (;;)
    {
      return i;
      if ((paramIntent instanceof Integer))
      {
        i = ((Integer)paramIntent).intValue();
      }
      else
      {
        if (!(paramIntent instanceof Long)) {
          break;
        }
        i = (int)((Long)paramIntent).longValue();
      }
    }
    logError("Unexpected type for intent response code.");
    logError(paramIntent.getClass().getName());
    throw new RuntimeException("Unexpected type for intent response code: " + paramIntent.getClass().getName());
  }
  
  public boolean handleActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    boolean bool;
    if (paramInt1 != this.mRequestCode) {
      bool = false;
    }
    Object localObject1;
    Object localObject2;
    for (;;)
    {
      return bool;
      checkNotDisposed();
      checkSetupDone("handleActivityResult");
      flagEndAsync();
      if (paramIntent == null)
      {
        logError("Null data in IAB activity result.");
        paramIntent = new IabResult(64534, "Null data in IAB result");
        if (this.mPurchaseListener != null) {
          this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
        bool = true;
      }
      else
      {
        paramInt1 = getResponseCodeFromIntent(paramIntent);
        localObject1 = paramIntent.getStringExtra("INAPP_PURCHASE_DATA");
        localObject2 = paramIntent.getStringExtra("INAPP_DATA_SIGNATURE");
        if ((paramInt2 != -1) || (paramInt1 != 0)) {
          break label526;
        }
        logDebug("Successful resultcode from purchase activity.");
        logDebug("Purchase data: " + (String)localObject1);
        logDebug("Data signature: " + (String)localObject2);
        logDebug("Extras: " + paramIntent.getExtras());
        logDebug("Expected item type: " + this.mPurchasingItemType);
        if ((localObject1 != null) && (localObject2 != null)) {
          break;
        }
        logError("BUG: either purchaseData or dataSignature is null.");
        logDebug("Extras: " + paramIntent.getExtras().toString());
        paramIntent = new IabResult(64528, "IAB returned null purchaseData or dataSignature");
        if (this.mPurchaseListener != null) {
          this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
        bool = true;
      }
    }
    for (;;)
    {
      try
      {
        paramIntent = new com/android/vending/billing/util/Purchase;
        paramIntent.<init>(this.mPurchasingItemType, (String)localObject1, (String)localObject2);
      }
      catch (JSONException paramIntent)
      {
        try
        {
          String str = paramIntent.getSku();
          if (!Security.verifyPurchase(this.mSignatureBase64, (String)localObject1, (String)localObject2))
          {
            localObject2 = new java/lang/StringBuilder;
            ((StringBuilder)localObject2).<init>();
            logError("Purchase signature verification FAILED for sku " + str);
            localObject1 = new com/android/vending/billing/util/IabResult;
            localObject2 = new java/lang/StringBuilder;
            ((StringBuilder)localObject2).<init>();
            ((IabResult)localObject1).<init>(64533, "Signature verification failed for sku " + str);
            if (this.mPurchaseListener != null) {
              this.mPurchaseListener.onIabPurchaseFinished((IabResult)localObject1, paramIntent);
            }
            bool = true;
            break;
          }
          logDebug("Purchase signature successfully verified.");
          if (this.mPurchaseListener != null) {
            this.mPurchaseListener.onIabPurchaseFinished(new IabResult(0, "Success"), paramIntent);
          }
          bool = true;
        }
        catch (JSONException paramIntent)
        {
          for (;;) {}
        }
        paramIntent = paramIntent;
      }
      logError("Failed to parse purchase data.");
      paramIntent.printStackTrace();
      paramIntent = new IabResult(64534, "Failed to parse purchase data.");
      if (this.mPurchaseListener != null) {
        this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
      }
      bool = true;
      break;
      label526:
      if (paramInt2 == -1)
      {
        logDebug("Result code was OK but in-app billing response was not OK: " + getResponseDesc(paramInt1));
        if (this.mPurchaseListener != null)
        {
          paramIntent = new IabResult(paramInt1, "Problem purchashing item.");
          this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
      else if (paramInt2 == 0)
      {
        logDebug("Purchase canceled - Response: " + getResponseDesc(paramInt1));
        paramIntent = new IabResult(64531, "User canceled.");
        if (this.mPurchaseListener != null) {
          this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
      else
      {
        logError("Purchase failed. Result code: " + Integer.toString(paramInt2) + ". Response: " + getResponseDesc(paramInt1));
        paramIntent = new IabResult(64530, "Unknown purchase response.");
        if (this.mPurchaseListener != null) {
          this.mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
    }
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener)
  {
    launchPurchaseFlow(paramActivity, paramString, paramInt, paramOnIabPurchaseFinishedListener, "");
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString1, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener, String paramString2)
  {
    launchPurchaseFlow(paramActivity, paramString1, "inapp", paramInt, paramOnIabPurchaseFinishedListener, paramString2);
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString1, String paramString2, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener, String paramString3)
  {
    checkNotDisposed();
    checkSetupDone("launchPurchaseFlow");
    flagStartAsync("launchPurchaseFlow");
    if ((paramString2.equals("subs")) && (!this.mSubscriptionsSupported))
    {
      paramActivity = new IabResult(64527, "Subscriptions are not available.");
      flagEndAsync();
      if (paramOnIabPurchaseFinishedListener != null) {
        paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
      }
    }
    for (;;)
    {
      return;
      try
      {
        localObject = new java/lang/StringBuilder;
        ((StringBuilder)localObject).<init>();
        logDebug("Constructing buy intent for " + paramString1 + ", item type: " + paramString2);
        paramString3 = this.mService.getBuyIntent(3, this.mContext.getPackageName(), paramString1, paramString2, paramString3);
        int i = getResponseCodeFromBundle(paramString3);
        if (i != 0)
        {
          paramActivity = new java/lang/StringBuilder;
          paramActivity.<init>();
          logError("Unable to buy item, Error response: " + getResponseDesc(i));
          flagEndAsync();
          paramActivity = new com/android/vending/billing/util/IabResult;
          paramActivity.<init>(i, "Unable to buy item");
          if (paramOnIabPurchaseFinishedListener == null) {
            continue;
          }
          paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
        }
      }
      catch (IntentSender.SendIntentException paramActivity)
      {
        logError("SendIntentException while launching purchase flow for sku " + paramString1);
        paramActivity.printStackTrace();
        flagEndAsync();
        paramActivity = new IabResult(64532, "Failed to send intent.");
        if (paramOnIabPurchaseFinishedListener == null) {
          continue;
        }
        paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
        continue;
        Object localObject = (PendingIntent)paramString3.getParcelable("BUY_INTENT");
        paramString3 = new java/lang/StringBuilder;
        paramString3.<init>();
        logDebug("Launching buy intent for " + paramString1 + ". Request code: " + paramInt);
        this.mRequestCode = paramInt;
        this.mPurchaseListener = paramOnIabPurchaseFinishedListener;
        this.mPurchasingItemType = paramString2;
        paramString2 = ((PendingIntent)localObject).getIntentSender();
        paramString3 = new android/content/Intent;
        paramString3.<init>();
        paramActivity.startIntentSenderForResult(paramString2, paramInt, paramString3, Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue());
      }
      catch (RemoteException paramActivity)
      {
        logError("RemoteException while launching purchase flow for sku " + paramString1);
        paramActivity.printStackTrace();
        flagEndAsync();
        paramActivity = new IabResult(64535, "Remote exception while starting purchase flow");
      }
      if (paramOnIabPurchaseFinishedListener != null) {
        paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
      }
    }
  }
  
  public void launchSubscriptionPurchaseFlow(Activity paramActivity, String paramString, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener)
  {
    launchSubscriptionPurchaseFlow(paramActivity, paramString, paramInt, paramOnIabPurchaseFinishedListener, "");
  }
  
  public void launchSubscriptionPurchaseFlow(Activity paramActivity, String paramString1, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener, String paramString2)
  {
    launchPurchaseFlow(paramActivity, paramString1, "subs", paramInt, paramOnIabPurchaseFinishedListener, paramString2);
  }
  
  void logDebug(String paramString)
  {
    if (this.mDebugLog) {
      Log.d(this.mDebugTag, paramString);
    }
  }
  
  void logError(String paramString)
  {
    Log.e(this.mDebugTag, "In-app billing error: " + paramString);
  }
  
  void logWarn(String paramString)
  {
    Log.w(this.mDebugTag, "In-app billing warning: " + paramString);
  }
  
  public Inventory queryInventory(boolean paramBoolean, List<String> paramList)
    throws IabException
  {
    return queryInventory(paramBoolean, paramList, null);
  }
  
  public Inventory queryInventory(boolean paramBoolean, List<String> paramList1, List<String> paramList2)
    throws IabException
  {
    checkNotDisposed();
    checkSetupDone("queryInventory");
    int i;
    try
    {
      paramList2 = new com/android/vending/billing/util/Inventory;
      paramList2.<init>();
      i = queryPurchases(paramList2, "inapp");
      if (i != 0)
      {
        paramList1 = new com/android/vending/billing/util/IabException;
        paramList1.<init>(i, "Error refreshing inventory (querying owned items).");
        throw paramList1;
      }
    }
    catch (RemoteException paramList1)
    {
      throw new IabException(64535, "Remote exception while refreshing inventory.", paramList1);
      if (paramBoolean)
      {
        i = querySkuDetails("inapp", paramList2, paramList1);
        if (i != 0)
        {
          paramList1 = new com/android/vending/billing/util/IabException;
          paramList1.<init>(i, "Error refreshing inventory (querying prices of items).");
          throw paramList1;
        }
      }
    }
    catch (JSONException paramList1)
    {
      throw new IabException(64534, "Error parsing JSON response while refreshing inventory.", paramList1);
    }
    if (this.mSubscriptionsSupported)
    {
      i = queryPurchases(paramList2, "subs");
      if (i != 0)
      {
        paramList1 = new com/android/vending/billing/util/IabException;
        paramList1.<init>(i, "Error refreshing inventory (querying owned subscriptions).");
        throw paramList1;
      }
      if (paramBoolean)
      {
        i = querySkuDetails("subs", paramList2, paramList1);
        if (i != 0)
        {
          paramList1 = new com/android/vending/billing/util/IabException;
          paramList1.<init>(i, "Error refreshing inventory (querying prices of subscriptions).");
          throw paramList1;
        }
      }
    }
    return paramList2;
  }
  
  public void queryInventoryAsync(QueryInventoryFinishedListener paramQueryInventoryFinishedListener)
  {
    queryInventoryAsync(true, null, paramQueryInventoryFinishedListener);
  }
  
  public void queryInventoryAsync(boolean paramBoolean, QueryInventoryFinishedListener paramQueryInventoryFinishedListener)
  {
    queryInventoryAsync(paramBoolean, null, paramQueryInventoryFinishedListener);
  }
  
  public void queryInventoryAsync(final boolean paramBoolean, final List<String> paramList, final QueryInventoryFinishedListener paramQueryInventoryFinishedListener)
  {
    final Handler localHandler = new Handler();
    checkNotDisposed();
    checkSetupDone("queryInventory");
    flagStartAsync("refresh inventory");
    new Thread(new Runnable()
    {
      public void run()
      {
        final IabResult localIabResult1 = new IabResult(0, "Inventory refresh successful.");
        final Object localObject = null;
        try
        {
          Inventory localInventory = IabHelper.this.queryInventory(paramBoolean, paramList);
          localObject = localInventory;
        }
        catch (IabException localIabException)
        {
          for (;;)
          {
            IabResult localIabResult2 = localIabException.getResult();
          }
        }
        IabHelper.this.flagEndAsync();
        if ((!IabHelper.this.mDisposed) && (paramQueryInventoryFinishedListener != null)) {
          localHandler.post(new Runnable()
          {
            public void run()
            {
              IabHelper.2.this.val$listener.onQueryInventoryFinished(localIabResult1, localObject);
            }
          });
        }
      }
    }).start();
  }
  
  int queryPurchases(Inventory paramInventory, String paramString)
    throws JSONException, RemoteException
  {
    logDebug("Querying owned items, item type: " + paramString);
    logDebug("Package name: " + this.mContext.getPackageName());
    int i = 0;
    Object localObject1 = null;
    int j;
    String str1;
    do
    {
      logDebug("Calling getPurchases with continuation token: " + (String)localObject1);
      Bundle localBundle = this.mService.getPurchases(3, this.mContext.getPackageName(), paramString, (String)localObject1);
      j = getResponseCodeFromBundle(localBundle);
      logDebug("Owned items response: " + String.valueOf(j));
      if (j != 0) {
        logDebug("getPurchases() failed: " + getResponseDesc(j));
      }
      for (i = j;; i = 64534)
      {
        return i;
        if ((localBundle.containsKey("INAPP_PURCHASE_ITEM_LIST")) && (localBundle.containsKey("INAPP_PURCHASE_DATA_LIST")) && (localBundle.containsKey("INAPP_DATA_SIGNATURE_LIST"))) {
          break;
        }
        logError("Bundle returned from getPurchases() doesn't contain required fields.");
      }
      localObject1 = localBundle.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
      ArrayList localArrayList1 = localBundle.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
      ArrayList localArrayList2 = localBundle.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
      int k = 0;
      j = i;
      i = k;
      if (i < localArrayList1.size())
      {
        str1 = (String)localArrayList1.get(i);
        Object localObject2 = (String)localArrayList2.get(i);
        String str2 = (String)((ArrayList)localObject1).get(i);
        if (Security.verifyPurchase(this.mSignatureBase64, str1, (String)localObject2))
        {
          logDebug("Sku is owned: " + str2);
          localObject2 = new Purchase(paramString, str1, (String)localObject2);
          if (TextUtils.isEmpty(((Purchase)localObject2).getToken()))
          {
            logWarn("BUG: empty/null token!");
            logDebug("Purchase data: " + str1);
          }
          paramInventory.addPurchase((Purchase)localObject2);
        }
        for (;;)
        {
          i++;
          break;
          logWarn("Purchase signature verification **FAILED**. Not adding item.");
          logDebug("   Purchase data: " + str1);
          logDebug("   Signature: " + (String)localObject2);
          j = 1;
        }
      }
      str1 = localBundle.getString("INAPP_CONTINUATION_TOKEN");
      logDebug("Continuation token: " + str1);
      localObject1 = str1;
      i = j;
    } while (!TextUtils.isEmpty(str1));
    if (j != 0) {}
    for (i = 64533;; i = 0) {
      break;
    }
  }
  
  int querySkuDetails(String paramString, Inventory paramInventory, List<String> paramList)
    throws RemoteException, JSONException
  {
    int i = 0;
    logDebug("Querying SKU details.");
    Object localObject = new ArrayList();
    ((ArrayList)localObject).addAll(paramInventory.getAllOwnedSkus(paramString));
    if (paramList != null)
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        paramList = (String)localIterator.next();
        if (!((ArrayList)localObject).contains(paramList)) {
          ((ArrayList)localObject).add(paramList);
        }
      }
    }
    int j;
    if (((ArrayList)localObject).size() == 0)
    {
      logDebug("queryPrices: nothing to do because there are no SKUs.");
      j = i;
    }
    for (;;)
    {
      return j;
      paramList = new Bundle();
      paramList.putStringArrayList("ITEM_ID_LIST", (ArrayList)localObject);
      paramList = this.mService.getSkuDetails(3, this.mContext.getPackageName(), paramString, paramList);
      if (paramList.containsKey("DETAILS_LIST")) {
        break;
      }
      j = getResponseCodeFromBundle(paramList);
      if (j != 0)
      {
        logDebug("getSkuDetails() failed: " + getResponseDesc(j));
      }
      else
      {
        logError("getSkuDetails() returned a bundle with neither an error nor a detail list.");
        j = 64534;
      }
    }
    paramList = paramList.getStringArrayList("DETAILS_LIST").iterator();
    for (;;)
    {
      j = i;
      if (!paramList.hasNext()) {
        break;
      }
      localObject = new SkuDetails(paramString, (String)paramList.next());
      logDebug("Got sku details: " + localObject);
      paramInventory.addSkuDetails((SkuDetails)localObject);
    }
  }
  
  public void startSetup(final OnIabSetupFinishedListener paramOnIabSetupFinishedListener)
  {
    checkNotDisposed();
    if (this.mSetupDone) {
      throw new IllegalStateException("IAB helper is already set up.");
    }
    logDebug("Starting in-app billing setup.");
    this.mServiceConn = new ServiceConnection()
    {
      public void onServiceConnected(ComponentName paramAnonymousComponentName, IBinder paramAnonymousIBinder)
      {
        if (IabHelper.this.mDisposed) {}
        for (;;)
        {
          return;
          IabHelper.this.logDebug("Billing service connected.");
          IabHelper.this.mService = IInAppBillingService.Stub.asInterface(paramAnonymousIBinder);
          paramAnonymousComponentName = IabHelper.this.mContext.getPackageName();
          try
          {
            IabHelper.this.logDebug("Checking for in-app billing 3 support.");
            i = IabHelper.this.mService.isBillingSupported(3, paramAnonymousComponentName, "inapp");
            if (i == 0) {
              break;
            }
            if (paramOnIabSetupFinishedListener != null)
            {
              paramAnonymousIBinder = paramOnIabSetupFinishedListener;
              paramAnonymousComponentName = new com/android/vending/billing/util/IabResult;
              paramAnonymousComponentName.<init>(i, "Error checking for billing v3 support.");
              paramAnonymousIBinder.onIabSetupFinished(paramAnonymousComponentName);
            }
            IabHelper.this.mSubscriptionsSupported = false;
          }
          catch (RemoteException paramAnonymousComponentName)
          {
            if (paramOnIabSetupFinishedListener != null) {
              paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(64535, "RemoteException while setting up in-app billing."));
            }
            paramAnonymousComponentName.printStackTrace();
          }
        }
        IabHelper localIabHelper = IabHelper.this;
        paramAnonymousIBinder = new java/lang/StringBuilder;
        paramAnonymousIBinder.<init>();
        localIabHelper.logDebug("In-app billing version 3 supported for " + paramAnonymousComponentName);
        int i = IabHelper.this.mService.isBillingSupported(3, paramAnonymousComponentName, "subs");
        if (i == 0)
        {
          IabHelper.this.logDebug("Subscriptions AVAILABLE.");
          IabHelper.this.mSubscriptionsSupported = true;
        }
        for (;;)
        {
          IabHelper.this.mSetupDone = true;
          if (paramOnIabSetupFinishedListener == null) {
            break;
          }
          paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(0, "Setup successful."));
          break;
          paramAnonymousComponentName = IabHelper.this;
          paramAnonymousIBinder = new java/lang/StringBuilder;
          paramAnonymousIBinder.<init>();
          paramAnonymousComponentName.logDebug("Subscriptions NOT AVAILABLE. Response: " + i);
        }
      }
      
      public void onServiceDisconnected(ComponentName paramAnonymousComponentName)
      {
        IabHelper.this.logDebug("Billing service disconnected.");
        IabHelper.this.mService = null;
      }
    };
    Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
    localIntent.setPackage("com.android.vending");
    if (!this.mContext.getPackageManager().queryIntentServices(localIntent, 0).isEmpty()) {
      this.mContext.bindService(localIntent, this.mServiceConn, 1);
    }
    for (;;)
    {
      return;
      if (paramOnIabSetupFinishedListener != null) {
        paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(3, "Billing service unavailable on device."));
      }
    }
  }
  
  public boolean subscriptionsSupported()
  {
    checkNotDisposed();
    return this.mSubscriptionsSupported;
  }
  
  public static abstract interface OnConsumeFinishedListener
  {
    public abstract void onConsumeFinished(Purchase paramPurchase, IabResult paramIabResult);
  }
  
  public static abstract interface OnConsumeMultiFinishedListener
  {
    public abstract void onConsumeMultiFinished(List<Purchase> paramList, List<IabResult> paramList1);
  }
  
  public static abstract interface OnIabPurchaseFinishedListener
  {
    public abstract void onIabPurchaseFinished(IabResult paramIabResult, Purchase paramPurchase);
  }
  
  public static abstract interface OnIabSetupFinishedListener
  {
    public abstract void onIabSetupFinished(IabResult paramIabResult);
  }
  
  public static abstract interface QueryInventoryFinishedListener
  {
    public abstract void onQueryInventoryFinished(IabResult paramIabResult, Inventory paramInventory);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/vending/billing/util/IabHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */