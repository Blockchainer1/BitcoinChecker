.class public Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
.super Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
.source "MaindbContract.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 124
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v1}, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 125
    return-void
.end method

.method synthetic constructor <init>(Lcom/mobnetic/coinguardian/db/content/MaindbContract$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mobnetic/coinguardian/db/content/MaindbContract$1;

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public setCheckerId(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 128
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "checkerId"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 129
    return-object p0
.end method

.method public setEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 132
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "enabled"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 133
    return-object p0
.end method

.method public setLastCheckPointTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "lastCheckPointTicker"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    return-object p0
.end method

.method public setLed(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 156
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "led"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 157
    return-object p0
.end method

.method public setSound(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 144
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "sound"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 145
    return-object p0
.end method

.method public setSoundUri(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "soundUri"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    return-object p0
.end method

.method public setTtsEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 160
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "ttsEnabled"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 161
    return-object p0
.end method

.method public setType(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 136
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "type"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 137
    return-object p0
.end method

.method public setValue(D)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # D

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "value"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 141
    return-object p0
.end method

.method public setVibrate(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "vibrate"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 153
    return-object p0
.end method
