.class Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$1;
.super Ljava/lang/Object;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$1;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->access$000(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V

    .line 56
    return-void
.end method
