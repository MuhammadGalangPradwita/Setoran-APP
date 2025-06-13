# openapi.api.PembayaranApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiPembayaranGet**](PembayaranApi.md#apipembayaranget) | **GET** /api/Pembayaran | 
[**apiPembayaranIdGet**](PembayaranApi.md#apipembayaranidget) | **GET** /api/Pembayaran/{id} | 
[**apiPembayaranIdPut**](PembayaranApi.md#apipembayaranidput) | **PUT** /api/Pembayaran/{id} | 
[**apiPembayaranPost**](PembayaranApi.md#apipembayaranpost) | **POST** /api/Pembayaran | 
[**apiPembayaranTransaksiIdGet**](PembayaranApi.md#apipembayarantransaksiidget) | **GET** /api/Pembayaran/transaksi/{id} | 


# **apiPembayaranGet**
> List<Pembayaran> apiPembayaranGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PembayaranApi();

try {
    final result = api_instance.apiPembayaranGet();
    print(result);
} catch (e) {
    print('Exception when calling PembayaranApi->apiPembayaranGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Pembayaran>**](Pembayaran.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPembayaranIdGet**
> Pembayaran apiPembayaranIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PembayaranApi();
final id = 56; // int | 

try {
    final result = api_instance.apiPembayaranIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling PembayaranApi->apiPembayaranIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Pembayaran**](Pembayaran.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPembayaranIdPut**
> apiPembayaranIdPut(id, putPembayaranDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PembayaranApi();
final id = 56; // int | 
final putPembayaranDTO = PutPembayaranDTO(); // PutPembayaranDTO | 

try {
    api_instance.apiPembayaranIdPut(id, putPembayaranDTO);
} catch (e) {
    print('Exception when calling PembayaranApi->apiPembayaranIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **putPembayaranDTO** | [**PutPembayaranDTO**](PutPembayaranDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPembayaranPost**
> apiPembayaranPost(postPembayaranDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PembayaranApi();
final postPembayaranDTO = PostPembayaranDTO(); // PostPembayaranDTO | 

try {
    api_instance.apiPembayaranPost(postPembayaranDTO);
} catch (e) {
    print('Exception when calling PembayaranApi->apiPembayaranPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postPembayaranDTO** | [**PostPembayaranDTO**](PostPembayaranDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPembayaranTransaksiIdGet**
> Pembayaran apiPembayaranTransaksiIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PembayaranApi();
final id = 56; // int | 

try {
    final result = api_instance.apiPembayaranTransaksiIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling PembayaranApi->apiPembayaranTransaksiIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Pembayaran**](Pembayaran.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

