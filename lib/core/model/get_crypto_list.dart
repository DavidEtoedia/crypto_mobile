// To parse this JSON data, do
//
//     final cryptoListRes = cryptoListResFromJson(jsonString);

import 'dart:convert';

List<CryptoListRes> cryptoListResFromJson(List<dynamic> str) =>
    List<CryptoListRes>.from(str.map((x) => CryptoListRes.fromJson(x)));

String cryptoListResToJson(List<CryptoListRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoListRes {
  CryptoListRes({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
  });

  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  int fullyDilutedValuation;
  double totalVolume;
  double high24H;
  double low24H;
  double priceChange24H;
  double priceChangePercentage24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  double circulatingSupply;
  double totalSupply;
  double maxSupply;
  double ath;
  double athChangePercentage;
  DateTime athDate;
  double atl;
  double atlChangePercentage;
  DateTime atlDate;
  Roi? roi;
  DateTime lastUpdated;

  factory CryptoListRes.fromJson(Map<String, dynamic> json) => CryptoListRes(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"] == null
            ? null
            : json["current_price"].toDouble(),
        marketCap: json["market_cap"] == null ? null : json["market_cap"],
        marketCapRank:
            json["market_cap_rank"] == null ? null : json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"] == null
            ? null
            : json["fully_diluted_valuation"],
        totalVolume: json["total_volume"] == null
            ? null
            : json["total_volume"].toDouble(),
        high24H: json["high_24h"] == null ? null : json["high_24h"].toDouble(),
        low24H: json["low_24h"] == null ? null : json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"] == null
            ? null
            : json["price_change_24h"].toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"] == null
            ? null
            : json["price_change_percentage_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"] == null
            ? null
            : json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"] == null
                ? null
                : json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"] == null
            ? null
            : json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? null
            : json["total_supply"].toDouble(),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        ath: json["ath"] == null ? null : json["ath"].toDouble(),
        athChangePercentage: json["ath_change_percentage"] == null
            ? null
            : json["ath_change_percentage"].toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"] == null ? null : json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"] == null
            ? null
            : json["atl_change_percentage"].toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
        roi: json["roi"] == null ? null : Roi.fromJson(json["roi"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice == null ? null : currentPrice,
        "market_cap": marketCap == null ? null : marketCap,
        "market_cap_rank": marketCapRank == null ? null : marketCapRank,
        "fully_diluted_valuation":
            fullyDilutedValuation == null ? null : fullyDilutedValuation,
        "total_volume": totalVolume == null ? null : totalVolume,
        "high_24h": high24H == null ? null : high24H,
        "low_24h": low24H == null ? null : low24H,
        "price_change_24h": priceChange24H == null ? null : priceChange24H,
        "price_change_percentage_24h":
            priceChangePercentage24H == null ? null : priceChangePercentage24H,
        "market_cap_change_24h":
            marketCapChange24H == null ? null : marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H == null
            ? null
            : marketCapChangePercentage24H,
        "circulating_supply":
            circulatingSupply == null ? null : circulatingSupply,
        "total_supply": totalSupply == null ? null : totalSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "ath": ath == null ? null : ath,
        "ath_change_percentage":
            athChangePercentage == null ? null : athChangePercentage,
        "ath_date": athDate.toIso8601String(),
        "atl": atl == null ? null : atl,
        "atl_change_percentage":
            atlChangePercentage == null ? null : atlChangePercentage,
        "atl_date": atlDate.toIso8601String(),
        "roi": roi == null ? null : roi?.toJson(),
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Roi {
  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  double times;
  Currency? currency;
  double percentage;

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: json["times"] == null ? null : json["times"].toDouble(),
        currency: currencyValues.map[json["currency"]],
        percentage:
            json["percentage"] == null ? null : json["percentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "times": times == null ? null : times,
        "currency": currencyValues.reverse[currency],
        "percentage": percentage == null ? null : percentage,
      };
}

enum Currency { BTC, USD, ETH }

final currencyValues =
    EnumValues({"btc": Currency.BTC, "eth": Currency.ETH, "usd": Currency.USD});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
