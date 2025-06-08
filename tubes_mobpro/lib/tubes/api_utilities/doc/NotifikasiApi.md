# openapi.api.NotifikasiApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notifikasiGenericIdDelete**](NotifikasiApi.md#notifikasigenericiddelete) | **DELETE** /Notifikasi/generic/{id} | 
[**notifikasiGenericIdGet**](NotifikasiApi.md#notifikasigenericidget) | **GET** /Notifikasi/generic/{id} | 
[**notifikasiGetPerUserGet**](NotifikasiApi.md#notifikasigetperuserget) | **GET** /Notifikasi/getPerUser | 
[**notifikasiReadIdPost**](NotifikasiApi.md#notifikasireadidpost) | **POST** /Notifikasi/read/{id} | 
[**notifikasiRegisterDevicePost**](NotifikasiApi.md#notifikasiregisterdevicepost) | **POST** /Notifikasi/registerDevice | 
[**notifikasiSendPost**](NotifikasiApi.md#notifikasisendpost) | **POST** /Notifikasi/send | 


# **notifikasiGenericIdDelete**
> notifikasiGenericIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();
final id = 56; // int | 

try {
    api_instance.notifikasiGenericIdDelete(id);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiGenericIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifikasiGenericIdGet**
> Notifikasi notifikasiGenericIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();
final id = 56; // int | 

try {
    final result = api_instance.notifikasiGenericIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiGenericIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Notifikasi**](Notifikasi.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifikasiGetPerUserGet**
> List<GetNotifikasDTO> notifikasiGetPerUserGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();

try {
    final result = api_instance.notifikasiGetPerUserGet();
    print(result);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiGetPerUserGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<GetNotifikasDTO>**](GetNotifikasDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifikasiReadIdPost**
> notifikasiReadIdPost(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();
final id = 56; // int | 

try {
    api_instance.notifikasiReadIdPost(id);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiReadIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifikasiRegisterDevicePost**
> notifikasiRegisterDevicePost(token)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();
final token = token_example; // String | 

try {
    api_instance.notifikasiRegisterDevicePost(token);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiRegisterDevicePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **notifikasiSendPost**
> notifikasiSendPost(postNotifikasDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotifikasiApi();
final postNotifikasDTO = PostNotifikasDTO(); // PostNotifikasDTO | 

try {
    api_instance.notifikasiSendPost(postNotifikasDTO);
} catch (e) {
    print('Exception when calling NotifikasiApi->notifikasiSendPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postNotifikasDTO** | [**PostNotifikasDTO**](PostNotifikasDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

