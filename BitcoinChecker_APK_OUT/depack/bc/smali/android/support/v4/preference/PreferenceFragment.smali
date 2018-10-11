.class public abstract Landroid/support/v4/preference/PreferenceFragment;
.super Landroid/support/v4/app/Fragment;
.source "PreferenceFragment.java"

# interfaces
.implements Landroid/support/v4/preference/PreferenceManagerCompat$OnPreferenceTreeClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;
    }
.end annotation


# static fields
.field private static final FIRST_REQUEST_CODE:I = 0x64

.field private static final MSG_BIND_PREFERENCES:I = 0x1

.field private static final PREFERENCES_TAG:Ljava/lang/String; = "android:preferences"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mHavePrefs:Z

.field private mInitDone:Z

.field private mList:Landroid/widget/ListView;

.field private mListOnKeyListener:Landroid/view/View$OnKeyListener;

.field private mPreferenceManager:Landroid/preference/PreferenceManager;

.field private final mRequestFocus:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 52
    new-instance v0, Landroid/support/v4/preference/PreferenceFragment$1;

    invoke-direct {v0, p0}, Landroid/support/v4/preference/PreferenceFragment$1;-><init>(Landroid/support/v4/preference/PreferenceFragment;)V

    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    .line 64
    new-instance v0, Landroid/support/v4/preference/PreferenceFragment$2;

    invoke-direct {v0, p0}, Landroid/support/v4/preference/PreferenceFragment$2;-><init>(Landroid/support/v4/preference/PreferenceFragment;)V

    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    .line 297
    new-instance v0, Landroid/support/v4/preference/PreferenceFragment$3;

    invoke-direct {v0, p0}, Landroid/support/v4/preference/PreferenceFragment$3;-><init>(Landroid/support/v4/preference/PreferenceFragment;)V

    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mListOnKeyListener:Landroid/view/View$OnKeyListener;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/preference/PreferenceFragment;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v4/preference/PreferenceFragment;

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->bindPreferences()V

    return-void
.end method

