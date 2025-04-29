# openapi.model.Pengguna

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**userName** | **String** |  | [optional] 
**normalizedUserName** | **String** |  | [optional] 
**email** | **String** |  | [optional] 
**normalizedEmail** | **String** |  | [optional] 
**emailConfirmed** | **bool** |  | [optional] 
**passwordHash** | **String** |  | [optional] 
**securityStamp** | **String** |  | [optional] 
**concurrencyStamp** | **String** |  | [optional] 
**phoneNumber** | **String** |  | [optional] 
**phoneNumberConfirmed** | **bool** |  | [optional] 
**twoFactorEnabled** | **bool** |  | [optional] 
**lockoutEnd** | [**DateTime**](DateTime.md) |  | [optional] 
**lockoutEnabled** | **bool** |  | [optional] 
**accessFailedCount** | **int** |  | [optional] 
**pelanggan** | [**Pelanggan**](Pelanggan.md) |  | [optional] 
**notifikasis** | [**List<Notifikasi>**](Notifikasi.md) |  | [optional] [default to const []]
**deviceTokens** | [**List<DeviceToken>**](DeviceToken.md) |  | [optional] [default to const []]
**nama** | **String** |  | [optional] 
**tanggalLahir** | [**DateTime**](DateTime.md) |  | [optional] 
**nomorTelepon** | **String** |  | [optional] 
**umur** | **int** |  | [optional] 
**nomorKTP** | **String** |  | [optional] 
**alamat** | **String** |  | [optional] 
**idGambar** | **int** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


