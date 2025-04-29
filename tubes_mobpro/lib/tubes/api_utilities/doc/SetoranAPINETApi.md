# openapi.api.SetoranAPINETApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPasswordPost**](SetoranAPINETApi.md#forgotpasswordpost) | **POST** /forgotPassword | 
[**loginPost**](SetoranAPINETApi.md#loginpost) | **POST** /login | 
[**manage2faPost**](SetoranAPINETApi.md#manage2fapost) | **POST** /manage/2fa | 
[**manageInfoGet**](SetoranAPINETApi.md#manageinfoget) | **GET** /manage/info | 
[**manageInfoPost**](SetoranAPINETApi.md#manageinfopost) | **POST** /manage/info | 
[**mapIdentityApiConfirmEmail**](SetoranAPINETApi.md#mapidentityapiconfirmemail) | **GET** /confirmEmail | 
[**refreshPost**](SetoranAPINETApi.md#refreshpost) | **POST** /refresh | 
[**registerPost**](SetoranAPINETApi.md#registerpost) | **POST** /register | 
[**resendConfirmationEmailPost**](SetoranAPINETApi.md#resendconfirmationemailpost) | **POST** /resendConfirmationEmail | 
[**resetPasswordPost**](SetoranAPINETApi.md#resetpasswordpost) | **POST** /resetPassword | 


# **forgotPasswordPost**
> forgotPasswordPost(forgotPasswordRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final forgotPasswordRequest = ForgotPasswordRequest(); // ForgotPasswordRequest | 

try {
    api_instance.forgotPasswordPost(forgotPasswordRequest);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->forgotPasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordRequest** | [**ForgotPasswordRequest**](ForgotPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginPost**
> AccessTokenResponse loginPost(loginRequest, useCookies, useSessionCookies)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final loginRequest = LoginRequest(); // LoginRequest | 
final useCookies = true; // bool | 
final useSessionCookies = true; // bool | 

try {
    final result = api_instance.loginPost(loginRequest, useCookies, useSessionCookies);
    print(result);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->loginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 
 **useCookies** | **bool**|  | [optional] 
 **useSessionCookies** | **bool**|  | [optional] 

### Return type

[**AccessTokenResponse**](AccessTokenResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **manage2faPost**
> TwoFactorResponse manage2faPost(twoFactorRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final twoFactorRequest = TwoFactorRequest(); // TwoFactorRequest | 

try {
    final result = api_instance.manage2faPost(twoFactorRequest);
    print(result);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->manage2faPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **twoFactorRequest** | [**TwoFactorRequest**](TwoFactorRequest.md)|  | 

### Return type

[**TwoFactorResponse**](TwoFactorResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **manageInfoGet**
> InfoResponse manageInfoGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();

try {
    final result = api_instance.manageInfoGet();
    print(result);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->manageInfoGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InfoResponse**](InfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **manageInfoPost**
> InfoResponse manageInfoPost(infoRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final infoRequest = InfoRequest(); // InfoRequest | 

try {
    final result = api_instance.manageInfoPost(infoRequest);
    print(result);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->manageInfoPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **infoRequest** | [**InfoRequest**](InfoRequest.md)|  | 

### Return type

[**InfoResponse**](InfoResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mapIdentityApiConfirmEmail**
> mapIdentityApiConfirmEmail(userId, code, changedEmail)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final userId = userId_example; // String | 
final code = code_example; // String | 
final changedEmail = changedEmail_example; // String | 

try {
    api_instance.mapIdentityApiConfirmEmail(userId, code, changedEmail);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->mapIdentityApiConfirmEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **code** | **String**|  | 
 **changedEmail** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshPost**
> AccessTokenResponse refreshPost(refreshRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final refreshRequest = RefreshRequest(); // RefreshRequest | 

try {
    final result = api_instance.refreshPost(refreshRequest);
    print(result);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->refreshPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | 

### Return type

[**AccessTokenResponse**](AccessTokenResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerPost**
> registerPost(registerRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final registerRequest = RegisterRequest(); // RegisterRequest | 

try {
    api_instance.registerPost(registerRequest);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->registerPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerRequest** | [**RegisterRequest**](RegisterRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resendConfirmationEmailPost**
> resendConfirmationEmailPost(resendConfirmationEmailRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final resendConfirmationEmailRequest = ResendConfirmationEmailRequest(); // ResendConfirmationEmailRequest | 

try {
    api_instance.resendConfirmationEmailPost(resendConfirmationEmailRequest);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->resendConfirmationEmailPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resendConfirmationEmailRequest** | [**ResendConfirmationEmailRequest**](ResendConfirmationEmailRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPasswordPost**
> resetPasswordPost(resetPasswordRequest)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SetoranAPINETApi();
final resetPasswordRequest = ResetPasswordRequest(); // ResetPasswordRequest | 

try {
    api_instance.resetPasswordPost(resetPasswordRequest);
} catch (e) {
    print('Exception when calling SetoranAPINETApi->resetPasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resetPasswordRequest** | [**ResetPasswordRequest**](ResetPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

