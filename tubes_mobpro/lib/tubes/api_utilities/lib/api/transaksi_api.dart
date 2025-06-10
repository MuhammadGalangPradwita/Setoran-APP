//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TransaksiApi {
  TransaksiApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Transaksi' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] idMotor:
  ///
  /// * [String] idPelanggan:
  ///
  /// * [String] idMitra:
  ///
  /// * [StatusTransaksi] status:
  Future<Response> apiTransaksiGetWithHttpInfo({ String? idMotor, String? idPelanggan, String? idMitra, StatusTransaksi? status, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Transaksi';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (idMotor != null) {
      queryParams.addAll(_queryParams('', 'IdMotor', idMotor));
    }
    if (idPelanggan != null) {
      queryParams.addAll(_queryParams('', 'IdPelanggan', idPelanggan));
    }
    if (idMitra != null) {
      queryParams.addAll(_queryParams('', 'IdMitra', idMitra));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'Status', status));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] idMotor:
  ///
  /// * [String] idPelanggan:
  ///
  /// * [String] idMitra:
  ///
  /// * [StatusTransaksi] status:
  Future<List<Transaksi>?> apiTransaksiGet({ String? idMotor, String? idPelanggan, String? idMitra, StatusTransaksi? status, }) async {
    final response = await apiTransaksiGetWithHttpInfo( idMotor: idMotor, idPelanggan: idPelanggan, idMitra: idMitra, status: status, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Transaksi>') as List)
        .cast<Transaksi>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Transaksi/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiTransaksiIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Transaksi/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Transaksi?> apiTransaksiIdGet(int id,) async {
    final response = await apiTransaksiIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Transaksi',) as Transaksi;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/Transaksi/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [StatusTransaksi] status:
  Future<Response> apiTransaksiIdPutWithHttpInfo(int id, { StatusTransaksi? status, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Transaksi/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [StatusTransaksi] status:
  Future<void> apiTransaksiIdPut(int id, { StatusTransaksi? status, }) async {
    final response = await apiTransaksiIdPutWithHttpInfo(id,  status: status, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/Transaksi' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PostTransaksiDTO] postTransaksiDTO:
  Future<Response> apiTransaksiPostWithHttpInfo({ PostTransaksiDTO? postTransaksiDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Transaksi';

    // ignore: prefer_final_locals
    Object? postBody = postTransaksiDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PostTransaksiDTO] postTransaksiDTO:
  Future<void> apiTransaksiPost({ PostTransaksiDTO? postTransaksiDTO, }) async {
    final response = await apiTransaksiPostWithHttpInfo( postTransaksiDTO: postTransaksiDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
