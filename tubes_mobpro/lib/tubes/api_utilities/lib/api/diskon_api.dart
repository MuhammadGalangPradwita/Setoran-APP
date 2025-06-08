//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DiskonApi {
  DiskonApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'DELETE /Diskon/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> diskonGenericIdDeleteWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Diskon/generic/{id}'
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
  Future<void> diskonGenericIdDelete(int id,) async {
    final response = await diskonGenericIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Diskon/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> diskonGenericIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Diskon/generic/{id}'
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
  Future<Diskon?> diskonGenericIdGet(int id,) async {
    final response = await diskonGenericIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Diskon',) as Diskon;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Diskon/getAll' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [bool] withMotor:
  Future<Response> diskonGetAllGetWithHttpInfo({ bool? withMotor, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Diskon/getAll';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (withMotor != null) {
      queryParams.addAll(_queryParams('', 'withMotor', withMotor));
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
  /// * [bool] withMotor:
  Future<List<Diskon>?> diskonGetAllGet({ bool? withMotor, }) async {
    final response = await diskonGetAllGetWithHttpInfo( withMotor: withMotor, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Diskon>') as List)
        .cast<Diskon>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'POST /Diskon' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PostDiskonDTO] postDiskonDTO:
  Future<Response> diskonPostWithHttpInfo({ PostDiskonDTO? postDiskonDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Diskon';

    // ignore: prefer_final_locals
    Object? postBody = postDiskonDTO;

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
  /// * [PostDiskonDTO] postDiskonDTO:
  Future<Diskon?> diskonPost({ PostDiskonDTO? postDiskonDTO, }) async {
    final response = await diskonPostWithHttpInfo( postDiskonDTO: postDiskonDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Diskon',) as Diskon;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /Diskon' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PutDiskonDTO] putDiskonDTO:
  Future<Response> diskonPutWithHttpInfo({ PutDiskonDTO? putDiskonDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Diskon';

    // ignore: prefer_final_locals
    Object? postBody = putDiskonDTO;

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
  /// * [PutDiskonDTO] putDiskonDTO:
  Future<void> diskonPut({ PutDiskonDTO? putDiskonDTO, }) async {
    final response = await diskonPutWithHttpInfo( putDiskonDTO: putDiskonDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
