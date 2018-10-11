.class public Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;
.super Ljava/lang/Object;
.source "CurrencySymbols.java"


# static fields
.field public static final CURRENCY_SYMBOLS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    .line 9
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "USD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "PLN"

    const-string v2, "z\u0142"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "CNY"

    const-string v2, "\u00a5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "EUR"

    const-string v2, "\u20ac"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "GBP"

    const-string v2, "\u00a3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "CHF"

    const-string v2, "Fr"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "RUB"

    const-string v2, "\u0440."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "RUR"

    const-string v2, "\u0440."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AUD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "SEK"

    const-string v2, "kr"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "DKK"

    const-string v2, "kr"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "HKD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "SGD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "THB"

    const-string v2, "\u0e3f"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "NZD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "JPY"

    const-string v2, "\u00a5"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BRL"

    const-string v2, "R$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "KRW"

    const-string v2, "\u20a9"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AFN"

    const-string v2, "\u060b"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "ALL"

    const-string v2, "L"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "DZD"

    const-string v2, "\u062f.\u062c"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AOA"

    const-string v2, "Kz"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "ARS"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AMD"

    const-string v2, "\u0564\u0580."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AWG"

    const-string v2, "\u0192"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "AZN"

    const-string v2, "m"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BSD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BHD"

    const-string v2, "\u0628.\u062f"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BDT"

    const-string v2, "\u09f3"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BBD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BYR"

    const-string v2, "Br"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BZD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BMD"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BTN"

    const-string v2, "Nu."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BOB"

    const-string v2, "Bs."

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BAM"

    const-string v2, "\u041a\u041c"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BWP"

    const-string v2, "P"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BND"

    const-string v2, "$"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BGN"

    const-string v2, "\u043b\u0432"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "BIF"

    const-string v2, "Fr"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "TRY"

    const-string v2, "TL"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "ZAR"

    const-string v2, "R"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    const-string v1, "IDR"

    const-string v2, "Rp"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
