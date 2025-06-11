# openapi.api.ReactApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiReactDashboardDataGet**](ReactApi.md#apireactdashboarddataget) | **GET** /api/React/dashboardData | 
[**apiReactMotorTableDataGet**](ReactApi.md#apireactmotortabledataget) | **GET** /api/React/motorTableData | 


# **apiReactDashboardDataGet**
> DashboardDataDTO apiReactDashboardDataGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReactApi();

try {
    final result = api_instance.apiReactDashboardDataGet();
    print(result);
} catch (e) {
    print('Exception when calling ReactApi->apiReactDashboardDataGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DashboardDataDTO**](DashboardDataDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiReactMotorTableDataGet**
> List<MotorTableDTO> apiReactMotorTableDataGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReactApi();

try {
    final result = api_instance.apiReactMotorTableDataGet();
    print(result);
} catch (e) {
    print('Exception when calling ReactApi->apiReactMotorTableDataGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<MotorTableDTO>**](MotorTableDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

