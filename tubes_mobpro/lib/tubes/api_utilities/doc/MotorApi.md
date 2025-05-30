# openapi.api.MotorApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMotorGet**](MotorApi.md#apimotorget) | **GET** /api/Motor | 
[**apiMotorIdGet**](MotorApi.md#apimotoridget) | **GET** /api/Motor/{id} | 
[**apiMotorIdPut**](MotorApi.md#apimotoridput) | **PUT** /api/Motor/{id} | 
[**apiMotorIdUlasansGet**](MotorApi.md#apimotoridulasansget) | **GET** /api/Motor/{id}/ulasans | 
[**apiMotorPost**](MotorApi.md#apimotorpost) | **POST** /api/Motor | 


# **apiMotorGet**
> List<Motor> apiMotorGet(idMitra, status, model, transmisi)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorApi();
final idMitra = idMitra_example; // String | 
final status = status_example; // String | 
final model = model_example; // String | 
final transmisi = transmisi_example; // String | 

try {
    final result = api_instance.apiMotorGet(idMitra, status, model, transmisi);
    print(result);
} catch (e) {
    print('Exception when calling MotorApi->apiMotorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idMitra** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **model** | **String**|  | [optional] 
 **transmisi** | **String**|  | [optional] 

### Return type

[**List<Motor>**](Motor.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorIdGet**
> Motor apiMotorIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorApi();
final id = 56; // int | 

try {
    final result = api_instance.apiMotorIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling MotorApi->apiMotorIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Motor**](Motor.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorIdPut**
> apiMotorIdPut(id, putMotorDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorApi();
final id = 56; // int | 
final putMotorDTO = PutMotorDTO(); // PutMotorDTO | 

try {
    api_instance.apiMotorIdPut(id, putMotorDTO);
} catch (e) {
    print('Exception when calling MotorApi->apiMotorIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **putMotorDTO** | [**PutMotorDTO**](PutMotorDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorIdUlasansGet**
> List<Ulasan> apiMotorIdUlasansGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorApi();
final id = 56; // int | 

try {
    final result = api_instance.apiMotorIdUlasansGet(id);
    print(result);
} catch (e) {
    print('Exception when calling MotorApi->apiMotorIdUlasansGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<Ulasan>**](Ulasan.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorPost**
> Motor apiMotorPost(motorForm)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorApi();
final motorForm = MotorForm(); // MotorForm | 

try {
    final result = api_instance.apiMotorPost(motorForm);
    print(result);
} catch (e) {
    print('Exception when calling MotorApi->apiMotorPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **motorForm** | [**MotorForm**](MotorForm.md)|  | [optional] 

### Return type

[**Motor**](Motor.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

