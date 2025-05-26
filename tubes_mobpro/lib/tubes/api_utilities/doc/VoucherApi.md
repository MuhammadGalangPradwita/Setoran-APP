# openapi.api.VoucherApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**voucherCheckVoucherCodeGet**](VoucherApi.md#vouchercheckvouchercodeget) | **GET** /Voucher/checkVoucher/{code} | 
[**voucherFilteredGet**](VoucherApi.md#voucherfilteredget) | **GET** /Voucher/filtered | 
[**voucherGenericIdDelete**](VoucherApi.md#vouchergenericiddelete) | **DELETE** /Voucher/generic/{id} | 
[**voucherGenericIdGet**](VoucherApi.md#vouchergenericidget) | **GET** /Voucher/generic/{id} | 
[**voucherGetActiveGet**](VoucherApi.md#vouchergetactiveget) | **GET** /Voucher/getActive | 
[**voucherGetByCodeCodeGet**](VoucherApi.md#vouchergetbycodecodeget) | **GET** /Voucher/getByCode/{code} | 
[**voucherPost**](VoucherApi.md#voucherpost) | **POST** /Voucher | 
[**voucherPut**](VoucherApi.md#voucherput) | **PUT** /Voucher | 


# **voucherCheckVoucherCodeGet**
> CheckVoucherDTO voucherCheckVoucherCodeGet(code)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final code = code_example; // String | 

try {
    final result = api_instance.voucherCheckVoucherCodeGet(code);
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherCheckVoucherCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 

### Return type

[**CheckVoucherDTO**](CheckVoucherDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherFilteredGet**
> List<Voucher> voucherFilteredGet(search, status, start, end)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final search = search_example; // String | 
final status = ; // StatusVoucher | 
final start = 2013-10-20T19:20:30+01:00; // DateTime | 
final end = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final result = api_instance.voucherFilteredGet(search, status, start, end);
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherFilteredGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **String**|  | [optional] 
 **status** | [**StatusVoucher**](.md)|  | [optional] 
 **start** | **DateTime**|  | [optional] 
 **end** | **DateTime**|  | [optional] 

### Return type

[**List<Voucher>**](Voucher.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherGenericIdDelete**
> voucherGenericIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final id = 56; // int | 

try {
    api_instance.voucherGenericIdDelete(id);
} catch (e) {
    print('Exception when calling VoucherApi->voucherGenericIdDelete: $e\n');
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

# **voucherGenericIdGet**
> Voucher voucherGenericIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final id = 56; // int | 

try {
    final result = api_instance.voucherGenericIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherGenericIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherGetActiveGet**
> List<Voucher> voucherGetActiveGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();

try {
    final result = api_instance.voucherGetActiveGet();
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherGetActiveGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Voucher>**](Voucher.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherGetByCodeCodeGet**
> Voucher voucherGetByCodeCodeGet(code)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final code = code_example; // String | 

try {
    final result = api_instance.voucherGetByCodeCodeGet(code);
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherGetByCodeCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherPost**
> Voucher voucherPost(postVoucherDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final postVoucherDTO = PostVoucherDTO(); // PostVoucherDTO | 

try {
    final result = api_instance.voucherPost(postVoucherDTO);
    print(result);
} catch (e) {
    print('Exception when calling VoucherApi->voucherPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **postVoucherDTO** | [**PostVoucherDTO**](PostVoucherDTO.md)|  | [optional] 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voucherPut**
> voucherPut(voucher)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = VoucherApi();
final voucher = Voucher(); // Voucher | 

try {
    api_instance.voucherPut(voucher);
} catch (e) {
    print('Exception when calling VoucherApi->voucherPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **voucher** | [**Voucher**](Voucher.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

