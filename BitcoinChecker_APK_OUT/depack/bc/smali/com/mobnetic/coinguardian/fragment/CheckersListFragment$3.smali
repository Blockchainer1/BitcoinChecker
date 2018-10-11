.class Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;
.super Landroid/os/AsyncTask;
.source "CheckersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onDrop(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Landroid/content/ContentProviderOperation;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 157
    check-cast p1, [Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->doInBackground([Ljava/util/ArrayList;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/util/ArrayList;)Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "ops":[Ljava/util/ArrayList;, "[Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :try_start_0
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->CONTENT_AUTHORITY:Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    .line 162
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckersListSortMode(Landroid/content/Context;I)V

    .line 163
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->access$200(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 164
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->access$200(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Landroid/view/MenuItem;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 165
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$3;->val$appContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_0
    const/4 v1, 0x0

    return-object v1

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
