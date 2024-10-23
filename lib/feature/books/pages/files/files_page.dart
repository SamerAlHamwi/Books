
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/theme/app_color.dart';
import '../../data/recent_files_json.dart';
import '../../widgets/book_widget.dart';

class FilesPage extends StatefulWidget {
  final String title;
  final String fileCount;
  
  const FilesPage({ super.key,required this.title,required this.fileCount });

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {


  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }
  Widget getAppBar(){
    return AppBar(
      backgroundColor: AppColor.white,
      elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(LineIcons.arrowLeft,color: AppColor.black,)),
      title: Text("${widget.title} (${widget.fileCount})",style: TextStyle(
        color: AppColor.black,
        fontSize: 17
      ),),
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          getTabs(),
          const SizedBox(height: 10,),
          getDateSection(),
          const SizedBox(height: 20,),
          getItemLists()
        ],
      ),
    );
  }


  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          pageIndex == 0
              ? Flexible(
              child: ElasticIn(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "All Files",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
              : GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: (size.width - 45) / 2,
                height: 50,
                decoration: BoxDecoration(
                  // color: primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "All Files",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.secondaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          pageIndex == 1
              ? Flexible(
              child: ElasticIn(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Archived",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
              : GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: (size.width - 45) / 2,
                height: 50,
                decoration: BoxDecoration(
                  // color: primary,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Archived",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.secondaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getDateSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Text("Date Modified",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(width: 2,),
            Icon(LineIcons.arrowDown,size: 20,)
          ],
        ),
        IconButton(onPressed: (){

        }, icon: Icon(LineIcons.borderAll,color: AppColor.black.withOpacity(0.5),))
      ],
    );
  }

  Widget getItemLists(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(9, (index) {
          return const BookWidget();
        }),
      ),
    );
  }
}