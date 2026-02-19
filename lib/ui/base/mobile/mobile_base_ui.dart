import 'package:actiday/framework/controller/base/mobile/mobile_base_control.dart';
import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MobileBaseUi extends StatefulWidget {
  const MobileBaseUi({super.key});

  @override
  State<MobileBaseUi> createState() => _MobileBaseClassState();
}

class _MobileBaseClassState extends State<MobileBaseUi> {

  int currentInd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileBaseControl.bottomMenuData[currentInd].screenName,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.clrFaFaFa,
        items: MobileBaseControl.bottomMenuData.map((data) {
          return BottomNavigationBarItem(
            backgroundColor: AppColors.clrFaFaFa,
            icon: data.icon ?? Icon(Icons.disabled_by_default),
            label: data.iconName,
          );
        }).toList(),
        showUnselectedLabels: true,
        currentIndex: currentInd,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentInd = index;
          });
        },
      ),
    );
  }
}
