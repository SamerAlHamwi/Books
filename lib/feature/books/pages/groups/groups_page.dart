
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../core/theme/app_color.dart';
import '../../data/category_json.dart';
import '../files/files_page.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        backgroundColor: AppColor.primaryColor,
        leading: const SizedBox(),
      ),
      backgroundColor: AppColor.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          getDateSection(),
          const SizedBox(
            height: 20,
          ),
          getListMyCloudItems(),
        ],
      ),
    ));
  }

  Widget getDateSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Date Modified",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              LineIcons.arrowDown,
              size: 20,
            )
          ],
        ),
      ],
    );
  }

  Widget getListMyCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(myCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FilesPage(
                          title: myCloudFilesContentJson[index]['title'],
                          fileCount: myCloudFilesContentJson[index]
                              ['file_count'],
                        )));
          },
          child: Stack(
            children: [
              Container(
                width: (size.width - 50) / 2,
                height: (size.width - 50) / 2,
                decoration: BoxDecoration(
                    color: AppColor.secondaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      myCloudFilesContentJson[index]['img'],
                      width: 55,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      myCloudFilesContentJson[index]['title'] +
                          " ( ${myCloudFilesContentJson[index]['file_count']} )",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Last Modified",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "2024/02/24 10:31 PM",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Opacity(
                  opacity: 0.2,
                  child: Icon(
                    index % 2 == 0 ? Icons.lock_open_outlined : Icons.lock_outline_rounded,
                    color: index % 2 == 0 ? AppColor.green : AppColor.red,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

}
