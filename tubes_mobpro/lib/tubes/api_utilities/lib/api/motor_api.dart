//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MotorApi {
  MotorApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/Motor' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [bool] withImage:
  ///
  /// * [bool] withDiskon:
  ///
  /// * [bool] withUlasan:
  ///
  /// * [String] idMitra:
  ///
  /// * [String] status:
  ///
  /// * [String] model:
  ///
  /// * [String] transmisi:
  Future<Response> apiMotorGetWithHttpInfo({ bool? withImage, bool? withDiskon, bool? withUlasan, String? idMitra, String? status, String? model, String? transmisi, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (withImage != null) {
      queryParams.addAll(_queryParams('', 'WithImage', withImage));
    }
    if (withDiskon != null) {
      queryParams.addAll(_queryParams('', 'WithDiskon', withDiskon));
    }
    if (withUlasan != null) {
      queryParams.addAll(_queryParams('', 'WithUlasan', withUlasan));
    }
    if (idMitra != null) {
      queryParams.addAll(_queryParams('', 'IdMitra', idMitra));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'Status', status));
    }
    if (model != null) {
      queryParams.addAll(_queryParams('', 'Model', model));
    }
    if (transmisi != null) {
      queryParams.addAll(_queryParams('', 'Transmisi', transmisi));
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
  /// * [bool] withImage:
  ///
  /// * [bool] withDiskon:
  ///
  /// * [bool] withUlasan:
  ///
  /// * [String] idMitra:
  ///
  /// * [String] status:
  ///
  /// * [String] model:
  ///
  /// * [String] transmisi:
  Future<List<Motor>?> apiMotorGet({ bool? withImage, bool? withDiskon, bool? withUlasan, String? idMitra, String? status, String? model, String? transmisi, }) async {
    final response = await apiMotorGetWithHttpInfo( withImage: withImage, withDiskon: withDiskon, withUlasan: withUlasan, idMitra: idMitra, status: status, model: model, transmisi: transmisi, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Motor>') as List)
        .cast<Motor>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /api/Motor/{id}/diskons' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiMotorIdDiskonsGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor/{id}/diskons'
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
  Future<List<Diskon>?> apiMotorIdDiskonsGet(int id,) async {
    final response = await apiMotorIdDiskonsGetWithHttpInfo(id,);
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

  /// Performs an HTTP 'GET /api/Motor/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiMotorIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor/{id}'
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
  Future<Motor?> apiMotorIdGet(int id,) async {
    final response = await apiMotorIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Motor',) as Motor;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/Motor/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [PutMotorDTO] putMotorDTO:
  Future<Response> apiMotorIdPutWithHttpInfo(int id, { PutMotorDTO? putMotorDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = putMotorDTO;

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
  /// * [int] id (required):
  ///
  /// * [PutMotorDTO] putMotorDTO:
  Future<void> apiMotorIdPut(int id, { PutMotorDTO? putMotorDTO, }) async {
    final response = await apiMotorIdPutWithHttpInfo(id,  putMotorDTO: putMotorDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/Motor/{id}/ulasans' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiMotorIdUlasansGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor/{id}/ulasans'
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
  Future<List<Ulasan>?> apiMotorIdUlasansGet(int id,) async {
    final response = await apiMotorIdUlasansGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Ulasan>') as List)
        .cast<Ulasan>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'POST /api/Motor' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [MotorForm] motorForm:
  Future<Response> apiMotorPostWithHttpInfo({ MotorForm? motorForm, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/Motor';

    // ignore: prefer_final_locals
    Object? postBody = motorForm;

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
  /// * [MotorForm] motorForm:
  Future<Motor?> apiMotorPost({ MotorForm? motorForm, }) async {
    final response = await apiMotorPostWithHttpInfo( motorForm: motorForm, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Motor',) as Motor;
    
    }
    return null;
  }
}
