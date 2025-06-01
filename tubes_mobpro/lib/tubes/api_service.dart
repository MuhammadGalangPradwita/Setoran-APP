import 'package:http/http.dart' as http;
import 'api_utilities/lib/api.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart'; // for dotenv

class ApiService {
  static final ApiService _instance = ApiService._internal();

  late ApiClient _apiClient;

  late SetoranAPINETApi setoranAPi;
  late AuthApi authApi;
  late MotorApi motorApi;
  late VoucherApi voucherApi;
  late PenggunaApi penggunaApi;
  late PelangganApi pelangganApi;
  late NotifikasiApi notifikasiApi;
  late TransaksiApi transaksiApi;
  late PembayaranApi pembayaranApi;
  late StorageApi storageApi;
  late DiskonApi diskonApi;
  late MitraApi mitraApi;
  late UlasanApi ulasanApi;
  late AvatarApi avatarApi;
  late MotorImageApi motorImageApi;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    // final basePath = dotenv.env['BACKEND_HOST'] ?? 'http://160.19.167.222:5104/';
    final basePath = 'http://160.19.167.222:5103';
    // final basePath = "http://localhost:5104";
    _apiClient = ApiClient(
      basePath: basePath,
      authentication: HttpBearerAuth()
        ..accessToken = () => localStorage.getItem("access_token") ?? "",
    );
    _createApis();
  }

  void _createApis() {
    setoranAPi = SetoranAPINETApi(_apiClient);
    authApi = AuthApi(_apiClient);
    motorApi = MotorApi(_apiClient);
    voucherApi = VoucherApi(_apiClient);
    penggunaApi = PenggunaApi(_apiClient);
    pelangganApi = PelangganApi(_apiClient);
    notifikasiApi = NotifikasiApi(_apiClient);
    transaksiApi = TransaksiApi(_apiClient);
    pembayaranApi = PembayaranApi(_apiClient);
    storageApi = StorageApi(_apiClient);
    diskonApi = DiskonApi(_apiClient);
    mitraApi = MitraApi(_apiClient);
    ulasanApi = UlasanApi(_apiClient);
    avatarApi = AvatarApi(_apiClient);
    motorImageApi = MotorImageApi(_apiClient);
  }

  void setToken(String token) {
    localStorage.setItem("access_token", token);
  }

  void removeToken() {
    localStorage.setItem("access_token", "");
  }
}

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}
