//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SetoranAPINETApi {
  SetoranAPINETApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /forgotPassword' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ForgotPasswordRequest] forgotPasswordRequest (required):
  Future<Response> forgotPasswordPostWithHttpInfo(ForgotPasswordRequest forgotPasswordRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/forgotPassword';

    // ignore: prefer_final_locals
    Object? postBody = forgotPasswordRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [ForgotPasswordRequest] forgotPasswordRequest (required):
  Future<void> forgotPasswordPost(ForgotPasswordRequest forgotPasswordRequest,) async {
    final response = await forgotPasswordPostWithHttpInfo(forgotPasswordRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /login' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  ///
  /// * [bool] useCookies:
  ///
  /// * [bool] useSessionCookies:
  Future<Response> loginPostWithHttpInfo(LoginRequest loginRequest, { bool? useCookies, bool? useSessionCookies, }) async {
    // ignore: prefer_const_declarations
    final path = r'/login';

    // ignore: prefer_final_locals
    Object? postBody = loginRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (useCookies != null) {
      queryParams.addAll(_queryParams('', 'useCookies', useCookies));
    }
    if (useSessionCookies != null) {
      queryParams.addAll(_queryParams('', 'useSessionCookies', useSessionCookies));
    }

    const contentTypes = <String>['application/json'];


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
  /// * [LoginRequest] loginRequest (required):
  ///
  /// * [bool] useCookies:
  ///
  /// * [bool] useSessionCookies:
  Future<AccessTokenResponse?> loginPost(LoginRequest loginRequest, { bool? useCookies, bool? useSessionCookies, }) async {
    final response = await loginPostWithHttpInfo(loginRequest,  useCookies: useCookies, useSessionCookies: useSessionCookies, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AccessTokenResponse',) as AccessTokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /manage/2fa' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [TwoFactorRequest] twoFactorRequest (required):
  Future<Response> manage2faPostWithHttpInfo(TwoFactorRequest twoFactorRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/manage/2fa';

    // ignore: prefer_final_locals
    Object? postBody = twoFactorRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [TwoFactorRequest] twoFactorRequest (required):
  Future<TwoFactorResponse?> manage2faPost(TwoFactorRequest twoFactorRequest,) async {
    final response = await manage2faPostWithHttpInfo(twoFactorRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'TwoFactorResponse',) as TwoFactorResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /manage/info' operation and returns the [Response].
  Future<Response> manageInfoGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/manage/info';

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

  Future<InfoResponse?> manageInfoGet() async {
    final response = await manageInfoGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'InfoResponse',) as InfoResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /manage/info' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [InfoRequest] infoRequest (required):
  Future<Response> manageInfoPostWithHttpInfo(InfoRequest infoRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/manage/info';

    // ignore: prefer_final_locals
    Object? postBody = infoRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [InfoRequest] infoRequest (required):
  Future<InfoResponse?> manageInfoPost(InfoRequest infoRequest,) async {
    final response = await manageInfoPostWithHttpInfo(infoRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'InfoResponse',) as InfoResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /confirmEmail' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] code (required):
  ///
  /// * [String] changedEmail:
  Future<Response> mapIdentityApiConfirmEmailWithHttpInfo(String userId, String code, { String? changedEmail, }) async {
    // ignore: prefer_const_declarations
    final path = r'/confirmEmail';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'userId', userId));
      queryParams.addAll(_queryParams('', 'code', code));
    if (changedEmail != null) {
      queryParams.addAll(_queryParams('', 'changedEmail', changedEmail));
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
  /// * [String] userId (required):
  ///
  /// * [String] code (required):
  ///
  /// * [String] changedEmail:
  Future<void> mapIdentityApiConfirmEmail(String userId, String code, { String? changedEmail, }) async {
    final response = await mapIdentityApiConfirmEmailWithHttpInfo(userId, code,  changedEmail: changedEmail, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /refresh' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RefreshRequest] refreshRequest (required):
  Future<Response> refreshPostWithHttpInfo(RefreshRequest refreshRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/refresh';

    // ignore: prefer_final_locals
    Object? postBody = refreshRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [RefreshRequest] refreshRequest (required):
  Future<AccessTokenResponse?> refreshPost(RefreshRequest refreshRequest,) async {
    final response = await refreshPostWithHttpInfo(refreshRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AccessTokenResponse',) as AccessTokenResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /register' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RegisterRequest] registerRequest (required):
  Future<Response> registerPostWithHttpInfo(RegisterRequest registerRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/register';

    // ignore: prefer_final_locals
    Object? postBody = registerRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [RegisterRequest] registerRequest (required):
  Future<void> registerPost(RegisterRequest registerRequest,) async {
    final response = await registerPostWithHttpInfo(registerRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /resendConfirmationEmail' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ResendConfirmationEmailRequest] resendConfirmationEmailRequest (required):
  Future<Response> resendConfirmationEmailPostWithHttpInfo(ResendConfirmationEmailRequest resendConfirmationEmailRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/resendConfirmationEmail';

    // ignore: prefer_final_locals
    Object? postBody = resendConfirmationEmailRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [ResendConfirmationEmailRequest] resendConfirmationEmailRequest (required):
  Future<void> resendConfirmationEmailPost(ResendConfirmationEmailRequest resendConfirmationEmailRequest,) async {
    final response = await resendConfirmationEmailPostWithHttpInfo(resendConfirmationEmailRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /resetPassword' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ResetPasswordRequest] resetPasswordRequest (required):
  Future<Response> resetPasswordPostWithHttpInfo(ResetPasswordRequest resetPasswordRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/resetPassword';

    // ignore: prefer_final_locals
    Object? postBody = resetPasswordRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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
  /// * [ResetPasswordRequest] resetPasswordRequest (required):
  Future<void> resetPasswordPost(ResetPasswordRequest resetPasswordRequest,) async {
    final response = await resetPasswordPostWithHttpInfo(resetPasswordRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
