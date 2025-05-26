# openapi.api.PenggunaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**penggunaCurrentPenggunaGet**](PenggunaApi.md#penggunacurrentpenggunaget) | **GET** /Pengguna/currentPengguna | 
[**penggunaFromMitraGet**](PenggunaApi.md#penggunafrommitraget) | **GET** /Pengguna/fromMitra | 
[**penggunaGenericIdDelete**](PenggunaApi.md#penggunagenericiddelete) | **DELETE** /Pengguna/generic/{id} | 
[**penggunaGenericIdGet**](PenggunaApi.md#penggunagenericidget) | **GET** /Pengguna/generic/{id} | 
[**penggunaGetAllGet**](PenggunaApi.md#penggunagetallget) | **GET** /Pengguna/getAll | 
[**penggunaIdGet**](PenggunaApi.md#penggunaidget) | **GET** /Pengguna/{id} | 
[**penggunaPut**](PenggunaApi.md#penggunaput) | **PUT** /Pengguna | 


# **penggunaCurrentPenggunaGet**
> Pengguna penggunaCurrentPenggunaGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();

try {
    final result = api_instance.penggunaCurrentPenggunaGet();
    print(result);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaCurrentPenggunaGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Pengguna**](Pengguna.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaFromMitraGet**
> Pengguna penggunaFromMitraGet(idMitra)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final idMitra = 56; // int | 

try {
    final result = api_instance.penggunaFromMitraGet(idMitra);
    print(result);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaFromMitraGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idMitra** | **int**|  | [optional] 

### Return type

[**Pengguna**](Pengguna.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaGenericIdDelete**
> penggunaGenericIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final id = id_example; // String | 

try {
    api_instance.penggunaGenericIdDelete(id);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaGenericIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaGenericIdGet**
> Pengguna penggunaGenericIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final id = id_example; // String | 

try {
    final result = api_instance.penggunaGenericIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaGenericIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Pengguna**](Pengguna.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaGetAllGet**
> List<Pengguna> penggunaGetAllGet(withMitra, withPelanggan)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final withMitra = true; // bool | 
final withPelanggan = true; // bool | 

try {
    final result = api_instance.penggunaGetAllGet(withMitra, withPelanggan);
    print(result);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaGetAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **withMitra** | **bool**|  | [optional] [default to false]
 **withPelanggan** | **bool**|  | [optional] [default to false]

### Return type

[**List<Pengguna>**](Pengguna.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaIdGet**
> Pengguna penggunaIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final id = id_example; // String | 

try {
    final result = api_instance.penggunaIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Pengguna**](Pengguna.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **penggunaPut**
> penggunaPut(postPenggunaDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PenggunaApi();
final postPenggunaDTO = PostPenggunaDTO(); // PostPenggunaDTO | 

try {
    api_instance.penggunaPut(postPenggunaDTO);
} catch (e) {
    print('Exception when calling PenggunaApi->penggunaPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postPenggunaDTO** | [**PostPenggunaDTO**](PostPenggunaDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

