# openapi
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Generator version: 7.13.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  openapi:
    path: /path/to/openapi
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:openapi/api.dart';

// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final registerForm = RegisterForm(); // RegisterForm | 

try {
    api_instance.authRegisterPost(registerForm);
} catch (e) {
    print('Exception when calling AuthApi->authRegisterPost: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuthApi* | [**authRegisterPost**](doc//AuthApi.md#authregisterpost) | **POST** /Auth/register | 
*AvatarApi* | [**avatarGet**](doc//AvatarApi.md#avatarget) | **GET** /avatar | 
*DiskonApi* | [**diskonGenericIdDelete**](doc//DiskonApi.md#diskongenericiddelete) | **DELETE** /Diskon/generic/{id} | 
*DiskonApi* | [**diskonGenericIdGet**](doc//DiskonApi.md#diskongenericidget) | **GET** /Diskon/generic/{id} | 
*DiskonApi* | [**diskonGetAllGet**](doc//DiskonApi.md#diskongetallget) | **GET** /Diskon/getAll | 
*DiskonApi* | [**diskonPost**](doc//DiskonApi.md#diskonpost) | **POST** /Diskon | 
*DiskonApi* | [**diskonPut**](doc//DiskonApi.md#diskonput) | **PUT** /Diskon | 
*MitraApi* | [**mitraGenericIdDelete**](doc//MitraApi.md#mitragenericiddelete) | **DELETE** /Mitra/generic/{id} | 
*MitraApi* | [**mitraGenericIdGet**](doc//MitraApi.md#mitragenericidget) | **GET** /Mitra/generic/{id} | 
*MitraApi* | [**mitraMitraMotorGet**](doc//MitraApi.md#mitramitramotorget) | **GET** /Mitra/mitraMotor | 
*MitraApi* | [**mitraPost**](doc//MitraApi.md#mitrapost) | **POST** /Mitra | 
*MitraApi* | [**mitraPut**](doc//MitraApi.md#mitraput) | **PUT** /Mitra | 
*MotorApi* | [**apiMotorAcceptMotorIdMotorGet**](doc//MotorApi.md#apimotoracceptmotoridmotorget) | **GET** /api/Motor/acceptMotor/{idMotor} | 
*MotorApi* | [**apiMotorGet**](doc//MotorApi.md#apimotorget) | **GET** /api/Motor | 
*MotorApi* | [**apiMotorIdDelete**](doc//MotorApi.md#apimotoriddelete) | **DELETE** /api/Motor/{id} | 
*MotorApi* | [**apiMotorIdDiskonsGet**](doc//MotorApi.md#apimotoriddiskonsget) | **GET** /api/Motor/{id}/diskons | 
*MotorApi* | [**apiMotorIdGet**](doc//MotorApi.md#apimotoridget) | **GET** /api/Motor/{id} | 
*MotorApi* | [**apiMotorIdPut**](doc//MotorApi.md#apimotoridput) | **PUT** /api/Motor/{id} | 
*MotorApi* | [**apiMotorIdUlasansGet**](doc//MotorApi.md#apimotoridulasansget) | **GET** /api/Motor/{id}/ulasans | 
*MotorApi* | [**apiMotorPost**](doc//MotorApi.md#apimotorpost) | **POST** /api/Motor | 
*MotorImageApi* | [**apiMotorImageIdGet**](doc//MotorImageApi.md#apimotorimageidget) | **GET** /api/MotorImage/{id} | 
*MotorImageApi* | [**apiMotorImagePost**](doc//MotorImageApi.md#apimotorimagepost) | **POST** /api/MotorImage | 
*MotorImageApi* | [**apiMotorImagePut**](doc//MotorImageApi.md#apimotorimageput) | **PUT** /api/MotorImage | 
*NotifikasiApi* | [**notifikasiGenericIdDelete**](doc//NotifikasiApi.md#notifikasigenericiddelete) | **DELETE** /Notifikasi/generic/{id} | 
*NotifikasiApi* | [**notifikasiGenericIdGet**](doc//NotifikasiApi.md#notifikasigenericidget) | **GET** /Notifikasi/generic/{id} | 
*NotifikasiApi* | [**notifikasiGetPerUserGet**](doc//NotifikasiApi.md#notifikasigetperuserget) | **GET** /Notifikasi/getPerUser | 
*NotifikasiApi* | [**notifikasiReadIdPost**](doc//NotifikasiApi.md#notifikasireadidpost) | **POST** /Notifikasi/read/{id} | 
*NotifikasiApi* | [**notifikasiRegisterDevicePost**](doc//NotifikasiApi.md#notifikasiregisterdevicepost) | **POST** /Notifikasi/registerDevice | 
*NotifikasiApi* | [**notifikasiSendPost**](doc//NotifikasiApi.md#notifikasisendpost) | **POST** /Notifikasi/send | 
*PelangganApi* | [**pelangganCurrentPelangganGet**](doc//PelangganApi.md#pelanggancurrentpelangganget) | **GET** /Pelanggan/currentPelanggan | 
*PelangganApi* | [**pelangganGenericIdDelete**](doc//PelangganApi.md#pelanggangenericiddelete) | **DELETE** /Pelanggan/generic/{id} | 
*PelangganApi* | [**pelangganGenericIdGet**](doc//PelangganApi.md#pelanggangenericidget) | **GET** /Pelanggan/generic/{id} | 
*PelangganApi* | [**pelangganPut**](doc//PelangganApi.md#pelangganput) | **PUT** /Pelanggan | 
*PembayaranApi* | [**apiPembayaranGet**](doc//PembayaranApi.md#apipembayaranget) | **GET** /api/Pembayaran | 
*PembayaranApi* | [**apiPembayaranIdGet**](doc//PembayaranApi.md#apipembayaranidget) | **GET** /api/Pembayaran/{id} | 
*PembayaranApi* | [**apiPembayaranIdPut**](doc//PembayaranApi.md#apipembayaranidput) | **PUT** /api/Pembayaran/{id} | 
*PembayaranApi* | [**apiPembayaranPost**](doc//PembayaranApi.md#apipembayaranpost) | **POST** /api/Pembayaran | 
*PembayaranApi* | [**apiPembayaranTransaksiIdGet**](doc//PembayaranApi.md#apipembayarantransaksiidget) | **GET** /api/Pembayaran/transaksi/{id} | 
*PenggunaApi* | [**penggunaCurrentPenggunaGet**](doc//PenggunaApi.md#penggunacurrentpenggunaget) | **GET** /Pengguna/currentPengguna | 
*PenggunaApi* | [**penggunaFromMitraGet**](doc//PenggunaApi.md#penggunafrommitraget) | **GET** /Pengguna/fromMitra | 
*PenggunaApi* | [**penggunaFromPelangganGet**](doc//PenggunaApi.md#penggunafrompelangganget) | **GET** /Pengguna/fromPelanggan | 
*PenggunaApi* | [**penggunaGenericIdDelete**](doc//PenggunaApi.md#penggunagenericiddelete) | **DELETE** /Pengguna/generic/{id} | 
*PenggunaApi* | [**penggunaGenericIdGet**](doc//PenggunaApi.md#penggunagenericidget) | **GET** /Pengguna/generic/{id} | 
*PenggunaApi* | [**penggunaGetAllGet**](doc//PenggunaApi.md#penggunagetallget) | **GET** /Pengguna/getAll | 
*PenggunaApi* | [**penggunaIdGet**](doc//PenggunaApi.md#penggunaidget) | **GET** /Pengguna/{id} | 
*PenggunaApi* | [**penggunaPut**](doc//PenggunaApi.md#penggunaput) | **PUT** /Pengguna | 
*PenggunaApi* | [**penggunaUpdateProfileImageIdPost**](doc//PenggunaApi.md#penggunaupdateprofileimageidpost) | **POST** /Pengguna/updateProfileImage/{id} | 
*ReactApi* | [**apiReactDashboardDataGet**](doc//ReactApi.md#apireactdashboarddataget) | **GET** /api/React/dashboardData | 
*ReactApi* | [**apiReactMotorTableDataGet**](doc//ReactApi.md#apireactmotortabledataget) | **GET** /api/React/motorTableData | 
*SetoranAPINETApi* | [**forgotPasswordPost**](doc//SetoranAPINETApi.md#forgotpasswordpost) | **POST** /forgotPassword | 
*SetoranAPINETApi* | [**loginPost**](doc//SetoranAPINETApi.md#loginpost) | **POST** /login | 
*SetoranAPINETApi* | [**manage2faPost**](doc//SetoranAPINETApi.md#manage2fapost) | **POST** /manage/2fa | 
*SetoranAPINETApi* | [**manageInfoGet**](doc//SetoranAPINETApi.md#manageinfoget) | **GET** /manage/info | 
*SetoranAPINETApi* | [**manageInfoPost**](doc//SetoranAPINETApi.md#manageinfopost) | **POST** /manage/info | 
*SetoranAPINETApi* | [**mapIdentityApiConfirmEmail**](doc//SetoranAPINETApi.md#mapidentityapiconfirmemail) | **GET** /confirmEmail | 
*SetoranAPINETApi* | [**refreshPost**](doc//SetoranAPINETApi.md#refreshpost) | **POST** /refresh | 
*SetoranAPINETApi* | [**registerPost**](doc//SetoranAPINETApi.md#registerpost) | **POST** /register | 
*SetoranAPINETApi* | [**resendConfirmationEmailPost**](doc//SetoranAPINETApi.md#resendconfirmationemailpost) | **POST** /resendConfirmationEmail | 
*SetoranAPINETApi* | [**resetPasswordPost**](doc//SetoranAPINETApi.md#resetpasswordpost) | **POST** /resetPassword | 
*StorageApi* | [**storageFetchFileNameGet**](doc//StorageApi.md#storagefetchfilenameget) | **GET** /Storage/fetch/{fileName} | 
*StorageApi* | [**storageStorePost**](doc//StorageApi.md#storagestorepost) | **POST** /Storage/store | 
*TransaksiApi* | [**apiTransaksiGet**](doc//TransaksiApi.md#apitransaksiget) | **GET** /api/Transaksi | 
*TransaksiApi* | [**apiTransaksiIdGet**](doc//TransaksiApi.md#apitransaksiidget) | **GET** /api/Transaksi/{id} | 
*TransaksiApi* | [**apiTransaksiIdPut**](doc//TransaksiApi.md#apitransaksiidput) | **PUT** /api/Transaksi/{id} | 
*TransaksiApi* | [**apiTransaksiPost**](doc//TransaksiApi.md#apitransaksipost) | **POST** /api/Transaksi | 
*UlasanApi* | [**apiUlasanGet**](doc//UlasanApi.md#apiulasanget) | **GET** /api/Ulasan | 
*UlasanApi* | [**apiUlasanIdGet**](doc//UlasanApi.md#apiulasanidget) | **GET** /api/Ulasan/{id} | 
*UlasanApi* | [**apiUlasanPost**](doc//UlasanApi.md#apiulasanpost) | **POST** /api/Ulasan | 
*VoucherApi* | [**voucherCheckVoucherCodeGet**](doc//VoucherApi.md#vouchercheckvouchercodeget) | **GET** /Voucher/checkVoucher/{code} | 
*VoucherApi* | [**voucherFilteredGet**](doc//VoucherApi.md#voucherfilteredget) | **GET** /Voucher/filtered | 
*VoucherApi* | [**voucherGenericIdDelete**](doc//VoucherApi.md#vouchergenericiddelete) | **DELETE** /Voucher/generic/{id} | 
*VoucherApi* | [**voucherGenericIdGet**](doc//VoucherApi.md#vouchergenericidget) | **GET** /Voucher/generic/{id} | 
*VoucherApi* | [**voucherGetActiveGet**](doc//VoucherApi.md#vouchergetactiveget) | **GET** /Voucher/getActive | 
*VoucherApi* | [**voucherGetByCodeCodeGet**](doc//VoucherApi.md#vouchergetbycodecodeget) | **GET** /Voucher/getByCode/{code} | 
*VoucherApi* | [**voucherIdVoucherPut**](doc//VoucherApi.md#voucheridvoucherput) | **PUT** /Voucher/{idVoucher} | 
*VoucherApi* | [**voucherPost**](doc//VoucherApi.md#voucherpost) | **POST** /Voucher | 


## Documentation For Models

 - [AccessTokenResponse](doc//AccessTokenResponse.md)
 - [CheckVoucherDTO](doc//CheckVoucherDTO.md)
 - [DashboardDataDTO](doc//DashboardDataDTO.md)
 - [DeviceToken](doc//DeviceToken.md)
 - [Diskon](doc//Diskon.md)
 - [ForgotPasswordRequest](doc//ForgotPasswordRequest.md)
 - [GetNotifikasDTO](doc//GetNotifikasDTO.md)
 - [HttpValidationProblemDetails](doc//HttpValidationProblemDetails.md)
 - [InfoRequest](doc//InfoRequest.md)
 - [InfoResponse](doc//InfoResponse.md)
 - [LoginRequest](doc//LoginRequest.md)
 - [MetodePembayaran](doc//MetodePembayaran.md)
 - [Mitra](doc//Mitra.md)
 - [MitraMotorDTO](doc//MitraMotorDTO.md)
 - [Motor](doc//Motor.md)
 - [MotorForm](doc//MotorForm.md)
 - [MotorImage](doc//MotorImage.md)
 - [MotorSorting](doc//MotorSorting.md)
 - [MotorTableDTO](doc//MotorTableDTO.md)
 - [Notifikasi](doc//Notifikasi.md)
 - [Pelanggan](doc//Pelanggan.md)
 - [Pembayaran](doc//Pembayaran.md)
 - [Pengguna](doc//Pengguna.md)
 - [PostCreateMitraDTO](doc//PostCreateMitraDTO.md)
 - [PostDiskonDTO](doc//PostDiskonDTO.md)
 - [PostMitraDTO](doc//PostMitraDTO.md)
 - [PostMotorImageDTO](doc//PostMotorImageDTO.md)
 - [PostNotifikasDTO](doc//PostNotifikasDTO.md)
 - [PostPelangganDTO](doc//PostPelangganDTO.md)
 - [PostPembayaranDTO](doc//PostPembayaranDTO.md)
 - [PostPenggunaDTO](doc//PostPenggunaDTO.md)
 - [PostTransaksiDTO](doc//PostTransaksiDTO.md)
 - [PostUlasanDTO](doc//PostUlasanDTO.md)
 - [PostVoucherDTO](doc//PostVoucherDTO.md)
 - [PutDiskonDTO](doc//PutDiskonDTO.md)
 - [PutMotorDTO](doc//PutMotorDTO.md)
 - [PutMotorImageDTO](doc//PutMotorImageDTO.md)
 - [PutPembayaranDTO](doc//PutPembayaranDTO.md)
 - [RefreshRequest](doc//RefreshRequest.md)
 - [RegisterForm](doc//RegisterForm.md)
 - [RegisterRequest](doc//RegisterRequest.md)
 - [ResendConfirmationEmailRequest](doc//ResendConfirmationEmailRequest.md)
 - [ResetPasswordRequest](doc//ResetPasswordRequest.md)
 - [StatusDiskon](doc//StatusDiskon.md)
 - [StatusMitra](doc//StatusMitra.md)
 - [StatusMotor](doc//StatusMotor.md)
 - [StatusPembayaran](doc//StatusPembayaran.md)
 - [StatusTransaksi](doc//StatusTransaksi.md)
 - [StatusVoucher](doc//StatusVoucher.md)
 - [TargetNavigasi](doc//TargetNavigasi.md)
 - [Transaksi](doc//Transaksi.md)
 - [TransmisiMotor](doc//TransmisiMotor.md)
 - [TwoFactorRequest](doc//TwoFactorRequest.md)
 - [TwoFactorResponse](doc//TwoFactorResponse.md)
 - [Ulasan](doc//Ulasan.md)
 - [Voucher](doc//Voucher.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### Bearer

- **Type**: HTTP Bearer authentication


## Author



