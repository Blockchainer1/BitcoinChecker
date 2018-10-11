.class public Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
.super Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
.source "MaindbContract.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 226
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v1}, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 227
    return-void
.end method

.method synthetic constructor <init>(Lcom/mobnetic/coinguardian/db/content/MaindbContract$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mobnetic/coinguardian/db/content/MaindbContract$1;

    .prologue
    .line 224
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public setContractType(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 294
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "contractType"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 295
    return-object p0
.end method

.method public setCurrencyDst(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "currencyDst"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    return-object p0
.end method

.method public setCurrencyPairId(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 290
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "currencyPairId"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    return-object p0
.end method

.method public setCurrencySrc(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "currencySrc"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    return-object p0
.end method

.method public setCurrencySubunitDst(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 282
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "currencySubunitDst"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 283
    return-object p0
.end method

.method public setCurrencySubunitSrc(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 278
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "currencySubunitSrc"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 279
    return-object p0
.end method

.method public setEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 230
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "enabled"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 231
    return-object p0
.end method

.method public setErrorMsg(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 286
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "errorMsg"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    return-object p0
.end method

.method public setFrequency(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 246
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "frequency"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 247
    return-object p0
.end method

.method public setLastCheckDate(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 270
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "lastCheckDate"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 271
    return-object p0
.end method

.method public setLastCheckPointTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "lastCheckPointTicker"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    return-object p0
.end method

.method public setLastCheckTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "lastCheckTicker"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-object p0
.end method

.method public setMarketKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "marketKey"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    return-object p0
.end method

.method public setNotificationPriority(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 250
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "notificationPriority"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 251
    return-object p0
.end method

.method public setPreviousCheckTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 266
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "previousCheckTicker"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    return-object p0
.end method

.method public setSortOrder(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 274
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "sortOrder"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 275
    return-object p0
.end method

.method public setTtsEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    .locals 3
    .param p1, "value"    # Z

    .prologue
    .line 254
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->mValues:Landroid/content/ContentValues;

    const-string v1, "ttsEnabled"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 255
    return-object p0
.end method
