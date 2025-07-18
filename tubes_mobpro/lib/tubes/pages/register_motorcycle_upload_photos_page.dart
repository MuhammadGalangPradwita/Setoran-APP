import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RegisterMotorcycleUploadPhotosPage extends StatefulWidget {
  final MotorForm motorForm;
  const RegisterMotorcycleUploadPhotosPage(
      {super.key, required this.motorForm});

  @override
  State<RegisterMotorcycleUploadPhotosPage> createState() =>
      _RegisterMotorcycleUploadPhotosPageState();
}

class _RegisterMotorcycleUploadPhotosPageState
    extends State<RegisterMotorcycleUploadPhotosPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? frontViewImage;
  XFile? leftViewImage;
  XFile? rightViewImage;
  XFile? rearViewImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.N0,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Register Motorcycle"),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: SingleChildScrollView(
          // width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Upload Photos",
                  style: AppTextStyle.body1Bold,
                ),
                const Gap(16),
                Text(
                  "upload your motorcycle photo from 4 different side",
                  style: AppTextStyle.body2Regular,
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Front View",
                  style: AppTextStyle.body1SemiBold,
                ),
                const Gap(12),
                InkWell(
                  onTap: () async {
                    frontViewImage =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.N400),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Builder(
                          builder: (context) {
                            if (frontViewImage != null) {
                              return ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Image.file(
                                  File(frontViewImage!.path),
                                  // height: 150,
                                  // width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.file_upload_outlined,
                                      color: AppColors.N400,
                                      size: 32,
                                    ),
                                    const Gap(6),
                                    Text(
                                      "upload",
                                      style: AppTextStyle.body2Regular
                                          .copyWith(color: AppColors.N400),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        )),
                  ),
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Left View",
                      style: AppTextStyle.body1SemiBold,
                    ),
                    const Gap(12),
                    InkWell(
                      onTap: () async {
                        leftViewImage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.N400),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Builder(
                              builder: (context) {
                                if (leftViewImage != null) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Image.file(
                                      File(leftViewImage!.path),
                                      // height: 150,
                                      // width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: AppColors.N400,
                                          size: 32,
                                        ),
                                        const Gap(6),
                                        Text(
                                          "upload",
                                          style: AppTextStyle.body2Regular
                                              .copyWith(color: AppColors.N400),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Right View",
                      style: AppTextStyle.body1SemiBold,
                    ),
                    const Gap(12),
                    InkWell(
                      onTap: () async {
                        rightViewImage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.N400),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Builder(
                              builder: (context) {
                                if (rightViewImage != null) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Image.file(
                                      File(rightViewImage!.path),
                                      // height: 150,
                                      // width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: AppColors.N400,
                                          size: 32,
                                        ),
                                        const Gap(6),
                                        Text(
                                          "upload",
                                          style: AppTextStyle.body2Regular
                                              .copyWith(color: AppColors.N400),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rear View",
                      style: AppTextStyle.body1SemiBold,
                    ),
                    const Gap(12),
                    InkWell(
                      onTap: () async {
                        rearViewImage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.N400),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Builder(
                              builder: (context) {
                                if (rearViewImage != null) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    child: Image.file(
                                      File(rearViewImage!.path),
                                      // height: 150,
                                      // width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: AppColors.N400,
                                          size: 32,
                                        ),
                                        const Gap(6),
                                        Text(
                                          "upload",
                                          style: AppTextStyle.body2Regular
                                              .copyWith(color: AppColors.N400),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            )),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget.primary(
                      label: "Register",
                      press: () {
                        _showConfirmDialog(context);
                      }),
                )
              ],
            ),
          ]),
        ));
  }

  _showConfirmDialog(BuildContext context) {
    if (frontViewImage == null ||
        leftViewImage == null ||
        rightViewImage == null ||
        rearViewImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please upload all motorcycle photos"),
          backgroundColor: AppColors.R400,
        ),
      );
      return;
    }
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.N0,
          title: Text(
            "Confirm your data",
            style: AppTextStyle.h3Bold,
          ),
          content: Text(
            "By submitting this form, I certify that the information provided is accurate and complete to the best of my knowledge",
            style: AppTextStyle.body2Regular,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                    child: ButtonWidget.secondary(
                        label: "Cancel",
                        press: () {
                          Navigator.pop(context);
                        })),
                const Gap(8),
                Expanded(
                    child: ButtonWidget.primary(
                        label: "Confirm",
                        press: () async {
                          if (frontViewImage == null ||
                              leftViewImage == null ||
                              rightViewImage == null ||
                              rearViewImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please upload all motorcycle photos"),
                                backgroundColor: AppColors.R400,
                              ),
                            );
                            return;
                          }
                          // convert XFile to MultiPartFile
                          final frontMultiPartFile =
                              http.MultipartFile.fromBytes(
                                  'file', await frontViewImage!.readAsBytes(),
                                  filename: frontViewImage!.name,
                                  contentType: MediaType('image', 'jpeg'));
                          final leftMultiPartFile =
                              http.MultipartFile.fromBytes(
                                  'file', await leftViewImage!.readAsBytes(),
                                  filename: leftViewImage!.name,
                                  contentType: MediaType('image', 'jpeg'));
                          final rightMultiPartFile =
                              http.MultipartFile.fromBytes(
                                  'file', await rightViewImage!.readAsBytes(),
                                  filename: rightViewImage!.name,
                                  contentType: MediaType('image', 'jpeg'));
                          final rearMultiPartFile =
                              http.MultipartFile.fromBytes(
                                  'file', await rearViewImage!.readAsBytes(),
                                  filename: rearViewImage!.name,
                                  contentType: MediaType('image', 'jpeg'));

                          // check if not a mitra yet
                          if (widget.motorForm.idMitra == -1) {
                            // create mitra
                            final mitra = await ApiService().mitraApi.mitraPost(
                                postCreateMitraDTO: PostCreateMitraDTO(
                                    idPengguna: Provider.of<AuthState>(context,
                                            listen: false)
                                        .currentUser!
                                        .id,
                                    status: StatusMitra.aktif));
                            // set idMitra to motorForm
                            widget.motorForm.idMitra = mitra!.idMitra!;
                          }

                          // create motorcycle
                          final createdMotor = await ApiService()
                              .motorApi
                              .apiMotorPost(motorForm: widget.motorForm);

                          // upload photos
                          final front = await ApiService()
                              .storageApi
                              .storageStorePost(file: frontMultiPartFile);
                          final left = await ApiService()
                              .storageApi
                              .storageStorePost(file: leftMultiPartFile);
                          final right = await ApiService()
                              .storageApi
                              .storageStorePost(file: rightMultiPartFile);
                          final rear = await ApiService()
                              .storageApi
                              .storageStorePost(file: rearMultiPartFile);

                          // update motorcycle with photos
                          await ApiService().motorImageApi.apiMotorImagePost(
                                  postMotorImageDTO: PostMotorImageDTO(
                                idMotor: createdMotor?.idMotor,
                                front: front,
                                left: left,
                                right: right,
                                rear: rear,
                              ));

                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        }))
              ],
            )
          ],
        );
      },
    );
  }
}
