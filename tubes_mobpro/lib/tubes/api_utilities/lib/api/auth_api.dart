//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /Auth/register' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RegisterForm] registerForm:
  Future<Response> authRegisterPostWithHttpInfo({ RegisterForm? registerForm, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Auth/register';

    // ignore: prefer_final_locals
    Object? postBody = registerForm;

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
  /// * [RegisterForm] registerForm:
  Future<void> authRegisterPost({ RegisterForm? registerForm, }) async {
    final response = await authRegisterPostWithHttpInfo( registerForm: registerForm, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
