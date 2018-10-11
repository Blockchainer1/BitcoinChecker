.class public abstract Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "SimpleDonateFragmentSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v4/app/Fragment;",
        ">",
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final EXTRA_SHOW_DONATE_DIALOG:Ljava/lang/String; = "show_donate_dialog"

.field private static final REQ_DONATE_BTC:I = 0x2711

.field private static final REQ_DONATE_DOGE:I = 0x2712

.field private static final REQ_DONATE_LTC:I = 0x2713

.field protected static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-class v0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationBtc(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationDoge(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationLtc(Landroid/app/Activity;)V

    return-void
.end method

.method private final makeDonationBtc(Landroid/app/Activity;)V
    .locals 7
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 155
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    const-string v2, "BTC"

    const/16 v3, 0x2711

    const-string v4, "bitcoin:1KyLY5sT1Ffa6ctFPFpdL2bxhSAxNqfvMA?amount=0.02"

    const-string v5, "de.schildbach.wallet"

    const-string v6, "Bitcoin"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationVirtual(Landroid/app/Activity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method private final makeDonationDoge(Landroid/app/Activity;)V
    .locals 7
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 162
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    const-string v2, "DOGE"

    const/16 v3, 0x2712

    const-string v4, "dogecoin:D81kyZ49E132enb7ct7RcPGpjgsrN7bsd7?amount=45000"

    const-string v5, "de.langerhans.wallet"

    const-string v6, "Dogecoin"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationVirtual(Landroid/app/Activity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    return-void
.end method

.method private final makeDonationLtc(Landroid/app/Activity;)V
    .locals 7
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    .line 169
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    const-string v2, "LTC"

    const/16 v3, 0x2713

    const-string v4, "litecoin:LZ3EiK42o5nbDW3cwiaKUptFQ9eBA3x1vw?amount=1.8"

    const-string v5, "de.schildbach.wallet_ltc"

    const-string v6, "Litecoin"

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationVirtual(Landroid/app/Activity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    return-void
.end method

.method private final makeDonationVirtual(Landroid/app/Activity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "virtualCurrency"    # Ljava/lang/String;
    .param p3, "reqCode"    # I
    .param p4, "uriString"    # Ljava/lang/String;
    .param p5, "walletPackageName"    # Ljava/lang/String;
    .param p6, "walletName"    # Ljava/lang/String;

    .prologue
    .line 176
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 177
    .local v0, "donateIntent":Landroid/content/Intent;
    invoke-static {p1, v0}, Lcom/mobnetic/coinguardian/util/Utils;->isIntentAvailable(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 178
    invoke-virtual {p1, v0, p3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 190
    :goto_0
    return-void

    .line 180
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0700a5

    .line 181
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0700a4

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x1

    aput-object p6, v3, v4

    .line 182
    invoke-virtual {p0, v2, v3}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    .line 183
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    new-instance v3, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;

    invoke-direct {v3, p0, p1, p5}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;-><init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 188
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method protected static startSimpleDonateFragmentActivity(Landroid/content/Context;Ljava/lang/Class;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "showDonateDialog"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "show_donate_dialog"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 75
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 76
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 85
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    const/16 v0, 0x2711

    if-eq p1, v0, :cond_0

    const/16 v0, 0x2712

    if-eq p1, v0, :cond_0

    const/16 v0, 0x2713

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 90
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->onDonateSuccess(Z)V

    .line 95
    :goto_0
    return-void

    .line 94
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "show_donate_dialog"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->showDonateDialog()V

    .line 54
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 58
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onDestroy()V

    .line 67
    return-void
.end method

.method protected onDonateSuccess(Z)V
    .locals 2
    .param p1, "showSuccessToast"    # Z

    .prologue
    .line 213
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    if-eqz p1, :cond_0

    .line 214
    const v0, 0x7f0700ae

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->showToast(Landroid/content/Context;IZ)V

    .line 215
    :cond_0
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setDonationMade(Landroid/content/Context;)V

    .line 216
    return-void
.end method

.method public showDonateDialog()V
    .locals 3

    .prologue
    .line 101
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity<TT;>;"
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0700b0

    .line 102
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    new-instance v2, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$3;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$3;-><init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;)V

    .line 103
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;-><init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;)V

    .line 108
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 113
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;-><init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 142
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 143
    return-void
.end method
