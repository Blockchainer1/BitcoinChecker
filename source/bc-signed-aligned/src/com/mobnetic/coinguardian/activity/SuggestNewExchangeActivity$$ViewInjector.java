package com.mobnetic.coinguardian.activity;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class SuggestNewExchangeActivity$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, SuggestNewExchangeActivity paramSuggestNewExchangeActivity, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624015);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624015' for field 'textView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramSuggestNewExchangeActivity.textView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624084);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624084' for field 'suggestButton' and method 'onSuggestButtonClicked' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramSuggestNewExchangeActivity.suggestButton = localView;
    localView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        this.val$target.onSuggestButtonClicked();
      }
    });
    paramFinder = paramFinder.findById(paramObject, 2131624085);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624085' for method 'onDonateButtonClicked' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramFinder.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        this.val$target.onDonateButtonClicked();
      }
    });
  }
  
  public static void reset(SuggestNewExchangeActivity paramSuggestNewExchangeActivity)
  {
    paramSuggestNewExchangeActivity.textView = null;
    paramSuggestNewExchangeActivity.suggestButton = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */