//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PenggunaApi {
  PenggunaApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /Pengguna/currentPengguna' operation and returns the [Response].
  Future<Response> penggunaCurrentPenggunaGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/currentPengguna';

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

  Future<Pengguna?> penggunaCurrentPenggunaGet() async {
    final response = await penggunaCurrentPenggunaGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Pengguna',) as Pengguna;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Pengguna/fromMitra' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] idMitra:
  Future<Response> penggunaFromMitraGetWithHttpInfo({ int? idMitra, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/fromMitra';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (idMitra != null) {
      queryParams.addAll(_queryParams('', 'idMitra', idMitra));
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
  /// * [int] idMitra:
  Future<Pengguna?> penggunaFromMitraGet({ int? idMitra, }) async {
    final response = await penggunaFromMitraGetWithHttpInfo( idMitra: idMitra, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Pengguna',) as Pengguna;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Pengguna/fromPelanggan' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] idPelanggan:
  Future<Response> penggunaFromPelangganGetWithHttpInfo({ int? idPelanggan, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/fromPelanggan';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (idPelanggan != null) {
      queryParams.addAll(_queryParams('', 'IdPelanggan', idPelanggan));
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
  /// * [int] idPelanggan:
  Future<Pengguna?> penggunaFromPelangganGet({ int? idPelanggan, }) async {
    final response = await penggunaFromPelangganGetWithHttpInfo( idPelanggan: idPelanggan, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Pengguna',) as Pengguna;
    
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /Pengguna/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> penggunaGenericIdDeleteWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/generic/{id}'
      .replaceAll('{id}', id);

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
  /// * [String] id (required):
  Future<void> penggunaGenericIdDelete(String id,) async {
    final response = await penggunaGenericIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /Pengguna/generic/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> penggunaGenericIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/generic/{id}'
      .replaceAll('{id}', id);

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
  /// * [String] id (required):
  Future<Pengguna?> penggunaGenericIdGet(String id,) async {
    final response = await penggunaGenericIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Pengguna',) as Pengguna;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /Pengguna/getAll' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [bool] withMitra:
  ///
  /// * [bool] withPelanggan:
  Future<Response> penggunaGetAllGetWithHttpInfo({ bool? withMitra, bool? withPelanggan, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/getAll';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (withMitra != null) {
      queryParams.addAll(_queryParams('', 'withMitra', withMitra));
    }
    if (withPelanggan != null) {
      queryParams.addAll(_queryParams('', 'withPelanggan', withPelanggan));
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
  /// * [bool] withMitra:
  ///
  /// * [bool] withPelanggan:
  Future<List<Pengguna>?> penggunaGetAllGet({ bool? withMitra, bool? withPelanggan, }) async {
    final response = await penggunaGetAllGetWithHttpInfo( withMitra: withMitra, withPelanggan: withPelanggan, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Pengguna>') as List)
        .cast<Pengguna>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /Pengguna/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  Future<Response> penggunaIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/{id}'
      .replaceAll('{id}', id);

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
  /// * [String] id (required):
  Future<Pengguna?> penggunaIdGet(String id,) async {
    final response = await penggunaIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Pengguna',) as Pengguna;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /Pengguna' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PostPenggunaDTO] postPenggunaDTO:
  Future<Response> penggunaPutWithHttpInfo({ PostPenggunaDTO? postPenggunaDTO, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna';

    // ignore: prefer_final_locals
    Object? postBody = postPenggunaDTO;

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
  /// * [PostPenggunaDTO] postPenggunaDTO:
  Future<void> penggunaPut({ PostPenggunaDTO? postPenggunaDTO, }) async {
    final response = await penggunaPutWithHttpInfo( postPenggunaDTO: postPenggunaDTO, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /Pengguna/updateProfileImage/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [MultipartFile] file:
  Future<Response> penggunaUpdateProfileImageIdPostWithHttpInfo(String id, { MultipartFile? file, }) async {
    // ignore: prefer_const_declarations
    final path = r'/Pengguna/updateProfileImage/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (file != null) {
      hasFields = true;
      mp.fields[r'file'] = file.field;
      mp.files.add(file);
    }
    if (hasFields) {
      postBody = mp;
    }

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
  /// * [String] id (required):
  ///
  /// * [MultipartFile] file:
  Future<String?> penggunaUpdateProfileImageIdPost(String id, { MultipartFile? file, }) async {
    final response = await penggunaUpdateProfileImageIdPostWithHttpInfo(id,  file: file, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }
}
