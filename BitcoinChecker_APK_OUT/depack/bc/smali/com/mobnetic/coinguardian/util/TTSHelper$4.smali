.class final Lcom/mobnetic/coinguardian/util/TTSHelper$4;
.super Ljava/lang/Object;
.source "TTSHelper.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/util/TTSHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 1
    .param p1, "focusChange"    # I

    .prologue
    .line 161
    const/4 v0, -0x2

    if-ne p1, v0, :cond_1

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 163
    :cond_1
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    .line 165
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 166
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$400()V

    goto :goto_0
.end method
