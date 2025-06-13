import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/edit_profile.dart';
import 'package:tubes_mobpro/tubes/pages/my_motorcycle_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        title: const Text("Account"),
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
                // InkWell(
                //   onTap: () {},
                //   child: _buildOptionList('Payment Method', Icons.credit_card),
                // ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const MyMotorcyclePage(), withNavBar: false);
                  },
                  child: _buildOptionList('My Motorcycle', Icons.motorcycle),
                ),
                // const Divider(),
                InkWell(
                  onTap: () {},
                  child: _buildOptionList('Help & Support', Icons.help_outline),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<AuthState>(context, listen: false).logout();
                  },
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
    String getAbbreviation(String name) {
      final parts = name.trim().split(RegExp(r'\s+'));
      if (parts.length == 1) {
        // Single name
        return parts[0][0].toUpperCase();
      } else {
        // Take first letter of first and last word
        return (parts[0][0] + parts.last[0]).toUpperCase();
      }
    }

    final singkatan = getAbbreviation(AuthState().currentUser?.nama ?? "Guest");

    return Card(
        color: AppColors.N100,
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (context) {
                final authState = Provider.of<AuthState>(context);
                final currentUser = authState.currentUser;

                final imageUrl = currentUser?.idGambar != null
                    ? "http://160.19.167.222:5103/storage/fetch/${currentUser!.idGambar}"
                    : "http://160.19.167.222:5103/avatar?name=${currentUser?.nama ?? 'Guest'}";

                return CircleAvatar(
                  backgroundColor: AppColors.N0,
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl),
                );
              }),
              Builder(builder: (context) {
                // var auth = context.read(AuthState);
                var auth = Provider.of<AuthState>(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      auth.currentUser?.nama ?? "Guest",
                      style: AppTextStyle.body1Bold,
                    ),
                    Text(
                      auth.currentUser?.email ?? "",
                      style: AppTextStyle.smallReguler,
                    )
                  ],
                );
              }),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                                screen: const EditProfilePage(),
                                withNavBar: false)
                            .then((_) {
                          setState(() {});
                        });
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
      padding: const EdgeInsets.symmetric(vertical: 16),
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
