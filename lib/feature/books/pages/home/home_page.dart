

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_color.dart';
import '../../data/category_json.dart';
import '../../data/recent_files_json.dart';
import '../../widgets/book_widget.dart';
import '../add_file/add_file_page.dart';
import '../add_group/add_group_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: getBody(),
    );

  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          getStorageBox(),
          const SizedBox(height: 30,),
          getRecentFiles(),
          const SizedBox(height: 15,),
          getAddNewFiles(),
        ],
      ),
    ));
  }
  Widget getStorageBox(){
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(22)
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                          recentFilesJson[0]['img'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rafah Dakakni",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(padding: const EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
                          child: Text("1090 File",style: TextStyle(
                            fontSize: 16,
                            color: AppColor.white
                          ),),
                          ),

                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getRecentFiles(){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2,right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent Files",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(recentFilesJson.length, (index) {
                var fileType = "assets/icons/image.svg";
                if(recentFilesJson[index]['type'] == 'image'){
                  fileType = "assets/icons/image.svg";
                } else if(recentFilesJson[index]['type'] == 'video'){
                  fileType = "assets/icons/video.svg";
                }
                return const BookWidget();
                //   Padding(
                //   padding: const EdgeInsets.only(right: 15),
                //   child: Container(
                //     width: size.width*0.6,
                //     height: 160,
                //     decoration: BoxDecoration(
                //       color: AppColor.primaryColor,
                //       borderRadius: BorderRadius.circular(22),
                //       image: DecorationImage(image: NetworkImage(recentFilesJson[index]['img']),fit: BoxFit.cover)
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //           BlurryContainer(
                //             blur: 5,
                //             padding: EdgeInsets.zero,
                //             borderRadius: const BorderRadius.only(
                //               bottomLeft:Radius.circular(22),
                //               bottomRight:Radius.circular(22),
                //             ),
                //             child: Container(
                //               width: size.width*0.6,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                 color: AppColor.white.withOpacity(0.5)
                //               ),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Row(
                //                       children: [
                //                         SvgPicture.asset(fileType,color: AppColor.white,width: 15,),
                //                         const SizedBox(width: 10,),
                //                         Text(recentFilesJson[index]['file_name'],style: TextStyle(
                //                           color: AppColor.white.withOpacity(0.8)
                //                         ),),
                //                       ],
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           )
                //       ],
                //     ),
                //   ),
                // );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget getAddNewFiles(){
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2,right: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add new",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddGroupScreen()));
                    },
                    child: Container(
                      height: size.width * 0.45,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(22)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/add-group.png',width: 60,),
                          const SizedBox(height: 10,),
                          const Text('Add group',style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.w500
                          ),),
                          const SizedBox(height: 10,),
                          Text('45 group',style: TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.secondaryColor.withOpacity(0.5)
                          ),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddFilePage()));
                    },
                    child: Container(
                      height: size.width * 0.45,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(22)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/add-file.png',width: 60,),
                          const SizedBox(height: 10,),
                          const Text('Add file',style: TextStyle(
                              fontSize:15,
                              fontWeight: FontWeight.w500
                          ),),
                          const SizedBox(height: 10,),
                          Text('2039 file',style: TextStyle(
                              fontSize:14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.secondaryColor.withOpacity(0.5)
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
