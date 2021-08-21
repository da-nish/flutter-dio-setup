import 'package:dio/dio.dart';

class UserApi {
  UserApi(this.dio);

  final Dio dio;

  set token(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  Future<dynamic> getSingleUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    Response userData = await dio.get(
      '/users/2',
    );

    // Prints the raw data returned by the server
    print('User Info: ${userData.data}');

    return userData.data;
  }

/*   Future<UserDetails> userDetails() async => UserDetails.fromJson(
      (await dio.get("User/details")).data as Map<String, dynamic>);

  Future<List<OpenPositionDTO>> openPositions() async =>
      ((await dio.get("Client/openorders")).data as List<dynamic>)
          .map((json) => OpenPositionDTO.fromJson(json))
          .toList();

  Future<List<FilledTradeDTO>> filledTrades(DateTime from, DateTime to) async =>
      ((await dio.get(
                  "Client/filledtrades/${(from.millisecondsSinceEpoch / 1000).round()}/${(to.millisecondsSinceEpoch / 1000).round()}"))
              .data as List<dynamic>)
          .map((json) => FilledTradeDTO.fromJson(json))
          .toList();

  Future<List<TradePositionDTO>> tradePositions() async =>
      ((await dio.get("Client/tradepositions")).data as List<dynamic>)
          .map((json) => TradePositionDTO.fromJson(json))
          .toList();

  Future<List<Symbol>> symbols() async =>
      ((await dio.get("Symbol")).data as List<dynamic>)
          .map((json) => Symbol.fromJson(json))
          .toList();

  Future<void> marketOrder(CreatePositionDTO dto) async =>
      (await dio.post("Trading/order/marketorder", data: dto.toJson()));

  Future<void> limitOrder(CreateOrderDTO dto) async =>
      (await dio.post("Trading/order/limitorder", data: dto.toJson()));

  Future<void> stopOrder(CreateOrderDTO dto) async =>
      (await dio.post("Trading/order/stoporder", data: dto.toJson()));

  Future<void> cancelOrder(CancelOrderDTO dto) async =>
      (await dio.delete("Trading/order/cancelorder", data: dto.toJson()));

  Future<void> updateOrder(UpdateOrderDTO dto) async =>
      (await dio.put("/Trading/order/replaceorder", data: dto.toJson()));

  Future<List<PlayerAsset>> football() async =>
      ((await dio.get("FootballAsset")).data as List<dynamic>)
          .map((json) => PlayerAsset.fromJson(json))
          .toList();

  Future<PlayerAssetDetail> footballDetailed(String assetCode) async =>
      PlayerAssetDetail.fromJson((await dio
              .get("FootballAsset/${Uri.encodeQueryComponent(assetCode)}"))
          .data as Map<String, dynamic>);

  Future<AccountInfoDTO> accountInfo() async => AccountInfoDTO.fromJson(
      (await dio.post("User/accountinfo")).data as Map<String, dynamic>);

  Future<List<PlayerAsset>> watchlist() async =>
      ((await dio.get("WatchList")).data as List<dynamic>)
          .map((json) => PlayerAsset.fromJson(json))
          .toList();

  Future<List<New>> news(int count) async =>
      ((await dio.get("/SocialMediaNews?count=$count")).data as List<dynamic>)
          .map((json) => New.fromJson(json))
          .toList();

  Future<List<TradeNew>> tradeNews(int days, int count) async =>
      ((await dio.get("/Trading/markettrades?days=$days&count=$count")).data
              as List<dynamic>)
          .map((json) => TradeNew.fromJson(json))
          .toList();

  Future<List<New>> newsByAssetCode(String assetCode, int count) async =>
      ((await dio.get(
                  "/SocialMediaNews/${Uri.encodeQueryComponent(assetCode)}?count=$count"))
              .data as List<dynamic>)
          .map((json) => New.fromJson(json))
          .toList();

  Future<void> addToWatchlist(String assetCode) async =>
      (await dio.post("WatchList/add/${Uri.encodeQueryComponent(assetCode)}"));

  Future<void> removeFromWatchlist(String assetCode) async => (await dio
      .delete("WatchList/remove/${Uri.encodeQueryComponent(assetCode)}"));

  Future<String> requestTwoFACode() async =>
      (((await dio.get("/User/security/twofactor/code")).data
          as Map<String, dynamic>)["tfaSid"]);

  Future<void> enable2FA(String sid, String code) =>
      dio.post("/User/security/twofactor/enable",
          data: {"tfaSid": sid, "code": code});

  Future<void> disable2FA() => dio.post("/User/security/twofactor/disable");

  Future<List<FixtureAssets>> fixturesDetails(int count) async =>
      ((await dio.get("Fixtures/football/upcomingFixtures?count=$count")).data
              as List<dynamic>)
          .map((json) => FixtureAssets.fromJson(json))
          .toList();

  Future<PlayersByMatchId> footballByMatchId(String matchId) async =>
      PlayersByMatchId.fromJson(
          (await dio.get("/Fixtures/football/getAssetsByMatch/$matchId")).data
              as Map<String, dynamic>);

  Future<List<PlayerSearch>> playerSearch(String searchTerm) async =>
      ((await dio.get("/Search/asset/$searchTerm")).data as List<dynamic>)
          .map((json) => PlayerSearch.fromJson(json))
          .toList();

  Future<PlayerAsset> playerInfo(String assetcode) async {
    return PlayerAsset.fromJson((await dio
        .get("/FootballAsset/${Uri.encodeQueryComponent(assetcode)}")
        .then((value) {
      return jsonDecode(value.toString())['asset'];
    })) as Map<String, dynamic>);
  }

  Future<TrendingPlayer> trendingplayerInfo() async {
    return TrendingPlayer.fromJson(
        (await dio.get("/FootballAsset/trendingplayer").then((value) {
      return jsonDecode(value.toString());
    })) as Map<String, dynamic>);
  }

  Future<List<PlayerSearch>> ticker() async =>
      ((await dio.get("/Ticker")).data as List<dynamic>)
          .map((json) => PlayerSearch.fromJson(json))
          .toList();

  Future<List<CompetitionTeam>> getTeamsByCompetition(
          String competition) async =>
      ((await dio.get("/FootballAsset/leagues/$competition/teams")).data
              as List<dynamic>)
          .map((json) => CompetitionTeam.fromJson(json))
          .toList();

  Future<
      List<
          PlayerAsset>> getAssetByTeam(String assetTeam) async => ((await dio.get(
              "/FootballAsset/team/${Uri.encodeQueryComponent(assetTeam)}/players"))
          .data as List<dynamic>)
      .map((json) => PlayerAsset.fromJson(json))
      .toList();

  Future<List<TraditionAsset>> getTraditionalAsset(String group) async {
    return ((await dio.get("/TraditionalAsset/$group")).data as List<dynamic>)
        .map((json) => TraditionAsset.fromJson(json))
        .toList();
  }

  Future<TraditionAsset> getFinancialSymbolAPI(String symbol) async {
    return TraditionAsset.fromJson(
        (await dio.get("/Symbol/$symbol")).data as Map<String, dynamic>);
  }

  Future<Map> refreshToken(access_token, refresh_token) async {
    var val = (((await dio.post("/Token",
        data: {'accessToken': access_token, 'refreshToken': refresh_token}))));
// .data as Map<String, dynamic>
    print(val.statusCode);
    if (val.statusCode == 200) {
      return val.data as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<List<CountryModel>> getCountries() async {
    return ((await dio.get("/Countries")).data as List<dynamic>)
        .map((json) => CountryModel.fromJson(json))
        .toList();
  }

  Future<Map<String, dynamic>> praxisTokenApi() async {
    var res = (((await dio.get("/Praxis")).data as Map<String, dynamic>));
    print('>>>> $res');
    return res;
  } */
}
