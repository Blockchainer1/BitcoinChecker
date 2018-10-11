.class Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;
.super Ljava/lang/Object;
.source "ViewCurrencySpinnerPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->access$000(Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->access$000(Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 45
    :cond_0
    return-void
.end method
