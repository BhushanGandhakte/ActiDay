import 'package:actiday/ui/utils/theme/app_colors.dart';
import 'package:actiday/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/theme/app_assets.dart';
import 'package:actiday/framework/repository/home/home_data.dart';
import '../../utils/widgets/common_container.dart';

class MobileHomeUi extends StatefulWidget {

  const MobileHomeUi({super.key});

  @override
  State<MobileHomeUi> createState() => _MobileHomeUiState();
}

class _MobileHomeUiState extends State<MobileHomeUi> {

  Banner1? banner1;
  Category? category;
  Welcome? welcome;

  @override
  void initState() {
    super.initState();
    loadWelcomeJson();
  }

  Future<void> loadWelcomeJson() async {
    final String response =
    await rootBundle.loadString('assets/json/home.json');

    final data = welcomeFromJson(response);

    setState(() {
      welcome = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(14,4, 16, 0),
          child: SvgPicture.asset(AppAssets.drawerLogo),
        ),
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
            ),
            CommonText(
                title: "Abu Dhabi, UAE",
                fontSize: 16
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 26,
            ),
          )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 44,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 0.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CommonText(
                        title: "yoga, pilates, massage",
                        fontSize: 12,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                          itemCount: welcome!.banner?.length,
                          itemBuilder: (context, index) {
                          final item = welcome!.banner;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CommonContainer(
                                height: 350,
                                width: 330,
                                borderRadius: 20,
                                color: AppColors.clrf0f5f9,
                                child:Image.network(
                                  item?[index].image ?? "https://tse3.mm.bing.net/th/id/OIP.1My7WFQE3wdhA_gcvBlcZgHaEu?w=596&h=380&rs=1&pid=ImgDetMain&o=7&rm=3",
                                  fit: BoxFit.fill,
                                )
                              ),
                            );
                          }
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
