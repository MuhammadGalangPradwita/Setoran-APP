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
  /// * [Object] query:
  Future<Response> apiTransaksiGetWithHttpInfo({ Object? query, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Transaksi';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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
  /// * [Object] query:
  Future<void> apiTransaksiGet({ Object? query, }) async {
    final response = await apiTransaksiGetWithHttpInfo( query: query, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
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
  Future<void> apiTransaksiIdGet(int id,) async {
    final response = await apiTransaksiIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/Transaksi/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] status:
  Future<Response> apiTransaksiIdPutWithHttpInfo(int id, { String? status, }) async {
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
  /// * [String] status:
  Future<void> apiTransaksiIdPut(int id, { String? status, }) async {
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
