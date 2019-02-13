package android.support.v7.widget;

import android.app.PendingIntent;
import android.app.SearchableInfo;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.support.v4.view.KeyEventCompat;
import android.support.v4.widget.CursorAdapter;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.dimen;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.view.CollapsibleActionView;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnKeyListener;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.AutoCompleteTextView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

public class SearchView
  extends LinearLayout
  implements CollapsibleActionView
{
  private static final boolean DBG = false;
  static final AutoCompleteTextViewReflector HIDDEN_METHOD_INVOKER = new AutoCompleteTextViewReflector();
  private static final String IME_OPTION_NO_MICROPHONE = "nm";
  private static final String LOG_TAG = "SearchView";
  private Bundle mAppSearchData;
  private boolean mClearingFocus;
  private ImageView mCloseButton;
  private int mCollapsedImeOptions;
  private View mDropDownAnchor;
  private boolean mExpandedInActionView;
  private boolean mIconified;
  private boolean mIconifiedByDefault;
  private int mMaxWidth;
  private CharSequence mOldQueryText;
  private final View.OnClickListener mOnClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if (paramAnonymousView == SearchView.this.mSearchButton) {
        SearchView.this.onSearchClicked();
      }
      for (;;)
      {
        return;
        if (paramAnonymousView == SearchView.this.mCloseButton) {
          SearchView.this.onCloseClicked();
        } else if (paramAnonymousView == SearchView.this.mSubmitButton) {
          SearchView.this.onSubmitQuery();
        } else if (paramAnonymousView == SearchView.this.mVoiceButton) {
          SearchView.this.onVoiceClicked();
        } else if (paramAnonymousView == SearchView.this.mQueryTextView) {
          SearchView.this.forceSuggestionQuery();
        }
      }
    }
  };
  private OnCloseListener mOnCloseListener;
  private final TextView.OnEditorActionListener mOnEditorActionListener = new TextView.OnEditorActionListener()
  {
    public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
    {
      SearchView.this.onSubmitQuery();
      return true;
    }
  };
  private final AdapterView.OnItemClickListener mOnItemClickListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      SearchView.this.onItemClicked(paramAnonymousInt, 0, null);
    }
  };
  private final AdapterView.OnItemSelectedListener mOnItemSelectedListener = new AdapterView.OnItemSelectedListener()
  {
    public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      SearchView.this.onItemSelected(paramAnonymousInt);
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
  };
  private OnQueryTextListener mOnQueryChangeListener;
  private View.OnFocusChangeListener mOnQueryTextFocusChangeListener;
  private View.OnClickListener mOnSearchClickListener;
  private OnSuggestionListener mOnSuggestionListener;
  private final WeakHashMap<String, Drawable.ConstantState> mOutsideDrawablesCache = new WeakHashMap();
  private CharSequence mQueryHint;
  private boolean mQueryRefinement;
  private SearchAutoComplete mQueryTextView;
  private Runnable mReleaseCursorRunnable = new Runnable()
  {
    public void run()
    {
      if ((SearchView.this.mSuggestionsAdapter != null) && ((SearchView.this.mSuggestionsAdapter instanceof SuggestionsAdapter))) {
        SearchView.this.mSuggestionsAdapter.changeCursor(null);
      }
    }
  };
  private View mSearchButton;
  private View mSearchEditFrame;
  private ImageView mSearchHintIcon;
  private View mSearchPlate;
  private SearchableInfo mSearchable;
  private Runnable mShowImeRunnable = new Runnable()
  {
    public void run()
    {
      InputMethodManager localInputMethodManager = (InputMethodManager)SearchView.this.getContext().getSystemService("input_method");
      if (localInputMethodManager != null) {
        SearchView.HIDDEN_METHOD_INVOKER.showSoftInputUnchecked(localInputMethodManager, SearchView.this, 0);
      }
    }
  };
  private View mSubmitArea;
  private View mSubmitButton;
  private boolean mSubmitButtonEnabled;
  private CursorAdapter mSuggestionsAdapter;
  View.OnKeyListener mTextKeyListener = new View.OnKeyListener()
  {
    public boolean onKey(View paramAnonymousView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
    {
      boolean bool1 = false;
      boolean bool2;
      if (SearchView.this.mSearchable == null) {
        bool2 = bool1;
      }
      for (;;)
      {
        return bool2;
        if ((SearchView.this.mQueryTextView.isPopupShowing()) && (SearchView.this.mQueryTextView.getListSelection() != -1))
        {
          bool2 = SearchView.this.onSuggestionsKey(paramAnonymousView, paramAnonymousInt, paramAnonymousKeyEvent);
        }
        else
        {
          bool2 = bool1;
          if (!SearchView.SearchAutoComplete.access$1600(SearchView.this.mQueryTextView))
          {
            bool2 = bool1;
            if (KeyEventCompat.hasNoModifiers(paramAnonymousKeyEvent))
            {
              bool2 = bool1;
              if (paramAnonymousKeyEvent.getAction() == 1)
              {
                bool2 = bool1;
                if (paramAnonymousInt == 66)
                {
                  paramAnonymousView.cancelLongPress();
                  SearchView.this.launchQuerySearch(0, null, SearchView.this.mQueryTextView.getText().toString());
                  bool2 = true;
                }
              }
            }
          }
        }
      }
    }
  };
  private TextWatcher mTextWatcher = new TextWatcher()
  {
    public void afterTextChanged(Editable paramAnonymousEditable) {}
    
    public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
    
    public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
    {
      SearchView.this.onTextChanged(paramAnonymousCharSequence);
    }
  };
  private Runnable mUpdateDrawableStateRunnable = new Runnable()
  {
    public void run()
    {
      SearchView.this.updateFocusedState();
    }
  };
  private CharSequence mUserQuery;
  private final Intent mVoiceAppSearchIntent;
  private View mVoiceButton;
  private boolean mVoiceButtonEnabled;
  private final Intent mVoiceWebSearchIntent;
  
  public SearchView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SearchView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.abc_search_view, this, true);
    this.mSearchButton = findViewById(R.id.search_button);
    this.mQueryTextView = ((SearchAutoComplete)findViewById(R.id.search_src_text));
    this.mQueryTextView.setSearchView(this);
    this.mSearchEditFrame = findViewById(R.id.search_edit_frame);
    this.mSearchPlate = findViewById(R.id.search_plate);
    this.mSubmitArea = findViewById(R.id.submit_area);
    this.mSubmitButton = findViewById(R.id.search_go_btn);
    this.mCloseButton = ((ImageView)findViewById(R.id.search_close_btn));
    this.mVoiceButton = findViewById(R.id.search_voice_btn);
    this.mSearchHintIcon = ((ImageView)findViewById(R.id.search_mag_icon));
    this.mSearchButton.setOnClickListener(this.mOnClickListener);
    this.mCloseButton.setOnClickListener(this.mOnClickListener);
    this.mSubmitButton.setOnClickListener(this.mOnClickListener);
    this.mVoiceButton.setOnClickListener(this.mOnClickListener);
    this.mQueryTextView.setOnClickListener(this.mOnClickListener);
    this.mQueryTextView.addTextChangedListener(this.mTextWatcher);
    this.mQueryTextView.setOnEditorActionListener(this.mOnEditorActionListener);
    this.mQueryTextView.setOnItemClickListener(this.mOnItemClickListener);
    this.mQueryTextView.setOnItemSelectedListener(this.mOnItemSelectedListener);
    this.mQueryTextView.setOnKeyListener(this.mTextKeyListener);
    this.mQueryTextView.setOnFocusChangeListener(new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        if (SearchView.this.mOnQueryTextFocusChangeListener != null) {
          SearchView.this.mOnQueryTextFocusChangeListener.onFocusChange(SearchView.this, paramAnonymousBoolean);
        }
      }
    });
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SearchView, 0, 0);
    setIconifiedByDefault(localTypedArray.getBoolean(3, true));
    int i = localTypedArray.getDimensionPixelSize(0, -1);
    if (i != -1) {
      setMaxWidth(i);
    }
    CharSequence localCharSequence = localTypedArray.getText(4);
    if (!TextUtils.isEmpty(localCharSequence)) {
      setQueryHint(localCharSequence);
    }
    i = localTypedArray.getInt(2, -1);
    if (i != -1) {
      setImeOptions(i);
    }
    i = localTypedArray.getInt(1, -1);
    if (i != -1) {
      setInputType(i);
    }
    localTypedArray.recycle();
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.View, 0, 0);
    boolean bool = paramContext.getBoolean(0, true);
    paramContext.recycle();
    setFocusable(bool);
    this.mVoiceWebSearchIntent = new Intent("android.speech.action.WEB_SEARCH");
    this.mVoiceWebSearchIntent.addFlags(268435456);
    this.mVoiceWebSearchIntent.putExtra("android.speech.extra.LANGUAGE_MODEL", "web_search");
    this.mVoiceAppSearchIntent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
    this.mVoiceAppSearchIntent.addFlags(268435456);
    this.mDropDownAnchor = findViewById(this.mQueryTextView.getDropDownAnchor());
    if (this.mDropDownAnchor != null)
    {
      if (Build.VERSION.SDK_INT < 11) {
        break label630;
      }
      addOnLayoutChangeListenerToDropDownAnchorSDK11();
    }
    for (;;)
    {
      updateViewsVisibility(this.mIconifiedByDefault);
      updateQueryHint();
      return;
      label630:
      addOnLayoutChangeListenerToDropDownAnchorBase();
    }
  }
  
  private void addOnLayoutChangeListenerToDropDownAnchorBase()
  {
    this.mDropDownAnchor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
    {
      public void onGlobalLayout()
      {
        SearchView.this.adjustDropDownSizeAndPosition();
      }
    });
  }
  
  private void addOnLayoutChangeListenerToDropDownAnchorSDK11()
  {
    this.mDropDownAnchor.addOnLayoutChangeListener(new View.OnLayoutChangeListener()
    {
      public void onLayoutChange(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3, int paramAnonymousInt4, int paramAnonymousInt5, int paramAnonymousInt6, int paramAnonymousInt7, int paramAnonymousInt8)
      {
        SearchView.this.adjustDropDownSizeAndPosition();
      }
    });
  }
  
  private void adjustDropDownSizeAndPosition()
  {
    Resources localResources;
    int i;
    Rect localRect;
    if (this.mDropDownAnchor.getWidth() > 1)
    {
      localResources = getContext().getResources();
      i = this.mSearchPlate.getPaddingLeft();
      localRect = new Rect();
      if (!this.mIconifiedByDefault) {
        break label133;
      }
    }
    label133:
    for (int j = localResources.getDimensionPixelSize(R.dimen.abc_dropdownitem_icon_width) + localResources.getDimensionPixelSize(R.dimen.abc_dropdownitem_text_padding_left);; j = 0)
    {
      this.mQueryTextView.getDropDownBackground().getPadding(localRect);
      int k = localRect.left;
      this.mQueryTextView.setDropDownHorizontalOffset(i - (k + j));
      k = this.mDropDownAnchor.getWidth();
      int m = localRect.left;
      int n = localRect.right;
      this.mQueryTextView.setDropDownWidth(k + m + n + j - i);
      return;
    }
  }
  
  private Intent createIntent(String paramString1, Uri paramUri, String paramString2, String paramString3, int paramInt, String paramString4)
  {
    paramString1 = new Intent(paramString1);
    paramString1.addFlags(268435456);
    if (paramUri != null) {
      paramString1.setData(paramUri);
    }
    paramString1.putExtra("user_query", this.mUserQuery);
    if (paramString3 != null) {
      paramString1.putExtra("query", paramString3);
    }
    if (paramString2 != null) {
      paramString1.putExtra("intent_extra_data_key", paramString2);
    }
    if (this.mAppSearchData != null) {
      paramString1.putExtra("app_data", this.mAppSearchData);
    }
    if (paramInt != 0)
    {
      paramString1.putExtra("action_key", paramInt);
      paramString1.putExtra("action_msg", paramString4);
    }
    paramString1.setComponent(this.mSearchable.getSearchActivity());
    return paramString1;
  }
  
  private Intent createIntentFromSuggestion(Cursor paramCursor, int paramInt, String paramString)
  {
    try
    {
      Object localObject1 = SuggestionsAdapter.getColumnString(paramCursor, "suggest_intent_action");
      Object localObject2 = localObject1;
      if (localObject1 == null) {
        localObject2 = this.mSearchable.getSuggestIntentAction();
      }
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = "android.intent.action.SEARCH";
      }
      Object localObject3 = SuggestionsAdapter.getColumnString(paramCursor, "suggest_intent_data");
      localObject2 = localObject3;
      if (localObject3 == null) {
        localObject2 = this.mSearchable.getSuggestIntentData();
      }
      localObject3 = localObject2;
      if (localObject2 != null)
      {
        String str = SuggestionsAdapter.getColumnString(paramCursor, "suggest_intent_data_id");
        localObject3 = localObject2;
        if (str != null)
        {
          localObject3 = new java/lang/StringBuilder;
          ((StringBuilder)localObject3).<init>();
          localObject3 = (String)localObject2 + "/" + Uri.encode(str);
        }
      }
      if (localObject3 == null)
      {
        localObject2 = null;
        localObject3 = SuggestionsAdapter.getColumnString(paramCursor, "suggest_intent_query");
        paramString = createIntent((String)localObject1, (Uri)localObject2, SuggestionsAdapter.getColumnString(paramCursor, "suggest_intent_extra_data"), (String)localObject3, paramInt, paramString);
        paramCursor = paramString;
      }
      for (;;)
      {
        return paramCursor;
        localObject2 = Uri.parse((String)localObject3);
        break;
        try
        {
          paramInt = paramCursor.getPosition();
          Log.w("SearchView", "Search suggestions cursor at row " + paramInt + " returned exception.", paramString);
          paramCursor = null;
        }
        catch (RuntimeException paramCursor)
        {
          for (;;)
          {
            paramInt = -1;
          }
        }
      }
    }
    catch (RuntimeException paramString) {}
  }
  
  private Intent createVoiceAppSearchIntent(Intent paramIntent, SearchableInfo paramSearchableInfo)
  {
    ComponentName localComponentName = paramSearchableInfo.getSearchActivity();
    Object localObject = new Intent("android.intent.action.SEARCH");
    ((Intent)localObject).setComponent(localComponentName);
    PendingIntent localPendingIntent = PendingIntent.getActivity(getContext(), 0, (Intent)localObject, 1073741824);
    Bundle localBundle = new Bundle();
    if (this.mAppSearchData != null) {
      localBundle.putParcelable("app_data", this.mAppSearchData);
    }
    Intent localIntent = new Intent(paramIntent);
    paramIntent = "free_form";
    localObject = null;
    String str = null;
    int i = 1;
    Resources localResources = getResources();
    if (paramSearchableInfo.getVoiceLanguageModeId() != 0) {
      paramIntent = localResources.getString(paramSearchableInfo.getVoiceLanguageModeId());
    }
    if (paramSearchableInfo.getVoicePromptTextId() != 0) {
      localObject = localResources.getString(paramSearchableInfo.getVoicePromptTextId());
    }
    if (paramSearchableInfo.getVoiceLanguageId() != 0) {
      str = localResources.getString(paramSearchableInfo.getVoiceLanguageId());
    }
    if (paramSearchableInfo.getVoiceMaxResults() != 0) {
      i = paramSearchableInfo.getVoiceMaxResults();
    }
    localIntent.putExtra("android.speech.extra.LANGUAGE_MODEL", paramIntent);
    localIntent.putExtra("android.speech.extra.PROMPT", (String)localObject);
    localIntent.putExtra("android.speech.extra.LANGUAGE", str);
    localIntent.putExtra("android.speech.extra.MAX_RESULTS", i);
    if (localComponentName == null) {}
    for (paramIntent = null;; paramIntent = localComponentName.flattenToShortString())
    {
      localIntent.putExtra("calling_package", paramIntent);
      localIntent.putExtra("android.speech.extra.RESULTS_PENDINGINTENT", localPendingIntent);
      localIntent.putExtra("android.speech.extra.RESULTS_PENDINGINTENT_BUNDLE", localBundle);
      return localIntent;
    }
  }
  
  private Intent createVoiceWebSearchIntent(Intent paramIntent, SearchableInfo paramSearchableInfo)
  {
    Intent localIntent = new Intent(paramIntent);
    paramIntent = paramSearchableInfo.getSearchActivity();
    if (paramIntent == null) {}
    for (paramIntent = null;; paramIntent = paramIntent.flattenToShortString())
    {
      localIntent.putExtra("calling_package", paramIntent);
      return localIntent;
    }
  }
  
  private void dismissSuggestions()
  {
    this.mQueryTextView.dismissDropDown();
  }
  
  private void forceSuggestionQuery()
  {
    HIDDEN_METHOD_INVOKER.doBeforeTextChanged(this.mQueryTextView);
    HIDDEN_METHOD_INVOKER.doAfterTextChanged(this.mQueryTextView);
  }
  
  private CharSequence getDecoratedHint(CharSequence paramCharSequence)
  {
    if (!this.mIconifiedByDefault) {}
    for (;;)
    {
      return paramCharSequence;
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder("   ");
      localSpannableStringBuilder.append(paramCharSequence);
      paramCharSequence = getContext().getResources().getDrawable(getSearchIconId());
      int i = (int)(this.mQueryTextView.getTextSize() * 1.25D);
      paramCharSequence.setBounds(0, 0, i, i);
      localSpannableStringBuilder.setSpan(new ImageSpan(paramCharSequence), 1, 2, 33);
      paramCharSequence = localSpannableStringBuilder;
    }
  }
  
  private int getPreferredWidth()
  {
    return getContext().getResources().getDimensionPixelSize(R.dimen.abc_search_view_preferred_width);
  }
  
  private int getSearchIconId()
  {
    TypedValue localTypedValue = new TypedValue();
    getContext().getTheme().resolveAttribute(R.attr.searchViewSearchIcon, localTypedValue, true);
    return localTypedValue.resourceId;
  }
  
  private boolean hasVoiceSearch()
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    Intent localIntent;
    if (this.mSearchable != null)
    {
      bool2 = bool1;
      if (this.mSearchable.getVoiceSearchEnabled())
      {
        localIntent = null;
        if (!this.mSearchable.getVoiceSearchLaunchWebSearch()) {
          break label69;
        }
        localIntent = this.mVoiceWebSearchIntent;
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (localIntent != null)
      {
        bool2 = bool1;
        if (getContext().getPackageManager().resolveActivity(localIntent, 65536) != null) {
          bool2 = true;
        }
      }
      return bool2;
      label69:
      if (this.mSearchable.getVoiceSearchLaunchRecognizer()) {
        localIntent = this.mVoiceAppSearchIntent;
      }
    }
  }
  
  static boolean isLandscapeMode(Context paramContext)
  {
    if (paramContext.getResources().getConfiguration().orientation == 2) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private boolean isSubmitAreaEnabled()
  {
    if (((this.mSubmitButtonEnabled) || (this.mVoiceButtonEnabled)) && (!isIconified())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private void launchIntent(Intent paramIntent)
  {
    if (paramIntent == null) {}
    for (;;)
    {
      return;
      try
      {
        getContext().startActivity(paramIntent);
      }
      catch (RuntimeException localRuntimeException)
      {
        Log.e("SearchView", "Failed launch activity: " + paramIntent, localRuntimeException);
      }
    }
  }
  
  private void launchQuerySearch(int paramInt, String paramString1, String paramString2)
  {
    paramString1 = createIntent("android.intent.action.SEARCH", null, null, paramString2, paramInt, paramString1);
    getContext().startActivity(paramString1);
  }
  
  private boolean launchSuggestion(int paramInt1, int paramInt2, String paramString)
  {
    Cursor localCursor = this.mSuggestionsAdapter.getCursor();
    if ((localCursor != null) && (localCursor.moveToPosition(paramInt1))) {
      launchIntent(createIntentFromSuggestion(localCursor, paramInt2, paramString));
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private void onCloseClicked()
  {
    if (TextUtils.isEmpty(this.mQueryTextView.getText())) {
      if ((this.mIconifiedByDefault) && ((this.mOnCloseListener == null) || (!this.mOnCloseListener.onClose())))
      {
        clearFocus();
        updateViewsVisibility(true);
      }
    }
    for (;;)
    {
      return;
      this.mQueryTextView.setText("");
      this.mQueryTextView.requestFocus();
      setImeVisibility(true);
    }
  }
  
  private boolean onItemClicked(int paramInt1, int paramInt2, String paramString)
  {
    boolean bool = false;
    if ((this.mOnSuggestionListener == null) || (!this.mOnSuggestionListener.onSuggestionClick(paramInt1)))
    {
      launchSuggestion(paramInt1, 0, null);
      setImeVisibility(false);
      dismissSuggestions();
      bool = true;
    }
    return bool;
  }
  
  private boolean onItemSelected(int paramInt)
  {
    if ((this.mOnSuggestionListener == null) || (!this.mOnSuggestionListener.onSuggestionSelect(paramInt))) {
      rewriteQueryFromSuggestion(paramInt);
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private void onSearchClicked()
  {
    updateViewsVisibility(false);
    this.mQueryTextView.requestFocus();
    setImeVisibility(true);
    if (this.mOnSearchClickListener != null) {
      this.mOnSearchClickListener.onClick(this);
    }
  }
  
  private void onSubmitQuery()
  {
    Editable localEditable = this.mQueryTextView.getText();
    if ((localEditable != null) && (TextUtils.getTrimmedLength(localEditable) > 0) && ((this.mOnQueryChangeListener == null) || (!this.mOnQueryChangeListener.onQueryTextSubmit(localEditable.toString()))))
    {
      if (this.mSearchable != null)
      {
        launchQuerySearch(0, null, localEditable.toString());
        setImeVisibility(false);
      }
      dismissSuggestions();
    }
  }
  
  private boolean onSuggestionsKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool1 = false;
    boolean bool2;
    if (this.mSearchable == null) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      bool2 = bool1;
      if (this.mSuggestionsAdapter != null)
      {
        bool2 = bool1;
        if (paramKeyEvent.getAction() == 0)
        {
          bool2 = bool1;
          if (KeyEventCompat.hasNoModifiers(paramKeyEvent)) {
            if ((paramInt == 66) || (paramInt == 84) || (paramInt == 61))
            {
              bool2 = onItemClicked(this.mQueryTextView.getListSelection(), 0, null);
            }
            else
            {
              if ((paramInt == 21) || (paramInt == 22))
              {
                if (paramInt == 21) {}
                for (paramInt = 0;; paramInt = this.mQueryTextView.length())
                {
                  this.mQueryTextView.setSelection(paramInt);
                  this.mQueryTextView.setListSelection(0);
                  this.mQueryTextView.clearListSelection();
                  HIDDEN_METHOD_INVOKER.ensureImeVisible(this.mQueryTextView, true);
                  bool2 = true;
                  break;
                }
              }
              bool2 = bool1;
              if (paramInt == 19)
              {
                bool2 = bool1;
                if (this.mQueryTextView.getListSelection() == 0) {
                  bool2 = bool1;
                }
              }
            }
          }
        }
      }
    }
  }
  
  private void onTextChanged(CharSequence paramCharSequence)
  {
    boolean bool1 = true;
    Editable localEditable = this.mQueryTextView.getText();
    this.mUserQuery = localEditable;
    if (!TextUtils.isEmpty(localEditable))
    {
      bool2 = true;
      updateSubmitButton(bool2);
      if (bool2) {
        break label100;
      }
    }
    label100:
    for (boolean bool2 = bool1;; bool2 = false)
    {
      updateVoiceButton(bool2);
      updateCloseButton();
      updateSubmitArea();
      if ((this.mOnQueryChangeListener != null) && (!TextUtils.equals(paramCharSequence, this.mOldQueryText))) {
        this.mOnQueryChangeListener.onQueryTextChange(paramCharSequence.toString());
      }
      this.mOldQueryText = paramCharSequence.toString();
      return;
      bool2 = false;
      break;
    }
  }
  
  private void onVoiceClicked()
  {
    if (this.mSearchable == null) {}
    for (;;)
    {
      return;
      Object localObject = this.mSearchable;
      try
      {
        if (!((SearchableInfo)localObject).getVoiceSearchLaunchWebSearch()) {
          break label54;
        }
        localObject = createVoiceWebSearchIntent(this.mVoiceWebSearchIntent, (SearchableInfo)localObject);
        getContext().startActivity((Intent)localObject);
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        Log.w("SearchView", "Could not find voice search activity");
      }
      continue;
      label54:
      if (localActivityNotFoundException.getVoiceSearchLaunchRecognizer())
      {
        Intent localIntent = createVoiceAppSearchIntent(this.mVoiceAppSearchIntent, localActivityNotFoundException);
        getContext().startActivity(localIntent);
      }
    }
  }
  
  private void postUpdateFocusedState()
  {
    post(this.mUpdateDrawableStateRunnable);
  }
  
  private void rewriteQueryFromSuggestion(int paramInt)
  {
    Editable localEditable = this.mQueryTextView.getText();
    Object localObject = this.mSuggestionsAdapter.getCursor();
    if (localObject == null) {}
    for (;;)
    {
      return;
      if (((Cursor)localObject).moveToPosition(paramInt))
      {
        localObject = this.mSuggestionsAdapter.convertToString((Cursor)localObject);
        if (localObject != null) {
          setQuery((CharSequence)localObject);
        } else {
          setQuery(localEditable);
        }
      }
      else
      {
        setQuery(localEditable);
      }
    }
  }
  
  private void setImeVisibility(boolean paramBoolean)
  {
    if (paramBoolean) {
      post(this.mShowImeRunnable);
    }
    for (;;)
    {
      return;
      removeCallbacks(this.mShowImeRunnable);
      InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
      if (localInputMethodManager != null) {
        localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
      }
    }
  }
  
  private void setQuery(CharSequence paramCharSequence)
  {
    this.mQueryTextView.setText(paramCharSequence);
    SearchAutoComplete localSearchAutoComplete = this.mQueryTextView;
    if (TextUtils.isEmpty(paramCharSequence)) {}
    for (int i = 0;; i = paramCharSequence.length())
    {
      localSearchAutoComplete.setSelection(i);
      return;
    }
  }
  
  private void updateCloseButton()
  {
    int i = 1;
    int j = 0;
    int k;
    int m;
    label43:
    label57:
    Drawable localDrawable;
    if (!TextUtils.isEmpty(this.mQueryTextView.getText()))
    {
      k = 1;
      m = i;
      if (k == 0)
      {
        if ((!this.mIconifiedByDefault) || (this.mExpandedInActionView)) {
          break label96;
        }
        m = i;
      }
      localObject = this.mCloseButton;
      if (m == 0) {
        break label102;
      }
      m = j;
      ((ImageView)localObject).setVisibility(m);
      localDrawable = this.mCloseButton.getDrawable();
      if (k == 0) {
        break label109;
      }
    }
    label96:
    label102:
    label109:
    for (Object localObject = ENABLED_STATE_SET;; localObject = EMPTY_STATE_SET)
    {
      localDrawable.setState((int[])localObject);
      return;
      k = 0;
      break;
      m = 0;
      break label43;
      m = 8;
      break label57;
    }
  }
  
  private void updateFocusedState()
  {
    boolean bool = this.mQueryTextView.hasFocus();
    Drawable localDrawable = this.mSearchPlate.getBackground();
    if (bool)
    {
      arrayOfInt = FOCUSED_STATE_SET;
      localDrawable.setState(arrayOfInt);
      localDrawable = this.mSubmitArea.getBackground();
      if (!bool) {
        break label64;
      }
    }
    label64:
    for (int[] arrayOfInt = FOCUSED_STATE_SET;; arrayOfInt = EMPTY_STATE_SET)
    {
      localDrawable.setState(arrayOfInt);
      invalidate();
      return;
      arrayOfInt = EMPTY_STATE_SET;
      break;
    }
  }
  
  private void updateQueryHint()
  {
    if (this.mQueryHint != null) {
      this.mQueryTextView.setHint(getDecoratedHint(this.mQueryHint));
    }
    for (;;)
    {
      return;
      if (this.mSearchable != null)
      {
        String str = null;
        int i = this.mSearchable.getHintId();
        if (i != 0) {
          str = getContext().getString(i);
        }
        if (str != null) {
          this.mQueryTextView.setHint(getDecoratedHint(str));
        }
      }
      else
      {
        this.mQueryTextView.setHint(getDecoratedHint(""));
      }
    }
  }
  
  private void updateSearchAutoComplete()
  {
    int i = 1;
    this.mQueryTextView.setThreshold(this.mSearchable.getSuggestThreshold());
    this.mQueryTextView.setImeOptions(this.mSearchable.getImeOptions());
    int j = this.mSearchable.getInputType();
    int k = j;
    if ((j & 0xF) == 1)
    {
      j &= 0xFFFEFFFF;
      k = j;
      if (this.mSearchable.getSuggestAuthority() != null) {
        k = j | 0x10000 | 0x80000;
      }
    }
    this.mQueryTextView.setInputType(k);
    if (this.mSuggestionsAdapter != null) {
      this.mSuggestionsAdapter.changeCursor(null);
    }
    if (this.mSearchable.getSuggestAuthority() != null)
    {
      this.mSuggestionsAdapter = new SuggestionsAdapter(getContext(), this, this.mSearchable, this.mOutsideDrawablesCache);
      this.mQueryTextView.setAdapter(this.mSuggestionsAdapter);
      SuggestionsAdapter localSuggestionsAdapter = (SuggestionsAdapter)this.mSuggestionsAdapter;
      k = i;
      if (this.mQueryRefinement) {
        k = 2;
      }
      localSuggestionsAdapter.setQueryRefinement(k);
    }
  }
  
  private void updateSubmitArea()
  {
    int i = 8;
    int j = i;
    if (isSubmitAreaEnabled()) {
      if (this.mSubmitButton.getVisibility() != 0)
      {
        j = i;
        if (this.mVoiceButton.getVisibility() != 0) {}
      }
      else
      {
        j = 0;
      }
    }
    this.mSubmitArea.setVisibility(j);
  }
  
  private void updateSubmitButton(boolean paramBoolean)
  {
    int i = 8;
    int j = i;
    if (this.mSubmitButtonEnabled)
    {
      j = i;
      if (isSubmitAreaEnabled())
      {
        j = i;
        if (hasFocus()) {
          if (!paramBoolean)
          {
            j = i;
            if (this.mVoiceButtonEnabled) {}
          }
          else
          {
            j = 0;
          }
        }
      }
    }
    this.mSubmitButton.setVisibility(j);
  }
  
  private void updateViewsVisibility(boolean paramBoolean)
  {
    boolean bool1 = true;
    int i = 8;
    this.mIconified = paramBoolean;
    int j;
    boolean bool2;
    if (paramBoolean)
    {
      j = 0;
      if (TextUtils.isEmpty(this.mQueryTextView.getText())) {
        break label120;
      }
      bool2 = true;
      label33:
      this.mSearchButton.setVisibility(j);
      updateSubmitButton(bool2);
      Object localObject = this.mSearchEditFrame;
      if (!paramBoolean) {
        break label126;
      }
      j = 8;
      label62:
      ((View)localObject).setVisibility(j);
      localObject = this.mSearchHintIcon;
      if (!this.mIconifiedByDefault) {
        break label132;
      }
      j = i;
      label85:
      ((ImageView)localObject).setVisibility(j);
      updateCloseButton();
      if (bool2) {
        break label138;
      }
    }
    label120:
    label126:
    label132:
    label138:
    for (paramBoolean = bool1;; paramBoolean = false)
    {
      updateVoiceButton(paramBoolean);
      updateSubmitArea();
      return;
      j = 8;
      break;
      bool2 = false;
      break label33;
      j = 0;
      break label62;
      j = 0;
      break label85;
    }
  }
  
  private void updateVoiceButton(boolean paramBoolean)
  {
    int i = 8;
    int j = i;
    if (this.mVoiceButtonEnabled)
    {
      j = i;
      if (!isIconified())
      {
        j = i;
        if (paramBoolean)
        {
          j = 0;
          this.mSubmitButton.setVisibility(8);
        }
      }
    }
    this.mVoiceButton.setVisibility(j);
  }
  
  public void clearFocus()
  {
    this.mClearingFocus = true;
    setImeVisibility(false);
    super.clearFocus();
    this.mQueryTextView.clearFocus();
    this.mClearingFocus = false;
  }
  
  public int getImeOptions()
  {
    return this.mQueryTextView.getImeOptions();
  }
  
  public int getInputType()
  {
    return this.mQueryTextView.getInputType();
  }
  
  public int getMaxWidth()
  {
    return this.mMaxWidth;
  }
  
  public CharSequence getQuery()
  {
    return this.mQueryTextView.getText();
  }
  
  public CharSequence getQueryHint()
  {
    Object localObject;
    if (this.mQueryHint != null) {
      localObject = this.mQueryHint;
    }
    for (;;)
    {
      return (CharSequence)localObject;
      if (this.mSearchable != null)
      {
        localObject = null;
        int i = this.mSearchable.getHintId();
        if (i != 0) {
          localObject = getContext().getString(i);
        }
      }
      else
      {
        localObject = null;
      }
    }
  }
  
  public CursorAdapter getSuggestionsAdapter()
  {
    return this.mSuggestionsAdapter;
  }
  
  public boolean isIconfiedByDefault()
  {
    return this.mIconifiedByDefault;
  }
  
  public boolean isIconified()
  {
    return this.mIconified;
  }
  
  public boolean isQueryRefinementEnabled()
  {
    return this.mQueryRefinement;
  }
  
  public boolean isSubmitButtonEnabled()
  {
    return this.mSubmitButtonEnabled;
  }
  
  public void onActionViewCollapsed()
  {
    clearFocus();
    updateViewsVisibility(true);
    this.mQueryTextView.setImeOptions(this.mCollapsedImeOptions);
    this.mExpandedInActionView = false;
  }
  
  public void onActionViewExpanded()
  {
    if (this.mExpandedInActionView) {}
    for (;;)
    {
      return;
      this.mExpandedInActionView = true;
      this.mCollapsedImeOptions = this.mQueryTextView.getImeOptions();
      this.mQueryTextView.setImeOptions(this.mCollapsedImeOptions | 0x2000000);
      this.mQueryTextView.setText("");
      setIconified(false);
    }
  }
  
  protected void onDetachedFromWindow()
  {
    removeCallbacks(this.mUpdateDrawableStateRunnable);
    post(this.mReleaseCursorRunnable);
    super.onDetachedFromWindow();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (this.mSearchable == null) {}
    for (boolean bool = false;; bool = super.onKeyDown(paramInt, paramKeyEvent)) {
      return bool;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (isIconified())
    {
      super.onMeasure(paramInt1, paramInt2);
      return;
    }
    int i = View.MeasureSpec.getMode(paramInt1);
    int j = View.MeasureSpec.getSize(paramInt1);
    switch (i)
    {
    default: 
      paramInt1 = j;
    case -2147483648: 
    case 1073741824: 
      for (;;)
      {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824), paramInt2);
        break;
        if (this.mMaxWidth > 0)
        {
          paramInt1 = Math.min(this.mMaxWidth, j);
        }
        else
        {
          paramInt1 = Math.min(getPreferredWidth(), j);
          continue;
          paramInt1 = j;
          if (this.mMaxWidth > 0) {
            paramInt1 = Math.min(this.mMaxWidth, j);
          }
        }
      }
    }
    if (this.mMaxWidth > 0) {}
    for (paramInt1 = this.mMaxWidth;; paramInt1 = getPreferredWidth()) {
      break;
    }
  }
  
  void onQueryRefine(CharSequence paramCharSequence)
  {
    setQuery(paramCharSequence);
  }
  
  void onTextFocusChanged()
  {
    updateViewsVisibility(isIconified());
    postUpdateFocusedState();
    if (this.mQueryTextView.hasFocus()) {
      forceSuggestionQuery();
    }
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    postUpdateFocusedState();
  }
  
  public boolean requestFocus(int paramInt, Rect paramRect)
  {
    boolean bool1;
    if (this.mClearingFocus) {
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      if (!isFocusable())
      {
        bool1 = false;
      }
      else if (!isIconified())
      {
        boolean bool2 = this.mQueryTextView.requestFocus(paramInt, paramRect);
        bool1 = bool2;
        if (bool2)
        {
          updateViewsVisibility(false);
          bool1 = bool2;
        }
      }
      else
      {
        bool1 = super.requestFocus(paramInt, paramRect);
      }
    }
  }
  
  public void setAppSearchData(Bundle paramBundle)
  {
    this.mAppSearchData = paramBundle;
  }
  
  public void setIconified(boolean paramBoolean)
  {
    if (paramBoolean) {
      onCloseClicked();
    }
    for (;;)
    {
      return;
      onSearchClicked();
    }
  }
  
  public void setIconifiedByDefault(boolean paramBoolean)
  {
    if (this.mIconifiedByDefault == paramBoolean) {}
    for (;;)
    {
      return;
      this.mIconifiedByDefault = paramBoolean;
      updateViewsVisibility(paramBoolean);
      updateQueryHint();
    }
  }
  
  public void setImeOptions(int paramInt)
  {
    this.mQueryTextView.setImeOptions(paramInt);
  }
  
  public void setInputType(int paramInt)
  {
    this.mQueryTextView.setInputType(paramInt);
  }
  
  public void setMaxWidth(int paramInt)
  {
    this.mMaxWidth = paramInt;
    requestLayout();
  }
  
  public void setOnCloseListener(OnCloseListener paramOnCloseListener)
  {
    this.mOnCloseListener = paramOnCloseListener;
  }
  
  public void setOnQueryTextFocusChangeListener(View.OnFocusChangeListener paramOnFocusChangeListener)
  {
    this.mOnQueryTextFocusChangeListener = paramOnFocusChangeListener;
  }
  
  public void setOnQueryTextListener(OnQueryTextListener paramOnQueryTextListener)
  {
    this.mOnQueryChangeListener = paramOnQueryTextListener;
  }
  
  public void setOnSearchClickListener(View.OnClickListener paramOnClickListener)
  {
    this.mOnSearchClickListener = paramOnClickListener;
  }
  
  public void setOnSuggestionListener(OnSuggestionListener paramOnSuggestionListener)
  {
    this.mOnSuggestionListener = paramOnSuggestionListener;
  }
  
  public void setQuery(CharSequence paramCharSequence, boolean paramBoolean)
  {
    this.mQueryTextView.setText(paramCharSequence);
    if (paramCharSequence != null)
    {
      this.mQueryTextView.setSelection(this.mQueryTextView.length());
      this.mUserQuery = paramCharSequence;
    }
    if ((paramBoolean) && (!TextUtils.isEmpty(paramCharSequence))) {
      onSubmitQuery();
    }
  }
  
  public void setQueryHint(CharSequence paramCharSequence)
  {
    this.mQueryHint = paramCharSequence;
    updateQueryHint();
  }
  
  public void setQueryRefinementEnabled(boolean paramBoolean)
  {
    this.mQueryRefinement = paramBoolean;
    SuggestionsAdapter localSuggestionsAdapter;
    if ((this.mSuggestionsAdapter instanceof SuggestionsAdapter))
    {
      localSuggestionsAdapter = (SuggestionsAdapter)this.mSuggestionsAdapter;
      if (!paramBoolean) {
        break label35;
      }
    }
    label35:
    for (int i = 2;; i = 1)
    {
      localSuggestionsAdapter.setQueryRefinement(i);
      return;
    }
  }
  
  public void setSearchableInfo(SearchableInfo paramSearchableInfo)
  {
    this.mSearchable = paramSearchableInfo;
    if (this.mSearchable != null)
    {
      updateSearchAutoComplete();
      updateQueryHint();
    }
    this.mVoiceButtonEnabled = hasVoiceSearch();
    if (this.mVoiceButtonEnabled) {
      this.mQueryTextView.setPrivateImeOptions("nm");
    }
    updateViewsVisibility(isIconified());
  }
  
  public void setSubmitButtonEnabled(boolean paramBoolean)
  {
    this.mSubmitButtonEnabled = paramBoolean;
    updateViewsVisibility(isIconified());
  }
  
  public void setSuggestionsAdapter(CursorAdapter paramCursorAdapter)
  {
    this.mSuggestionsAdapter = paramCursorAdapter;
    this.mQueryTextView.setAdapter(this.mSuggestionsAdapter);
  }
  
  private static class AutoCompleteTextViewReflector
  {
    private Method doAfterTextChanged;
    private Method doBeforeTextChanged;
    private Method ensureImeVisible;
    private Method showSoftInputUnchecked;
    
    AutoCompleteTextViewReflector()
    {
      try
      {
        this.doBeforeTextChanged = AutoCompleteTextView.class.getDeclaredMethod("doBeforeTextChanged", new Class[0]);
        this.doBeforeTextChanged.setAccessible(true);
        try
        {
          this.doAfterTextChanged = AutoCompleteTextView.class.getDeclaredMethod("doAfterTextChanged", new Class[0]);
          this.doAfterTextChanged.setAccessible(true);
          try
          {
            this.ensureImeVisible = AutoCompleteTextView.class.getMethod("ensureImeVisible", new Class[] { Boolean.TYPE });
            this.ensureImeVisible.setAccessible(true);
            try
            {
              this.showSoftInputUnchecked = InputMethodManager.class.getMethod("showSoftInputUnchecked", new Class[] { Integer.TYPE, ResultReceiver.class });
              this.showSoftInputUnchecked.setAccessible(true);
              return;
            }
            catch (NoSuchMethodException localNoSuchMethodException1)
            {
              for (;;) {}
            }
          }
          catch (NoSuchMethodException localNoSuchMethodException2)
          {
            for (;;) {}
          }
        }
        catch (NoSuchMethodException localNoSuchMethodException3)
        {
          for (;;) {}
        }
      }
      catch (NoSuchMethodException localNoSuchMethodException4)
      {
        for (;;) {}
      }
    }
    
    void doAfterTextChanged(AutoCompleteTextView paramAutoCompleteTextView)
    {
      if (this.doAfterTextChanged != null) {}
      try
      {
        this.doAfterTextChanged.invoke(paramAutoCompleteTextView, new Object[0]);
        return;
      }
      catch (Exception paramAutoCompleteTextView)
      {
        for (;;) {}
      }
    }
    
    void doBeforeTextChanged(AutoCompleteTextView paramAutoCompleteTextView)
    {
      if (this.doBeforeTextChanged != null) {}
      try
      {
        this.doBeforeTextChanged.invoke(paramAutoCompleteTextView, new Object[0]);
        return;
      }
      catch (Exception paramAutoCompleteTextView)
      {
        for (;;) {}
      }
    }
    
    void ensureImeVisible(AutoCompleteTextView paramAutoCompleteTextView, boolean paramBoolean)
    {
      if (this.ensureImeVisible != null) {}
      try
      {
        this.ensureImeVisible.invoke(paramAutoCompleteTextView, new Object[] { Boolean.valueOf(paramBoolean) });
        return;
      }
      catch (Exception paramAutoCompleteTextView)
      {
        for (;;) {}
      }
    }
    
    void showSoftInputUnchecked(InputMethodManager paramInputMethodManager, View paramView, int paramInt)
    {
      if (this.showSoftInputUnchecked != null) {}
      for (;;)
      {
        try
        {
          this.showSoftInputUnchecked.invoke(paramInputMethodManager, new Object[] { Integer.valueOf(paramInt), null });
          return;
        }
        catch (Exception localException) {}
        paramInputMethodManager.showSoftInput(paramView, paramInt);
      }
    }
  }
  
  public static abstract interface OnCloseListener
  {
    public abstract boolean onClose();
  }
  
  public static abstract interface OnQueryTextListener
  {
    public abstract boolean onQueryTextChange(String paramString);
    
    public abstract boolean onQueryTextSubmit(String paramString);
  }
  
  public static abstract interface OnSuggestionListener
  {
    public abstract boolean onSuggestionClick(int paramInt);
    
    public abstract boolean onSuggestionSelect(int paramInt);
  }
  
  public static class SearchAutoComplete
    extends AutoCompleteTextView
  {
    private SearchView mSearchView;
    private int mThreshold = getThreshold();
    
    public SearchAutoComplete(Context paramContext)
    {
      super();
    }
    
    public SearchAutoComplete(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public SearchAutoComplete(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
    {
      super(paramAttributeSet, paramInt);
    }
    
    private boolean isEmpty()
    {
      if (TextUtils.getTrimmedLength(getText()) == 0) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean enoughToFilter()
    {
      if ((this.mThreshold <= 0) || (super.enoughToFilter())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
    {
      super.onFocusChanged(paramBoolean, paramInt, paramRect);
      this.mSearchView.onTextFocusChanged();
    }
    
    public boolean onKeyPreIme(int paramInt, KeyEvent paramKeyEvent)
    {
      boolean bool1 = true;
      KeyEvent.DispatcherState localDispatcherState;
      boolean bool2;
      if (paramInt == 4) {
        if ((paramKeyEvent.getAction() == 0) && (paramKeyEvent.getRepeatCount() == 0))
        {
          localDispatcherState = getKeyDispatcherState();
          bool2 = bool1;
          if (localDispatcherState != null)
          {
            localDispatcherState.startTracking(paramKeyEvent, this);
            bool2 = bool1;
          }
        }
      }
      for (;;)
      {
        return bool2;
        if (paramKeyEvent.getAction() == 1)
        {
          localDispatcherState = getKeyDispatcherState();
          if (localDispatcherState != null) {
            localDispatcherState.handleUpEvent(paramKeyEvent);
          }
          if ((paramKeyEvent.isTracking()) && (!paramKeyEvent.isCanceled()))
          {
            this.mSearchView.clearFocus();
            this.mSearchView.setImeVisibility(false);
            bool2 = bool1;
            continue;
          }
        }
        bool2 = super.onKeyPreIme(paramInt, paramKeyEvent);
      }
    }
    
    public void onWindowFocusChanged(boolean paramBoolean)
    {
      super.onWindowFocusChanged(paramBoolean);
      if ((paramBoolean) && (this.mSearchView.hasFocus()) && (getVisibility() == 0))
      {
        ((InputMethodManager)getContext().getSystemService("input_method")).showSoftInput(this, 0);
        if (SearchView.isLandscapeMode(getContext())) {
          SearchView.HIDDEN_METHOD_INVOKER.ensureImeVisible(this, true);
        }
      }
    }
    
    public void performCompletion() {}
    
    protected void replaceText(CharSequence paramCharSequence) {}
    
    void setSearchView(SearchView paramSearchView)
    {
      this.mSearchView = paramSearchView;
    }
    
    public void setThreshold(int paramInt)
    {
      super.setThreshold(paramInt);
      this.mThreshold = paramInt;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/widget/SearchView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */