.class Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$1;
.super Ljava/lang/Object;
.source "ViewSpinnerPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setSelection(I)V

    .line 77
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 78
    return-void
.end method
