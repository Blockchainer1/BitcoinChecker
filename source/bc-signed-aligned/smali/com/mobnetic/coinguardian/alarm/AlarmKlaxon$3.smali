.class Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$3;
.super Ljava/lang/Object;
.source "AlarmKlaxon.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->play(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$3;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 265
    const-string v0, "AlarmKlaxon"

    const-string v1, "Error occurred while playing audio."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 267
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    .line 268
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$3;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->access$202(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 269
    const/4 v0, 0x1

    return v0
.end method