.method static synthetic access$100(Landroid/support/v4/preference/PreferenceFragment;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Landroid/support/v4/preference/PreferenceFragment;

    .prologue
    .line 36
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method private bindPreferences()V
    .locals 2

    .prologue
    .line 262
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 263
    .local v0, "preferenceScreen":Landroid/preference/PreferenceScreen;
    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->bind(Landroid/widget/ListView;)V

    .line 266
    :cond_0
    return-void
.end method

.method private ensureList()V
    .locals 4

    .prologue
    .line 274
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    if-eqz v2, :cond_0

    .line 295
    :goto_0
    return-void

    .line 277
    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getView()Landroid/view/View;

    move-result-object v1

    .line 278
    .local v1, "root":Landroid/view/View;
    if-nez v1, :cond_1

    .line 279
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Content view not yet created"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 281
    :cond_1
    const v2, 0x102000a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 282
    .local v0, "rawListView":Landroid/view/View;
    instance-of v2, v0, Landroid/widget/ListView;

    if-nez v2, :cond_2

    .line 283
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Content has view with id attribute \'android.R.id.list\' that is not a ListView class"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 287
    :cond_2
    check-cast v0, Landroid/widget/ListView;

    .end local v0    # "rawListView":Landroid/view/View;
    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    .line 288
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    if-nez v2, :cond_3

    .line 289
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Your content must have a ListView whose id attribute is \'android.R.id.list\'"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 293
    :cond_3
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    iget-object v3, p0, Landroid/support/v4/preference/PreferenceFragment;->mListOnKeyListener:Landroid/view/View$OnKeyListener;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 294
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v4/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private postBindPreferences()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 257
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    :goto_0
    return-void

    .line 258
    :cond_0
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method

.method private requirePreferenceManager()V
    .locals 2

    .prologue
    .line 251
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    if-nez v0, :cond_0

    .line 252
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This should be called after super.onCreate."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 254
    :cond_0
    return-void
.end method


# virtual methods
.method public addPreferencesFromIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 204
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->requirePreferenceManager()V

    .line 206
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-static {v0, p1, v1}, Landroid/support/v4/preference/PreferenceManagerCompat;->inflateFromIntent(Landroid/preference/PreferenceManager;Landroid/content/Intent;Landroid/preference/PreferenceScreen;)Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/preference/PreferenceFragment;->setPreferenceScreen(Landroid/preference/PreferenceScreen;)V

    .line 207
    return-void
.end method

.method public addPreferencesFromResource(I)V
    .locals 3
    .param p1, "preferencesResId"    # I

    .prologue
    .line 216
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->requirePreferenceManager()V

    .line 218
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 219
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 218
    invoke-static {v0, v1, p1, v2}, Landroid/support/v4/preference/PreferenceManagerCompat;->inflateFromResource(Landroid/preference/PreferenceManager;Landroid/app/Activity;ILandroid/preference/PreferenceScreen;)Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v4/preference/PreferenceFragment;->setPreferenceScreen(Landroid/preference/PreferenceScreen;)V

    .line 220
    return-void
.end method

.method public findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;
    .locals 1
    .param p1, "key"    # Ljava/lang/CharSequence;

    .prologue
    .line 244
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    if-nez v0, :cond_0

    .line 245
    const/4 v0, 0x0

    .line 247
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceManager;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    goto :goto_0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 269
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->ensureList()V

    .line 270
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method public getPreferenceManager()Landroid/preference/PreferenceManager;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    return-object v0
.end method

.method public getPreferenceScreen()Landroid/preference/PreferenceScreen;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0}, Landroid/support/v4/preference/PreferenceManagerCompat;->getPreferenceScreen(Landroid/preference/PreferenceManager;)Landroid/preference/PreferenceScreen;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 101
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 103
    iget-boolean v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mHavePrefs:Z

    if-eqz v2, :cond_0

    .line 104
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->bindPreferences()V

    .line 107
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/preference/PreferenceFragment;->mInitDone:Z

    .line 109
    if-eqz p1, :cond_1

    .line 110
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 111
    .local v0, "container":Landroid/os/Bundle;
    if-eqz v0, :cond_1

    .line 112
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 113
    .local v1, "preferenceScreen":Landroid/preference/PreferenceScreen;
    if-eqz v1, :cond_1

    .line 114
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->restoreHierarchyState(Landroid/os/Bundle;)V

    .line 118
    .end local v0    # "container":Landroid/os/Bundle;
    .end local v1    # "preferenceScreen":Landroid/preference/PreferenceScreen;
    :cond_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 161
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 163
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0, p1, p2, p3}, Landroid/support/v4/preference/PreferenceManagerCompat;->dispatchActivityResult(Landroid/preference/PreferenceManager;IILandroid/content/Intent;)V

    .line 164
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 88
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/16 v1, 0x64

    invoke-static {v0, v1}, Landroid/support/v4/preference/PreferenceManagerCompat;->newInstance(Landroid/app/Activity;I)Landroid/preference/PreferenceManager;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    .line 89
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0, p0}, Landroid/support/v4/preference/PreferenceManagerCompat;->setFragment(Landroid/preference/PreferenceManager;Landroid/support/v4/preference/PreferenceFragment;)V

    .line 90
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "paramLayoutInflater"    # Landroid/view/LayoutInflater;
    .param p2, "paramViewGroup"    # Landroid/view/ViewGroup;
    .param p3, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 95
    sget v0, Landroid/support/v4/preferencefragment/R$layout;->preference_list_fragment:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 143
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 144
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0}, Landroid/support/v4/preference/PreferenceManagerCompat;->dispatchActivityDestroy(Landroid/preference/PreferenceManager;)V

    .line 145
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 135
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mList:Landroid/widget/ListView;

    .line 136
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v4/preference/PreferenceFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 137
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 138
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 139
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 228
    .line 229
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Landroid/support/v4/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Landroid/support/v4/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;

    invoke-interface {v0, p0, p2}, Landroid/support/v4/preference/PreferenceFragment$OnPreferenceStartFragmentCallback;->onPreferenceStartFragment(Landroid/support/v4/preference/PreferenceFragment;Landroid/preference/Preference;)Z

    move-result v0

    .line 233
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 149
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 151
    invoke-virtual {p0}, Landroid/support/v4/preference/PreferenceFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 152
    .local v1, "preferenceScreen":Landroid/preference/PreferenceScreen;
    if-eqz v1, :cond_0

    .line 153
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 154
    .local v0, "container":Landroid/os/Bundle;
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->saveHierarchyState(Landroid/os/Bundle;)V

    .line 155
    const-string v2, "android:preferences"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 157
    .end local v0    # "container":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 122
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 123
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0, p0}, Landroid/support/v4/preference/PreferenceManagerCompat;->setOnPreferenceTreeClickListener(Landroid/preference/PreferenceManager;Landroid/support/v4/preference/PreferenceManagerCompat$OnPreferenceTreeClickListener;)V

    .line 124
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 128
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 129
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0}, Landroid/support/v4/preference/PreferenceManagerCompat;->dispatchActivityStop(Landroid/preference/PreferenceManager;)V

    .line 130
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/preference/PreferenceManagerCompat;->setOnPreferenceTreeClickListener(Landroid/preference/PreferenceManager;Landroid/support/v4/preference/PreferenceManagerCompat$OnPreferenceTreeClickListener;)V

    .line 131
    return-void
.end method

.method public setPreferenceScreen(Landroid/preference/PreferenceScreen;)V
    .locals 1
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;

    .prologue
    .line 180
    iget-object v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mPreferenceManager:Landroid/preference/PreferenceManager;

    invoke-static {v0, p1}, Landroid/support/v4/preference/PreferenceManagerCompat;->setPreferences(Landroid/preference/PreferenceManager;Landroid/preference/PreferenceScreen;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mHavePrefs:Z

    .line 182
    iget-boolean v0, p0, Landroid/support/v4/preference/PreferenceFragment;->mInitDone:Z

    if-eqz v0, :cond_0

    .line 183
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;->postBindPreferences()V

    .line 186
    :cond_0
    return-void
.end method
