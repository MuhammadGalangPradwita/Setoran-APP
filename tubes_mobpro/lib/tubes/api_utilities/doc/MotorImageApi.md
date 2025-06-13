# openapi.api.MotorImageApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMotorImageIdGet**](MotorImageApi.md#apimotorimageidget) | **GET** /api/MotorImage/{id} | 
[**apiMotorImagePost**](MotorImageApi.md#apimotorimagepost) | **POST** /api/MotorImage | 
[**apiMotorImagePut**](MotorImageApi.md#apimotorimageput) | **PUT** /api/MotorImage | 


# **apiMotorImageIdGet**
> MotorImage apiMotorImageIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorImageApi();
final id = 56; // int | 

try {
    final result = api_instance.apiMotorImageIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling MotorImageApi->apiMotorImageIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**MotorImage**](MotorImage.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorImagePost**
> MotorImage apiMotorImagePost(postMotorImageDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorImageApi();
final postMotorImageDTO = PostMotorImageDTO(); // PostMotorImageDTO | 

try {
    final result = api_instance.apiMotorImagePost(postMotorImageDTO);
    print(result);
} catch (e) {
    print('Exception when calling MotorImageApi->apiMotorImagePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postMotorImageDTO** | [**PostMotorImageDTO**](PostMotorImageDTO.md)|  | [optional] 

### Return type

[**MotorImage**](MotorImage.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMotorImagePut**
> MotorImage apiMotorImagePut(putMotorImageDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MotorImageApi();
final putMotorImageDTO = PutMotorImageDTO(); // PutMotorImageDTO | 

try {
    final result = api_instance.apiMotorImagePut(putMotorImageDTO);
    print(result);
} catch (e) {
    print('Exception when calling MotorImageApi->apiMotorImagePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **putMotorImageDTO** | [**PutMotorImageDTO**](PutMotorImageDTO.md)|  | [optional] 

### Return type

[**MotorImage**](MotorImage.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

