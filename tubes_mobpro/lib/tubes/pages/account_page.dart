import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/pages/edit_profile.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        title: const Text("Activity"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileCard(context),
            const Gap(32),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Payment Method', Icons.credit_card),
                ),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('My Motorcycle', Icons.motorcycle),
                ),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Notification', Icons.notifications),
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Language', Icons.language),
                ),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Help & Support', Icons.help_outline),
                ),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Log Out', Icons.logout_outlined),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Card _buildProfileCard(BuildContext context) {
    return Card(
        color: AppColors.N100,
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akbar Faisal',
                    style: AppTextStyle.body1Bold,
                  ),
                  Text(
                    'akbarfaisal@email.com',
                    style: AppTextStyle.smallReguler,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfilePage()));
                      },
                      icon: const Icon(Icons.edit))
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildOptionList(String label, IconData iconData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24,
          ),
          const Gap(20),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppTextStyle.body2Regular,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              )
            ],
          ))
        ],
      ),
    );
  }
}
