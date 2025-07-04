import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/avatar_preview_page.dart';
import 'package:tubes_mobpro/tubes/pages/edit_driving_license_page.dart';
import 'package:tubes_mobpro/tubes/pages/edit_id_data_page.dart';
import 'package:tubes_mobpro/tubes/pages/edit_personal_data_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Pelanggan? pelanggan;
  Pengguna? pengguna;
  // late NetworkImage avatar;
  // late ImageData profilePicture;
  late Image profilePicture;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await AuthState().refreshCurrentUser();
    setState(() {
      pengguna = AuthState().currentUser;
      pelanggan = AuthState().currentUser!.pelanggan;
      // avatar = resultImage;
      // profilePicture = resultProfile!;
    });
  }

  Future<void> refresh() async {
    print("Refreshed");
    loadData();
  }

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
        title: const Text("Edit Profile"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: RefreshIndicator(onRefresh: refresh, child: _buildContent()),
    );
  }

  Widget _buildContent() {
    if (pelanggan == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profilePictureSection(),
            const Gap(32),
            _personalDataSection(),
            const Gap(24),
            _IDSection(),
            const Gap(24),
            _DrivingLicenseSection(),
          ],
        ),
      ),
    );
  }

  Row _profilePictureSection() {
    final imageUrl = pengguna?.idGambar != null
        ? "http://160.19.167.222:5103/storage/fetch/${pengguna!.idGambar}"
        : "http://160.19.167.222:5103/avatar?name=${pengguna?.nama ?? 'Guest'}";
    Image image = Image.network(imageUrl);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => AvatarPreviewPage(
                image: image,
              ),
            ))
                .then((_) {
              loadData();
            });
          },
          child: Stack(
            children: [
              Builder(builder: (context) {
                return CircleAvatar(
                  backgroundColor: AppColors.N0,
                  radius: 60,
                  backgroundImage: image.image,
                );
              }),
              Positioned(
                bottom: 0,
                right: 10,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.N100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: AppColors.N800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _personalDataSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.N400,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Personal Data',
              style: AppTextStyle.body2SemiBold,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPersonalDataPage(
                              pengguna: pengguna!,
                            ))).then((_) {
                  loadData();
                });
              },
              child: Text(
                "Edit",
                style:
                    AppTextStyle.body2SemiBold.copyWith(color: AppColors.B400),
              ),
            )
          ]),
          const Gap(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama',
                style: AppTextStyle.smallReguler,
              ),
              Text(pengguna!.nama ?? "", style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Birth Date',
                style: AppTextStyle.smallReguler,
              ),
              Text(
                  pengguna!.tanggalLahir == null
                      ? ""
                      : AppUtil.formatDate(pengguna!.tanggalLahir!),
                  style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Gender',
          //       style: AppTextStyle.smallReguler,
          //     ),
          //     Text('Male', style: AppTextStyle.body2Regular)
          //   ],
          // ),
          // const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Addres',
                style: AppTextStyle.smallReguler,
              ),
              Text(pengguna!.alamat == null ? "" : pengguna!.alamat!,
                  style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: AppTextStyle.smallReguler,
              ),
              Text(
                  pengguna!.nomorTelepon == null ? "" : pengguna!.nomorTelepon!,
                  style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: AppTextStyle.smallReguler,
              ),
              Text(pengguna!.email ?? "", style: AppTextStyle.body2Regular)
            ],
          ),
        ],
      ),
    );
  }

  Container _IDSection() {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.N400,
              width: 1,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'ID',
                  style: AppTextStyle.body2SemiBold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditIDDataPage(
                                  pengguna: pengguna!,
                                ))).then((_) {
                      loadData();
                    });
                  },
                  child: Text(
                    "Edit",
                    style: AppTextStyle.body2SemiBold
                        .copyWith(color: AppColors.B400),
                  ),
                )
              ]),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type',
                    style: AppTextStyle.smallReguler,
                  ),
                  Text('KTP', style: AppTextStyle.body2Regular)
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID No.',
                    style: AppTextStyle.smallReguler,
                  ),
                  Text(pengguna!.nomorKTP == null ? "" : pengguna!.nomorKTP!,
                      style: AppTextStyle.body2Regular)
                ],
              ),
            ]));
  }

  Container _DrivingLicenseSection() {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.N400,
              width: 1,
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Driving License',
                  style: AppTextStyle.body2SemiBold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditDrivingLicensePage(
                            number: pelanggan!.nomorSIM!.toString(),
                            pelanggan: pelanggan!,
                          ),
                        )).then((_) {
                      loadData();
                    });
                  },
                  child: Text(
                    "Edit",
                    style: AppTextStyle.body2SemiBold
                        .copyWith(color: AppColors.B400),
                  ),
                )
              ]),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: AppTextStyle.smallReguler,
                  ),
                  Text('Valid', style: AppTextStyle.body2Regular)
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No.',
                    style: AppTextStyle.smallReguler,
                  ),
                  Text(pelanggan!.nomorSIM ?? "",
                      style: AppTextStyle.body2Regular)
                ],
              ),
            ]));
  }
}
