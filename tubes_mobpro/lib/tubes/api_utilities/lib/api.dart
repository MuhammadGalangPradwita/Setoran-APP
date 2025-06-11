//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/avatar_api.dart';
part 'api/diskon_api.dart';
part 'api/mitra_api.dart';
part 'api/motor_api.dart';
part 'api/motor_image_api.dart';
part 'api/notifikasi_api.dart';
part 'api/pelanggan_api.dart';
part 'api/pembayaran_api.dart';
part 'api/pengguna_api.dart';
part 'api/react_api.dart';
part 'api/setoran_apinet_api.dart';
part 'api/storage_api.dart';
part 'api/transaksi_api.dart';
part 'api/ulasan_api.dart';
part 'api/voucher_api.dart';

part 'model/access_token_response.dart';
part 'model/check_voucher_dto.dart';
part 'model/dashboard_data_dto.dart';
part 'model/device_token.dart';
part 'model/diskon.dart';
part 'model/forgot_password_request.dart';
part 'model/get_notifikas_dto.dart';
part 'model/http_validation_problem_details.dart';
part 'model/info_request.dart';
part 'model/info_response.dart';
part 'model/login_request.dart';
part 'model/metode_pembayaran.dart';
part 'model/mitra.dart';
part 'model/mitra_motor_dto.dart';
part 'model/motor.dart';
part 'model/motor_form.dart';
part 'model/motor_image.dart';
part 'model/motor_table_dto.dart';
part 'model/notifikasi.dart';
part 'model/pelanggan.dart';
part 'model/pembayaran.dart';
part 'model/pengguna.dart';
part 'model/post_create_mitra_dto.dart';
part 'model/post_diskon_dto.dart';
part 'model/post_mitra_dto.dart';
part 'model/post_motor_image_dto.dart';
part 'model/post_notifikas_dto.dart';
part 'model/post_pelanggan_dto.dart';
part 'model/post_pembayaran_dto.dart';
part 'model/post_pengguna_dto.dart';
part 'model/post_transaksi_dto.dart';
part 'model/post_ulasan_dto.dart';
part 'model/post_voucher_dto.dart';
part 'model/put_diskon_dto.dart';
part 'model/put_motor_dto.dart';
part 'model/put_motor_image_dto.dart';
part 'model/put_pembayaran_dto.dart';
part 'model/refresh_request.dart';
part 'model/register_form.dart';
part 'model/register_request.dart';
part 'model/resend_confirmation_email_request.dart';
part 'model/reset_password_request.dart';
part 'model/status_diskon.dart';
part 'model/status_mitra.dart';
part 'model/status_motor.dart';
part 'model/status_pembayaran.dart';
part 'model/status_transaksi.dart';
part 'model/status_voucher.dart';
part 'model/target_navigasi.dart';
part 'model/transaksi.dart';
part 'model/transmisi_motor.dart';
part 'model/two_factor_request.dart';
part 'model/two_factor_response.dart';
part 'model/ulasan.dart';
part 'model/voucher.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
