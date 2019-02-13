.class Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog$1;
.super Ljava/lang/Object;
.source "ChangeLogDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog$1;->this$0:Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 159
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 160
    return-void
.end method
