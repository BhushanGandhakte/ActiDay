import 'package:actiday/framework/controller/base/mobile/mobile_base_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileBaseUi extends StatefulWidget {
  const MobileBaseUi({super.key});

  @override
  State<MobileBaseUi> createState() => _MobileBaseClassState();
}

class _MobileBaseClassState extends State<MobileBaseUi> {

  final appBarList = MobileBaseControl.appBarData;
  //final bottomList = MobileBaseControl.bottomMenuData;

  int currentInd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16,8, 16, 0),
          child: SvgPicture.asset(
              'assets/mobile/drawer_logo.svg',
          ),
        ),
        title: centerTitle(),
        centerTitle: true,
        actions: [
         if(currentInd == 0)
         Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: Icon(
               Icons.notifications_none_rounded,
             size: 26,
           ),
         )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: MobileBaseControl.bottomMenuData.map((data) {
         // int index = MobileBaseControl.bottomMenuData.indexOf(data);
          return BottomNavigationBarItem(
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


  Widget centerTitle(){
    return currentInd == 0 ?  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Icon(
            Icons.location_on_outlined,
            size: 16,
          ),
        Text(
          appBarList[currentInd].title ?? 'NA',
          style: TextStyle(
              fontSize: 16
          ),
        )

      ],
    ) : Text(appBarList[currentInd].title ?? 'NA');
  }
}
