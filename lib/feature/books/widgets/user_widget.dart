

import 'package:books/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';
import '../../books/data/recent_files_json.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({super.key,}); //required this.bookModel

  // final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    recentFilesJson[1]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'User name',
                    style: TextStyle(
                        color: AppColor.black.withOpacity(0.8),
                        fontSize: 14
                    ),
                  ),
                  Text(
                    '23 edits / 12 check in file',
                    style: TextStyle(
                        color: AppColor.black.withOpacity(0.8),
                        fontSize: 12
                    ),
                  ),

                ],
              ),
            ],
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRouteName.usersPermissions);
            },
            child: Container(
              height: 25,
              width: 80,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                    'Invite'
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
