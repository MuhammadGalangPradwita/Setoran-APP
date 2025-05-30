//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MotorImageApi {
  MotorImageApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/MotorImage/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> apiMotorImageIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/MotorImage/{id}'
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
  Future<MotorImage?> apiMotorImageIdGet(int id,) async {
    final response = await apiMotorImageIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MotorImage',) as MotorImage;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/MotorImage' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PostMotorImageDTO] postMotorImageDTO:
  Future<Response> apiMotorImagePostWithHttpInfo({ PostMotorImageDTO? postMotorImageDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/MotorImage';

    // ignore: prefer_final_locals
    Object? postBody = postMotorImageDTO;

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
  /// * [PostMotorImageDTO] postMotorImageDTO:
  Future<MotorImage?> apiMotorImagePost({ PostMotorImageDTO? postMotorImageDTO, }) async {
    final response = await apiMotorImagePostWithHttpInfo( postMotorImageDTO: postMotorImageDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MotorImage',) as MotorImage;
    
    }
    return null;
  }
}
