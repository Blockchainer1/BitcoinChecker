.class Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$1;
.super Ljava/lang/Object;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$1;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$1;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$000(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V

    .line 61
    return-void
.end method
