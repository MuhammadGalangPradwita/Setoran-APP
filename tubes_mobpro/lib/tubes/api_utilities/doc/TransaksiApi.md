# openapi.api.TransaksiApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiTransaksiGet**](TransaksiApi.md#apitransaksiget) | **GET** /api/Transaksi | 
[**apiTransaksiIdGet**](TransaksiApi.md#apitransaksiidget) | **GET** /api/Transaksi/{id} | 
[**apiTransaksiIdPut**](TransaksiApi.md#apitransaksiidput) | **PUT** /api/Transaksi/{id} | 
[**apiTransaksiPost**](TransaksiApi.md#apitransaksipost) | **POST** /api/Transaksi | 


# **apiTransaksiGet**
> List<Transaksi> apiTransaksiGet(idMotor, idPelanggan, idMitra, status)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransaksiApi();
final idMotor = idMotor_example; // String | 
final idPelanggan = idPelanggan_example; // String | 
final idMitra = idMitra_example; // String | 
final status = ; // StatusTransaksi | 

try {
    final result = api_instance.apiTransaksiGet(idMotor, idPelanggan, idMitra, status);
    print(result);
} catch (e) {
    print('Exception when calling TransaksiApi->apiTransaksiGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idMotor** | **String**|  | [optional] 
 **idPelanggan** | **String**|  | [optional] 
 **idMitra** | **String**|  | [optional] 
 **status** | [**StatusTransaksi**](.md)|  | [optional] 

### Return type

[**List<Transaksi>**](Transaksi.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTransaksiIdGet**
> Transaksi apiTransaksiIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransaksiApi();
final id = 56; // int | 

try {
    final result = api_instance.apiTransaksiIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling TransaksiApi->apiTransaksiIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Transaksi**](Transaksi.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTransaksiIdPut**
> apiTransaksiIdPut(id, status)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransaksiApi();
final id = 56; // int | 
final status = ; // StatusTransaksi | 

try {
    api_instance.apiTransaksiIdPut(id, status);
} catch (e) {
    print('Exception when calling TransaksiApi->apiTransaksiIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **status** | [**StatusTransaksi**](.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiTransaksiPost**
> apiTransaksiPost(postTransaksiDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = TransaksiApi();
final postTransaksiDTO = PostTransaksiDTO(); // PostTransaksiDTO | 

try {
    api_instance.apiTransaksiPost(postTransaksiDTO);
} catch (e) {
    print('Exception when calling TransaksiApi->apiTransaksiPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postTransaksiDTO** | [**PostTransaksiDTO**](PostTransaksiDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

