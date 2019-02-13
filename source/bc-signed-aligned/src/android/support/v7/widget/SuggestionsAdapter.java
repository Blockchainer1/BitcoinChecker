package android.support.v7.widget;

import android.app.SearchManager;
import android.app.SearchableInfo;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.Resources.Theme;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.support.v4.widget.ResourceCursorAdapter;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.TextAppearanceSpan;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.WeakHashMap;

class SuggestionsAdapter
  extends ResourceCursorAdapter
  implements View.OnClickListener
{
  private static final boolean DBG = false;
  static final int INVALID_INDEX = -1;
  private static final String LOG_TAG = "SuggestionsAdapter";
  private static final int QUERY_LIMIT = 50;
  static final int REFINE_ALL = 2;
  static final int REFINE_BY_ENTRY = 1;
  static final int REFINE_NONE = 0;
  private boolean mClosed = false;
  private int mFlagsCol = -1;
  private int mIconName1Col = -1;
  private int mIconName2Col = -1;
  private WeakHashMap<String, Drawable.ConstantState> mOutsideDrawablesCache;
  private Context mProviderContext;
  private int mQueryRefinement = 1;
  private SearchManager mSearchManager = (SearchManager)this.mContext.getSystemService("search");
  private SearchView mSearchView;
  private SearchableInfo mSearchable;
  private int mText1Col = -1;
  private int mText2Col = -1;
  private int mText2UrlCol = -1;
  private ColorStateList mUrlColor;
  
  public SuggestionsAdapter(Context paramContext, SearchView paramSearchView, SearchableInfo paramSearchableInfo, WeakHashMap<String, Drawable.ConstantState> paramWeakHashMap)
  {
    super(paramContext, R.layout.abc_search_dropdown_item_icons_2line, null, true);
    this.mSearchView = paramSearchView;
    this.mSearchable = paramSearchableInfo;
    this.mProviderContext = paramContext;
    this.mOutsideDrawablesCache = paramWeakHashMap;
  }
  
  private Drawable checkIconCache(String paramString)
  {
    paramString = (Drawable.ConstantState)this.mOutsideDrawablesCache.get(paramString);
    if (paramString == null) {}
    for (paramString = null;; paramString = paramString.newDrawable()) {
      return paramString;
    }
  }
  
  private CharSequence formatUrl(CharSequence paramCharSequence)
  {
    if (this.mUrlColor == null)
    {
      localObject = new TypedValue();
      this.mContext.getTheme().resolveAttribute(R.attr.textColorSearchUrl, (TypedValue)localObject, true);
      this.mUrlColor = this.mContext.getResources().getColorStateList(((TypedValue)localObject).resourceId);
    }
    Object localObject = new SpannableString(paramCharSequence);
    ((SpannableString)localObject).setSpan(new TextAppearanceSpan(null, 0, 0, this.mUrlColor, null), 0, paramCharSequence.length(), 33);
    return (CharSequence)localObject;
  }
  
  private Drawable getActivityIcon(ComponentName paramComponentName)
  {
    localObject1 = this.mContext.getPackageManager();
    try
    {
      localObject2 = ((PackageManager)localObject1).getActivityInfo(paramComponentName, 128);
      i = ((ActivityInfo)localObject2).getIconResource();
      if (i != 0) {
        break label48;
      }
      localObject2 = null;
    }
    catch (PackageManager.NameNotFoundException paramComponentName)
    {
      for (;;)
      {
        int i;
        Log.w("SuggestionsAdapter", paramComponentName.toString());
        Object localObject2 = null;
        continue;
        localObject1 = ((PackageManager)localObject1).getDrawable(paramComponentName.getPackageName(), i, ((ActivityInfo)localObject2).applicationInfo);
        localObject2 = localObject1;
        if (localObject1 == null)
        {
          Log.w("SuggestionsAdapter", "Invalid icon resource " + i + " for " + paramComponentName.flattenToShortString());
          localObject2 = null;
        }
      }
    }
    return (Drawable)localObject2;
  }
  
  private Drawable getActivityIconWithCache(ComponentName paramComponentName)
  {
    Drawable localDrawable = null;
    String str = paramComponentName.flattenToShortString();
    if (this.mOutsideDrawablesCache.containsKey(str))
    {
      paramComponentName = (Drawable.ConstantState)this.mOutsideDrawablesCache.get(str);
      if (paramComponentName == null) {}
      for (paramComponentName = localDrawable;; paramComponentName = paramComponentName.newDrawable(this.mProviderContext.getResources())) {
        return paramComponentName;
      }
    }
    localDrawable = getActivityIcon(paramComponentName);
    if (localDrawable == null) {}
    for (paramComponentName = null;; paramComponentName = localDrawable.getConstantState())
    {
      this.mOutsideDrawablesCache.put(str, paramComponentName);
      paramComponentName = localDrawable;
      break;
    }
  }
  
  public static String getColumnString(Cursor paramCursor, String paramString)
  {
    return getStringOrNull(paramCursor, paramCursor.getColumnIndex(paramString));
  }
  
  private Drawable getDefaultIcon1(Cursor paramCursor)
  {
    paramCursor = getActivityIconWithCache(this.mSearchable.getSearchActivity());
    if (paramCursor != null) {}
    for (;;)
    {
      return paramCursor;
      paramCursor = this.mContext.getPackageManager().getDefaultActivityIcon();
    }
  }
  
  /* Error */
  private Drawable getDrawable(Uri paramUri)
  {
    // Byte code:
    //   0: ldc_w 284
    //   3: aload_1
    //   4: invokevirtual 289	android/net/Uri:getScheme	()Ljava/lang/String;
    //   7: invokevirtual 294	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   10: istore_2
    //   11: iload_2
    //   12: ifeq +94 -> 106
    //   15: aload_0
    //   16: aload_1
    //   17: invokevirtual 297	android/support/v7/widget/SuggestionsAdapter:getDrawableFromResourceUri	(Landroid/net/Uri;)Landroid/graphics/drawable/Drawable;
    //   20: astore_3
    //   21: aload_3
    //   22: astore_1
    //   23: aload_1
    //   24: areturn
    //   25: astore_3
    //   26: new 278	java/io/FileNotFoundException
    //   29: astore 4
    //   31: new 214	java/lang/StringBuilder
    //   34: astore_3
    //   35: aload_3
    //   36: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   39: aload 4
    //   41: aload_3
    //   42: ldc_w 299
    //   45: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   48: aload_1
    //   49: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   52: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   55: invokespecial 305	java/io/FileNotFoundException:<init>	(Ljava/lang/String;)V
    //   58: aload 4
    //   60: athrow
    //   61: astore_3
    //   62: ldc 19
    //   64: new 214	java/lang/StringBuilder
    //   67: dup
    //   68: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   71: ldc_w 307
    //   74: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: aload_1
    //   78: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   81: ldc_w 309
    //   84: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: aload_3
    //   88: invokevirtual 312	java/io/FileNotFoundException:getMessage	()Ljava/lang/String;
    //   91: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   94: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   97: invokestatic 199	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   100: pop
    //   101: aconst_null
    //   102: astore_1
    //   103: goto -80 -> 23
    //   106: aload_0
    //   107: getfield 94	android/support/v7/widget/SuggestionsAdapter:mProviderContext	Landroid/content/Context;
    //   110: invokevirtual 316	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   113: aload_1
    //   114: invokevirtual 322	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   117: astore 4
    //   119: aload 4
    //   121: ifnonnull +38 -> 159
    //   124: new 278	java/io/FileNotFoundException
    //   127: astore_3
    //   128: new 214	java/lang/StringBuilder
    //   131: astore 4
    //   133: aload 4
    //   135: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   138: aload_3
    //   139: aload 4
    //   141: ldc_w 324
    //   144: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: aload_1
    //   148: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   151: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   154: invokespecial 305	java/io/FileNotFoundException:<init>	(Ljava/lang/String;)V
    //   157: aload_3
    //   158: athrow
    //   159: aload 4
    //   161: aconst_null
    //   162: invokestatic 328	android/graphics/drawable/Drawable:createFromStream	(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    //   165: astore_3
    //   166: aload 4
    //   168: invokevirtual 333	java/io/InputStream:close	()V
    //   171: aload_3
    //   172: astore_1
    //   173: goto -150 -> 23
    //   176: astore 4
    //   178: new 214	java/lang/StringBuilder
    //   181: astore 5
    //   183: aload 5
    //   185: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   188: ldc 19
    //   190: aload 5
    //   192: ldc_w 335
    //   195: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: aload_1
    //   199: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   202: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   205: aload 4
    //   207: invokestatic 339	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   210: pop
    //   211: aload_3
    //   212: astore_1
    //   213: goto -190 -> 23
    //   216: astore_3
    //   217: aload 4
    //   219: invokevirtual 333	java/io/InputStream:close	()V
    //   222: aload_3
    //   223: athrow
    //   224: astore 4
    //   226: new 214	java/lang/StringBuilder
    //   229: astore 5
    //   231: aload 5
    //   233: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   236: ldc 19
    //   238: aload 5
    //   240: ldc_w 335
    //   243: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   246: aload_1
    //   247: invokevirtual 302	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   250: invokevirtual 230	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   253: aload 4
    //   255: invokestatic 339	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   258: pop
    //   259: goto -37 -> 222
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	262	0	this	SuggestionsAdapter
    //   0	262	1	paramUri	Uri
    //   10	2	2	bool	boolean
    //   20	2	3	localDrawable	Drawable
    //   25	1	3	localNotFoundException	Resources.NotFoundException
    //   34	8	3	localStringBuilder1	StringBuilder
    //   61	27	3	localFileNotFoundException	FileNotFoundException
    //   127	85	3	localObject1	Object
    //   216	7	3	localObject2	Object
    //   29	138	4	localObject3	Object
    //   176	42	4	localIOException1	java.io.IOException
    //   224	30	4	localIOException2	java.io.IOException
    //   181	58	5	localStringBuilder2	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   15	21	25	android/content/res/Resources$NotFoundException
    //   0	11	61	java/io/FileNotFoundException
    //   15	21	61	java/io/FileNotFoundException
    //   26	61	61	java/io/FileNotFoundException
    //   106	119	61	java/io/FileNotFoundException
    //   124	159	61	java/io/FileNotFoundException
    //   166	171	61	java/io/FileNotFoundException
    //   178	211	61	java/io/FileNotFoundException
    //   217	222	61	java/io/FileNotFoundException
    //   222	224	61	java/io/FileNotFoundException
    //   226	259	61	java/io/FileNotFoundException
    //   166	171	176	java/io/IOException
    //   159	166	216	finally
    //   217	222	224	java/io/IOException
  }
  
  private Drawable getDrawableFromResourceValue(String paramString)
  {
    Object localObject1;
    if ((paramString == null) || (paramString.length() == 0) || ("0".equals(paramString))) {
      localObject1 = null;
    }
    for (;;)
    {
      return (Drawable)localObject1;
      try
      {
        int i = Integer.parseInt(paramString);
        localObject1 = new java/lang/StringBuilder;
        ((StringBuilder)localObject1).<init>();
        String str = "android.resource://" + this.mProviderContext.getPackageName() + "/" + i;
        localDrawable = checkIconCache(str);
        localObject1 = localDrawable;
        if (localDrawable == null)
        {
          localObject1 = this.mProviderContext.getResources().getDrawable(i);
          storeInIconCache(str, (Drawable)localObject1);
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        Drawable localDrawable = checkIconCache(paramString);
        Object localObject2 = localDrawable;
        if (localDrawable == null)
        {
          localObject2 = getDrawable(Uri.parse(paramString));
          storeInIconCache(paramString, (Drawable)localObject2);
        }
      }
      catch (Resources.NotFoundException localNotFoundException)
      {
        Log.w("SuggestionsAdapter", "Icon resource not found: " + paramString);
        Object localObject3 = null;
      }
    }
  }
  
  private Drawable getIcon1(Cursor paramCursor)
  {
    Object localObject;
    if (this.mIconName1Col == -1) {
      localObject = null;
    }
    for (;;)
    {
      return (Drawable)localObject;
      Drawable localDrawable = getDrawableFromResourceValue(paramCursor.getString(this.mIconName1Col));
      localObject = localDrawable;
      if (localDrawable == null) {
        localObject = getDefaultIcon1(paramCursor);
      }
    }
  }
  
  private Drawable getIcon2(Cursor paramCursor)
  {
    if (this.mIconName2Col == -1) {}
    for (paramCursor = null;; paramCursor = getDrawableFromResourceValue(paramCursor.getString(this.mIconName2Col))) {
      return paramCursor;
    }
  }
  
  private static String getStringOrNull(Cursor paramCursor, int paramInt)
  {
    Object localObject = null;
    if (paramInt == -1) {
      paramCursor = (Cursor)localObject;
    }
    for (;;)
    {
      return paramCursor;
      try
      {
        paramCursor = paramCursor.getString(paramInt);
      }
      catch (Exception paramCursor)
      {
        Log.e("SuggestionsAdapter", "unexpected error retrieving valid column from cursor, did the remote process die?", paramCursor);
        paramCursor = (Cursor)localObject;
      }
    }
  }
  
  private void setViewDrawable(ImageView paramImageView, Drawable paramDrawable, int paramInt)
  {
    paramImageView.setImageDrawable(paramDrawable);
    if (paramDrawable == null) {
      paramImageView.setVisibility(paramInt);
    }
    for (;;)
    {
      return;
      paramImageView.setVisibility(0);
      paramDrawable.setVisible(false, false);
      paramDrawable.setVisible(true, false);
    }
  }
  
  private void setViewText(TextView paramTextView, CharSequence paramCharSequence)
  {
    paramTextView.setText(paramCharSequence);
    if (TextUtils.isEmpty(paramCharSequence)) {
      paramTextView.setVisibility(8);
    }
    for (;;)
    {
      return;
      paramTextView.setVisibility(0);
    }
  }
  
  private void storeInIconCache(String paramString, Drawable paramDrawable)
  {
    if (paramDrawable != null) {
      this.mOutsideDrawablesCache.put(paramString, paramDrawable.getConstantState());
    }
  }
  
  private void updateSpinnerState(Cursor paramCursor)
  {
    if (paramCursor != null) {}
    for (paramCursor = paramCursor.getExtras();; paramCursor = null)
    {
      if ((paramCursor != null) && (paramCursor.getBoolean("in_progress"))) {}
      return;
    }
  }
  
  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    paramContext = (ChildViewCache)paramView.getTag();
    int i = 0;
    if (this.mFlagsCol != -1) {
      i = paramCursor.getInt(this.mFlagsCol);
    }
    if (paramContext.mText1 != null)
    {
      paramView = getStringOrNull(paramCursor, this.mText1Col);
      setViewText(paramContext.mText1, paramView);
    }
    if (paramContext.mText2 != null)
    {
      paramView = getStringOrNull(paramCursor, this.mText2UrlCol);
      if (paramView != null)
      {
        paramView = formatUrl(paramView);
        if (!TextUtils.isEmpty(paramView)) {
          break label230;
        }
        if (paramContext.mText1 != null)
        {
          paramContext.mText1.setSingleLine(false);
          paramContext.mText1.setMaxLines(2);
        }
        label112:
        setViewText(paramContext.mText2, paramView);
      }
    }
    else
    {
      if (paramContext.mIcon1 != null) {
        setViewDrawable(paramContext.mIcon1, getIcon1(paramCursor), 4);
      }
      if (paramContext.mIcon2 != null) {
        setViewDrawable(paramContext.mIcon2, getIcon2(paramCursor), 8);
      }
      if ((this.mQueryRefinement != 2) && ((this.mQueryRefinement != 1) || ((i & 0x1) == 0))) {
        break label256;
      }
      paramContext.mIconRefine.setVisibility(0);
      paramContext.mIconRefine.setTag(paramContext.mText1.getText());
      paramContext.mIconRefine.setOnClickListener(this);
    }
    for (;;)
    {
      return;
      paramView = getStringOrNull(paramCursor, this.mText2Col);
      break;
      label230:
      if (paramContext.mText1 == null) {
        break label112;
      }
      paramContext.mText1.setSingleLine(true);
      paramContext.mText1.setMaxLines(1);
      break label112;
      label256:
      paramContext.mIconRefine.setVisibility(8);
    }
  }
  
  public void changeCursor(Cursor paramCursor)
  {
    if (this.mClosed)
    {
      Log.w("SuggestionsAdapter", "Tried to change cursor after adapter was closed.");
      if (paramCursor != null) {
        paramCursor.close();
      }
    }
    for (;;)
    {
      return;
      try
      {
        super.changeCursor(paramCursor);
        if (paramCursor != null)
        {
          this.mText1Col = paramCursor.getColumnIndex("suggest_text_1");
          this.mText2Col = paramCursor.getColumnIndex("suggest_text_2");
          this.mText2UrlCol = paramCursor.getColumnIndex("suggest_text_2_url");
          this.mIconName1Col = paramCursor.getColumnIndex("suggest_icon_1");
          this.mIconName2Col = paramCursor.getColumnIndex("suggest_icon_2");
          this.mFlagsCol = paramCursor.getColumnIndex("suggest_flags");
        }
      }
      catch (Exception paramCursor)
      {
        Log.e("SuggestionsAdapter", "error changing cursor and caching columns", paramCursor);
      }
    }
  }
  
  public void close()
  {
    changeCursor(null);
    this.mClosed = true;
  }
  
  public CharSequence convertToString(Cursor paramCursor)
  {
    Object localObject;
    if (paramCursor == null) {
      localObject = null;
    }
    for (;;)
    {
      return (CharSequence)localObject;
      String str = getColumnString(paramCursor, "suggest_intent_query");
      localObject = str;
      if (str == null) {
        if (this.mSearchable.shouldRewriteQueryFromData())
        {
          localObject = getColumnString(paramCursor, "suggest_intent_data");
          if (localObject != null) {}
        }
        else if (this.mSearchable.shouldRewriteQueryFromText())
        {
          localObject = getColumnString(paramCursor, "suggest_text_1");
          if (localObject != null) {}
        }
        else
        {
          localObject = null;
        }
      }
    }
  }
  
  Drawable getDrawableFromResourceUri(Uri paramUri)
    throws FileNotFoundException
  {
    String str = paramUri.getAuthority();
    if (TextUtils.isEmpty(str)) {
      throw new FileNotFoundException("No authority: " + paramUri);
    }
    Resources localResources;
    List localList;
    try
    {
      localResources = this.mContext.getPackageManager().getResourcesForApplication(str);
      localList = paramUri.getPathSegments();
      if (localList == null) {
        throw new FileNotFoundException("No path: " + paramUri);
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      throw new FileNotFoundException("No package found for authority: " + paramUri);
    }
    int i = localList.size();
    if (i == 1) {}
    for (;;)
    {
      try
      {
        i = Integer.parseInt((String)localList.get(0));
        if (i != 0) {
          break;
        }
        throw new FileNotFoundException("No resource found for: " + paramUri);
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new FileNotFoundException("Single path segment is not a resource ID: " + paramUri);
      }
      if (i == 2) {
        i = localResources.getIdentifier((String)localList.get(1), (String)localList.get(0), localNumberFormatException);
      } else {
        throw new FileNotFoundException("More than two path segments: " + paramUri);
      }
    }
    return localResources.getDrawable(i);
  }
  
  public int getQueryRefinement()
  {
    return this.mQueryRefinement;
  }
  
  Cursor getSearchManagerSuggestions(SearchableInfo paramSearchableInfo, String paramString, int paramInt)
  {
    Object localObject = null;
    if (paramSearchableInfo == null) {}
    do
    {
      return (Cursor)localObject;
      str = paramSearchableInfo.getSuggestAuthority();
    } while (str == null);
    localObject = new Uri.Builder().scheme("content").authority(str).query("").fragment("");
    String str = paramSearchableInfo.getSuggestPath();
    if (str != null) {
      ((Uri.Builder)localObject).appendEncodedPath(str);
    }
    ((Uri.Builder)localObject).appendPath("search_suggest_query");
    str = paramSearchableInfo.getSuggestSelection();
    paramSearchableInfo = null;
    if (str != null)
    {
      paramSearchableInfo = new String[1];
      paramSearchableInfo[0] = paramString;
    }
    for (;;)
    {
      if (paramInt > 0) {
        ((Uri.Builder)localObject).appendQueryParameter("limit", String.valueOf(paramInt));
      }
      paramString = ((Uri.Builder)localObject).build();
      localObject = this.mContext.getContentResolver().query(paramString, null, str, paramSearchableInfo, null);
      break;
      ((Uri.Builder)localObject).appendPath(paramString);
    }
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    try
    {
      paramView = super.getView(paramInt, paramView, paramViewGroup);
      return paramView;
    }
    catch (RuntimeException localRuntimeException)
    {
      for (;;)
      {
        Log.w("SuggestionsAdapter", "Search suggestions cursor threw exception.", localRuntimeException);
        paramViewGroup = newView(this.mContext, this.mCursor, paramViewGroup);
        paramView = paramViewGroup;
        if (paramViewGroup != null)
        {
          ((ChildViewCache)paramViewGroup.getTag()).mText1.setText(localRuntimeException.toString());
          paramView = paramViewGroup;
        }
      }
    }
  }
  
  public boolean hasStableIds()
  {
    return false;
  }
  
  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    paramContext = super.newView(paramContext, paramCursor, paramViewGroup);
    paramContext.setTag(new ChildViewCache(paramContext));
    return paramContext;
  }
  
  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
    updateSpinnerState(getCursor());
  }
  
  public void notifyDataSetInvalidated()
  {
    super.notifyDataSetInvalidated();
    updateSpinnerState(getCursor());
  }
  
  public void onClick(View paramView)
  {
    paramView = paramView.getTag();
    if ((paramView instanceof CharSequence)) {
      this.mSearchView.onQueryRefine((CharSequence)paramView);
    }
  }
  
  public Cursor runQueryOnBackgroundThread(CharSequence paramCharSequence)
  {
    Object localObject1 = null;
    Object localObject2;
    if (paramCharSequence == null)
    {
      localObject2 = "";
      paramCharSequence = (CharSequence)localObject1;
      if (this.mSearchView.getVisibility() == 0)
      {
        if (this.mSearchView.getWindowVisibility() == 0) {
          break label44;
        }
        paramCharSequence = (CharSequence)localObject1;
      }
    }
    for (;;)
    {
      return paramCharSequence;
      localObject2 = paramCharSequence.toString();
      break;
      try
      {
        label44:
        localObject2 = getSearchManagerSuggestions(this.mSearchable, (String)localObject2, 50);
        paramCharSequence = (CharSequence)localObject1;
        if (localObject2 != null)
        {
          ((Cursor)localObject2).getCount();
          paramCharSequence = (CharSequence)localObject2;
        }
      }
      catch (RuntimeException paramCharSequence)
      {
        Log.w("SuggestionsAdapter", "Search suggestions query threw an exception.", paramCharSequence);
        paramCharSequence = (CharSequence)localObject1;
      }
    }
  }
  
  public void setQueryRefinement(int paramInt)
  {
    this.mQueryRefinement = paramInt;
  }
  
  private static final class ChildViewCache
  {
    public final ImageView mIcon1;
    public final ImageView mIcon2;
    public final ImageView mIconRefine;
    public final TextView mText1;
    public final TextView mText2;
    
    public ChildViewCache(View paramView)
    {
      this.mText1 = ((TextView)paramView.findViewById(16908308));
      this.mText2 = ((TextView)paramView.findViewById(16908309));
      this.mIcon1 = ((ImageView)paramView.findViewById(16908295));
      this.mIcon2 = ((ImageView)paramView.findViewById(16908296));
      this.mIconRefine = ((ImageView)paramView.findViewById(R.id.edit_query));
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/widget/SuggestionsAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */