package com.mobnetic.coinguardian.activity.generic;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.Utils;

public abstract class SimpleDonateFragmentSubActivity<T extends Fragment>
  extends SimpleFragmentSubActivity<T>
{
  private static final String EXTRA_SHOW_DONATE_DIALOG = "show_donate_dialog";
  private static final int REQ_DONATE_BTC = 10001;
  private static final int REQ_DONATE_DOGE = 10002;
  private static final int REQ_DONATE_LTC = 10003;
  protected static final String TAG = SimpleDonateFragmentSubActivity.class.getSimpleName();
  
  private final void makeDonationBtc(Activity paramActivity)
  {
    makeDonationVirtual(paramActivity, "BTC", 10001, "bitcoin:1KyLY5sT1Ffa6ctFPFpdL2bxhSAxNqfvMA?amount=0.02", "de.schildbach.wallet", "Bitcoin");
  }
  
  private final void makeDonationDoge(Activity paramActivity)
  {
    makeDonationVirtual(paramActivity, "DOGE", 10002, "dogecoin:D81kyZ49E132enb7ct7RcPGpjgsrN7bsd7?amount=45000", "de.langerhans.wallet", "Dogecoin");
  }
  
  private final void makeDonationLtc(Activity paramActivity)
  {
    makeDonationVirtual(paramActivity, "LTC", 10003, "litecoin:LZ3EiK42o5nbDW3cwiaKUptFQ9eBA3x1vw?amount=1.8", "de.schildbach.wallet_ltc", "Litecoin");
  }
  
  private final void makeDonationVirtual(final Activity paramActivity, String paramString1, int paramInt, String paramString2, final String paramString3, String paramString4)
  {
    paramString2 = new Intent("android.intent.action.VIEW", Uri.parse(paramString2));
    if (Utils.isIntentAvailable(paramActivity, paramString2)) {
      paramActivity.startActivityForResult(paramString2, paramInt);
    }
    for (;;)
    {
      return;
      new AlertDialog.Builder(paramActivity).setTitle(2131165349).setMessage(getString(2131165348, new Object[] { paramString1, paramString4 })).setNegativeButton(17039360, null).setPositiveButton(17039370, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          Utils.goToGooglePlay(paramActivity, paramString3);
        }
      }).show();
    }
  }
  
  protected static void startSimpleDonateFragmentActivity(Context paramContext, Class<?> paramClass, boolean paramBoolean)
  {
    paramClass = new Intent(paramContext, paramClass);
    paramClass.putExtra("show_donate_dialog", paramBoolean);
    paramContext.startActivity(paramClass);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (((paramInt1 == 10001) || (paramInt1 == 10002) || (paramInt1 == 10003)) && (paramInt2 == -1)) {
      onDonateSuccess(true);
    }
    for (;;)
    {
      return;
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (getIntent().getBooleanExtra("show_donate_dialog", false)) {
      showDonateDialog();
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
  }
  
  protected void onDonateSuccess(boolean paramBoolean)
  {
    if (paramBoolean) {
      Utils.showToast(this, 2131165358, true);
    }
    PreferencesUtils.setDonationMade(this);
  }
  
  public void showDonateDialog()
  {
    new AlertDialog.Builder(this).setTitle(2131165360).setNegativeButton(17039360, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        SimpleDonateFragmentSubActivity.this.getIntent().removeExtra("show_donate_dialog");
      }
    }).setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        SimpleDonateFragmentSubActivity.this.getIntent().removeExtra("show_donate_dialog");
      }
    }).setItems(getResources().getStringArray(2131492868), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        SimpleDonateFragmentSubActivity.this.getIntent().removeExtra("show_donate_dialog");
        switch (paramAnonymousInt)
        {
        }
        for (;;)
        {
          return;
          SimpleDonateFragmentSubActivity.this.makeDonationBtc(SimpleDonateFragmentSubActivity.this);
          continue;
          SimpleDonateFragmentSubActivity.this.makeDonationDoge(SimpleDonateFragmentSubActivity.this);
          continue;
          SimpleDonateFragmentSubActivity.this.makeDonationLtc(SimpleDonateFragmentSubActivity.this);
        }
      }
    }).show();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */