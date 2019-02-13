.class public Lcom/mobnetic/coinguardian/config/MarketsConfig;
.super Ljava/lang/Object;
.source "MarketsConfig.java"


# static fields
.field public static final MARKETS:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mobnetic/coinguardian/model/Market;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    .line 17
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitstamp;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitstamp;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 18
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Btcchina;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Btcchina;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 19
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Btce;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Btce;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 20
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitcurex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitcurex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 21
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Mercado;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Mercado;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 22
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Kraken;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Kraken;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 23
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitfinex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 24
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Okcoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Okcoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 25
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Cryptsy;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Cryptsy;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 26
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinbase;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinbase;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 27
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Vircurex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 28
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Fxbtc;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Fxbtc;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 29
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bter;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bter;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 30
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Justcoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 31
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Btcturk;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Btcturk;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 32
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinse;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinse;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 33
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Campbx;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Campbx;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 34
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 35
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/TheRock;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/TheRock;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 36
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CexIO;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CexIO;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 37
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Virtex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Virtex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 38
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Huobi;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Huobi;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 39
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 40
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinMarketIO;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinMarketIO;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 41
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/McxNOW;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/McxNOW;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 42
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 43
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/MintPal;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/MintPal;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 44
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinJar;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinJar;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 45
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Poloniex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Poloniex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 46
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Winkdex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Winkdex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 47
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Anxpro;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Anxpro;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 48
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitX;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitX;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 49
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CCex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CCex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 50
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 51
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitorado;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitorado;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 52
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CryptoRush;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CryptoRush;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 53
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinDesk;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinDesk;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 54
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Koinim;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Koinim;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 55
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/FybSE;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/FybSE;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 56
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/FybSG;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/FybSG;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 57
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Prelude;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Prelude;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 58
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitKonan;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitKonan;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 59
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitTrex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitTrex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 60
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Comkort;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Comkort;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 61
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bit2c;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bit2c;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 62
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CryptoAltex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CryptoAltex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 63
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BtcMarkets;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BtcMarkets;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 64
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/SwissCex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/SwissCex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 65
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bleutrade;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bleutrade;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 66
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/ShareXcoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/ShareXcoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 67
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Unisend;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Unisend;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 68
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 69
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Korbit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Korbit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 70
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinTree;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinTree;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 71
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Cryptonit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Cryptonit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 72
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/LakeBTC;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/LakeBTC;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 73
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitMaszyna;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitMaszyna;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 74
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitCore;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitCore;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 75
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Zaydo;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Zaydo;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 76
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/AllCoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/AllCoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 77
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Ripio;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Ripio;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 78
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/DolarBlueNet;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/DolarBlueNet;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 79
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Basebit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Basebit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 80
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinSwap;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinSwap;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 81
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Paymium;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Paymium;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 82
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitso;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitso;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 83
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Cryptoine;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 84
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitcoinToYou;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitcoinToYou;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 85
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitexLa;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitexLa;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 86
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/ItBit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/ItBit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 87
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitcoinCoId;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitcoinCoId;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 88
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/HitBtc;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/HitBtc;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 89
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CleverCoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CleverCoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 90
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitBay;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitBay;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 91
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/FoxBit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/FoxBit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 92
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/QuadrigaCX;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/QuadrigaCX;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 93
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinMateIO;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinMateIO;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 94
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitMarket24PL;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitMarket24PL;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 95
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Buttercoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Buttercoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 96
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinTraderNet;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinTraderNet;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 97
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/LocalBitcoins;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/LocalBitcoins;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 98
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Cryptopia;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Cryptopia;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 99
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Igot;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Igot;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 100
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/SevenNineSix;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/SevenNineSix;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 101
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Mexbt;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Mexbt;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 102
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Vaultoro;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Vaultoro;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 103
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitxCom;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitxCom;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 104
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BtcBox;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BtcBox;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 105
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BtcXIndia;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BtcXIndia;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 106
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Uphold;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Uphold;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 107
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/YoBit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/YoBit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 108
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/ShapeShift;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/ShapeShift;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 109
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitoEX;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitoEX;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 110
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 112
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinSecure;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinSecure;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 113
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Dashcurex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 114
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Quoine;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Quoine;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 115
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Livecoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Livecoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 116
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Gemini;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Gemini;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 117
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinapult;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinapult;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 118
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Btc38;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Btc38;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 119
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/ETHEXIndia;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/ETHEXIndia;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 120
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/GateCoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/GateCoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 121
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Liqui;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Liqui;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 122
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/ChileBit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/ChileBit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 123
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/SurBitcoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/SurBitcoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 124
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/VBtc;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/VBtc;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 125
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Urdubit;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Urdubit;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 126
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/NegocieCoins;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/NegocieCoins;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 127
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitMEX;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitMEX;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 128
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitFlyer;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitFlyer;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 129
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitFlyerFX;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitFlyerFX;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 130
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinone;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinone;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 131
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bithumb;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 132
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinsph;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinsph;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 133
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bl3p;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bl3p;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 134
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/SurBtc;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/SurBtc;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 135
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinFloor;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinFloor;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 136
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Lykke;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Lykke;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 137
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinnest;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinnest;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 138
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Braziliex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Braziliex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 139
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Abucoins;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Abucoins;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 140
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Zebpay;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Zebpay;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 141
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Paribu;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Paribu;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 142
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/SatoshiTango;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/SatoshiTango;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 143
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Koinex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Koinex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 145
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BlinkTrade;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BlinkTrade;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 146
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Exmo;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Exmo;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 147
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Binance;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Binance;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 148
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Kucoin;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Kucoin;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 150
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/example/CryptoBridge;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/example/CryptoBridge;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 151
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BtcAlpha;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BtcAlpha;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 152
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Graviex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Graviex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 153
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/StockExchange;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/StockExchange;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 154
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Crex24;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Crex24;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 156
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/TrocaNinja;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/TrocaNinja;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 157
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Southxchange;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Southxchange;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 158
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Coinbene;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Coinbene;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 159
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/CoinExchange;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/CoinExchange;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 160
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/BitZ;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/BitZ;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 162
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Idax;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Idax;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 163
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Okex;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Okex;-><init>()V

    invoke-static {v0}, Lcom/mobnetic/coinguardian/config/MarketsConfig;->addMarket(Lcom/mobnetic/coinguardian/model/Market;)V

    .line 164
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final addMarket(Lcom/mobnetic/coinguardian/model/Market;)V
    .locals 2
    .param p0, "market"    # Lcom/mobnetic/coinguardian/model/Market;

    .prologue
    .line 13
    sget-object v0, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    return-void
.end method
