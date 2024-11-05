import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text("Edit Profile"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SingleChildScrollView(
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
      ),
    );
  }

  Row _profilePictureSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70, // Adjust size as needed
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage('assets/images/avatar.png'),
            ),
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
              onTap: () {},
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
              Text('Akbar Faisal', style: AppTextStyle.body2Regular)
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
              Text('30 September 1965', style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender',
                style: AppTextStyle.smallReguler,
              ),
              Text('Male', style: AppTextStyle.body2Regular)
            ],
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Addres',
                style: AppTextStyle.smallReguler,
              ),
              Text(
                  'Jl. Telekomunikasi. 1, Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40257',
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
              Text('+62812456789', style: AppTextStyle.body2Regular)
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
              Text('akbarfaisal@email.com', style: AppTextStyle.body2Regular)
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
                  onTap: () {},
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
                  Text('1234567894561238', style: AppTextStyle.body2Regular)
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
                  onTap: () {},
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
                  Text('1328-0112-000039', style: AppTextStyle.body2Regular)
                ],
              ),
            ]));
  }
}
