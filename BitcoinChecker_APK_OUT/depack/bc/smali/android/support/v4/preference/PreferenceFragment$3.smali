.class Landroid/support/v4/preference/PreferenceFragment$3;
.super Ljava/lang/Object;
.source "PreferenceFragment.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/preference/PreferenceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/preference/PreferenceFragment;


# direct methods
.method constructor <init>(Landroid/support/v4/preference/PreferenceFragment;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/v4/preference/PreferenceFragment;

    .prologue
    .line 297
    iput-object p1, p0, Landroid/support/v4/preference/PreferenceFragment$3;->this$0:Landroid/support/v4/preference/PreferenceFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    .line 301
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment$3;->this$0:Landroid/support/v4/preference/PreferenceFragment;

    invoke-static {v2}, Landroid/support/v4/preference/PreferenceFragment;->access$100(Landroid/support/v4/preference/PreferenceFragment;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    .line 302
    .local v0, "selectedItem":Ljava/lang/Object;
    instance-of v2, v0, Landroid/preference/Preference;

    if-eqz v2, :cond_0

    .line 304
    iget-object v2, p0, Landroid/support/v4/preference/PreferenceFragment$3;->this$0:Landroid/support/v4/preference/PreferenceFragment;

    invoke-static {v2}, Landroid/support/v4/preference/PreferenceFragment;->access$100(Landroid/support/v4/preference/PreferenceFragment;)Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getSelectedView()Landroid/view/View;

    move-result-object v1

    .line 309
    :cond_0
    return v3
.end method
