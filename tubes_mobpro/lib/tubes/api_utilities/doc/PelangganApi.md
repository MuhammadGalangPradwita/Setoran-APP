# openapi.api.PelangganApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pelangganCurrentPelangganGet**](PelangganApi.md#pelanggancurrentpelangganget) | **GET** /Pelanggan/currentPelanggan | 


# **pelangganCurrentPelangganGet**
> Pelanggan pelangganCurrentPelangganGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = PelangganApi();

try {
    final result = api_instance.pelangganCurrentPelangganGet();
    print(result);
} catch (e) {
    print('Exception when calling PelangganApi->pelangganCurrentPelangganGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Pelanggan**](Pelanggan.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

