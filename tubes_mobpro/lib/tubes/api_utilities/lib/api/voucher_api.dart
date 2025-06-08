//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class VoucherApi {
  VoucherApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /Voucher/checkVoucher/{code}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] code (required):
  Future<Response> voucherCheckVoucherCodeGetWithHttpInfo(String code,) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/checkVoucher/{code}'
      .replaceAll('{code}', code);

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
  /// * [String] code (required):
  Future<CheckVoucherDTO?> voucherCheckVoucherCodeGet(String code,) async {
    final response = await voucherCheckVoucherCodeGetWithHttpInfo(code,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CheckVoucherDTO',) as CheckVoucherDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Voucher/filtered' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] search:
  ///
  /// * [StatusVoucher] status:
  ///
  /// * [DateTime] start:
  ///
  /// * [DateTime] end:
  Future<Response> voucherFilteredGetWithHttpInfo({ String? search, StatusVoucher? status, DateTime? start, DateTime? end, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/filtered';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (start != null) {
      queryParams.addAll(_queryParams('', 'start', start));
    }
    if (end != null) {
      queryParams.addAll(_queryParams('', 'end', end));
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
  /// * [String] search:
  ///
  /// * [StatusVoucher] status:
  ///
  /// * [DateTime] start:
  ///
  /// * [DateTime] end:
  Future<List<Voucher>?> voucherFilteredGet({ String? search, StatusVoucher? status, DateTime? start, DateTime? end, }) async {
    final response = await voucherFilteredGetWithHttpInfo( search: search, status: status, start: start, end: end, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Voucher>') as List)
        .cast<Voucher>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'DELETE /Voucher/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> voucherGenericIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/generic/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
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
  Future<void> voucherGenericIdDelete(int id,) async {
    final response = await voucherGenericIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Voucher/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> voucherGenericIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/generic/{id}'
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
  Future<Voucher?> voucherGenericIdGet(int id,) async {
    final response = await voucherGenericIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Voucher',) as Voucher;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Voucher/getActive' operation and returns the [Response].
  Future<Response> voucherGetActiveGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/getActive';

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

  Future<List<Voucher>?> voucherGetActiveGet() async {
    final response = await voucherGetActiveGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Voucher>') as List)
        .cast<Voucher>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /Voucher/getByCode/{code}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] code (required):
  Future<Response> voucherGetByCodeCodeGetWithHttpInfo(String code,) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/getByCode/{code}'
      .replaceAll('{code}', code);

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
  /// * [String] code (required):
  Future<Voucher?> voucherGetByCodeCodeGet(String code,) async {
    final response = await voucherGetByCodeCodeGetWithHttpInfo(code,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Voucher',) as Voucher;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /Voucher/{idVoucher}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] idVoucher (required):
  ///
  /// * [PostVoucherDTO] postVoucherDTO:
  Future<Response> voucherIdVoucherPutWithHttpInfo(int idVoucher, { PostVoucherDTO? postVoucherDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher/{idVoucher}'
      .replaceAll('{idVoucher}', idVoucher.toString());

    // ignore: prefer_final_locals
    Object? postBody = postVoucherDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


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
  /// * [int] idVoucher (required):
  ///
  /// * [PostVoucherDTO] postVoucherDTO:
  Future<void> voucherIdVoucherPut(int idVoucher, { PostVoucherDTO? postVoucherDTO, }) async {
    final response = await voucherIdVoucherPutWithHttpInfo(idVoucher,  postVoucherDTO: postVoucherDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /Voucher' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PostVoucherDTO] postVoucherDTO:
  Future<Response> voucherPostWithHttpInfo({ PostVoucherDTO? postVoucherDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Voucher';

    // ignore: prefer_final_locals
    Object? postBody = postVoucherDTO;

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
  /// * [PostVoucherDTO] postVoucherDTO:
  Future<Voucher?> voucherPost({ PostVoucherDTO? postVoucherDTO, }) async {
    final response = await voucherPostWithHttpInfo( postVoucherDTO: postVoucherDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Voucher',) as Voucher;
    
    }
    return null;
  }
}
