package com.mobnetic.coinguardian.activity;

import android.content.Context;
import android.content.Intent;
import android.support.v4.app.Fragment;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.fragment.CheckerAddFragment;

public class CheckerAddActivity
  extends SimpleFragmentSubActivity<CheckerAddFragment>
{
  public static final String EXTRA_CHECKER_RECORD = "checker_record";
  
  public static void startCheckerAddActivity(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    startCheckerAddActivity(paramContext, paramCheckerRecord, -1L, false);
  }
  
  public static void startCheckerAddActivity(Context paramContext, CheckerRecord paramCheckerRecord, long paramLong, boolean paramBoolean)
  {
    Intent localIntent = new Intent(paramContext, CheckerAddActivity.class);
    if (paramBoolean) {
      localIntent.addFlags(268435456);
    }
    localIntent.putExtra("checker_record", paramCheckerRecord);
    localIntent.putExtra("alarm_record_id", paramLong);
    paramContext.startActivity(localIntent);
  }
  
  protected CheckerAddFragment createChildFragment()
  {
    CheckerRecord localCheckerRecord1 = (CheckerRecord)getIntent().getParcelableExtra("checker_record");
    CheckerRecord localCheckerRecord2 = localCheckerRecord1;
    if (localCheckerRecord1 == null)
    {
      long l = getIntent().getLongExtra("checker_record_id", 0L);
      localCheckerRecord2 = localCheckerRecord1;
      if (l > 0L) {
        localCheckerRecord2 = CheckerRecord.get(l);
      }
    }
    return CheckerAddFragment.newInstance(localCheckerRecord2, getIntent().getLongExtra("alarm_record_id", 0L));
  }
  
  public void onBackPressed()
  {
    Fragment localFragment = getChildFragment();
    if (((localFragment instanceof CheckerAddFragment)) && (((CheckerAddFragment)localFragment).onBackPressed())) {}
    for (;;)
    {
      return;
      super.onBackPressed();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/CheckerAddActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */