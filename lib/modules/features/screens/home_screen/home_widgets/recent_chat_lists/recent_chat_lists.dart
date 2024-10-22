import 'package:chateo/data/repositories/user_repository/user_repository.dart';
import 'package:chateo/modules/features/controllers/home_controller/home_controller.dart';
import 'package:chateo/modules/widgets/cached_image/custom_cached_image_stack/custom_cached_image_stack.dart';
import 'package:chateo/modules/widgets/circular_icon/circular_icon.dart';
import 'package:chateo/modules/widgets/custom_list_view/custom_list_view.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:chateo/utils/constants/app_colors/app_colors.dart';
import 'package:chateo/utils/constants/dimens/screen_height/screen_height.dart';
import 'package:chateo/utils/constants/dimens/screen_pixels/screen_pixels.dart';
import 'package:chateo/utils/extension/sized_box_extensions/sized_box_extensions.dart';
import 'package:chateo/utils/helper_functions/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecentChatList extends StatelessWidget {
  const RecentChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    var dark = HelperFunctions.isDarkerMode(context);
    return StreamBuilder(
        stream: UserRepository.instance.getChatList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // No connection has been established yet.
              return const Center(
                child: Text('No connection to the stream'),
              );

            case ConnectionState.waiting:
            // The stream is waiting for data (typically a loading state).
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.active:
            // The stream is actively providing data.
              if (snapshot.hasData) {
                var chatDocs = snapshot.data!.docs;
                return CListViewBuilder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenHeight.ten
                    ),
                    itemCount: chatDocs.length,
                    itemBuilder: (_, index) {
                      var chatData = chatDocs[index];
                      var fromId = chatData['fromId'];
                      var toId = chatData['toId'];
                      var unRead = chatData['unRead'];
                      var timeStamp = chatData["timeStamp"];
                      var currentUser = UserAuthentication.instance.user;
                      var otherUserId = currentUser!.uid == fromId
                          ? toId
                          : fromId;
                      var isReceiver = currentUser.uid == toId;
                      return InkWell(
                          onTap: () =>
                              _onChatTap(controller, index, otherUserId),
                          onLongPress: () =>
                              _onChatLongPress(controller, index),
                          child: FutureBuilder(
                              future: UserRepository.instance.getSpecificUser(
                                  fromId: otherUserId), builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return _loadingState();
                            }

                            if (snapshot.hasError) {
                              return _errorState();
                            }

                            if (!snapshot.hasData) {
                              return _emptyState();
                            }
                            var otherUserData = snapshot.data!;
                            return Obx(
                                  () =>
                                  _buildContainer(
                                      controller: controller,
                                      index: index,
                                      dark: dark,
                                      otherUserData: otherUserData,
                                      chatData: chatData,
                                      unRead: unRead,
                                      isReceiver: isReceiver,
                                      timeStamp: timeStamp
                                  ),
                            );
                          })
                      );
                    },
                    separatorBuilder: (_, index) {
                      return 10.height;
                    });
              } else {
                // Stream is active but no data has been received yet.
                return const Center(
                  child: Text('No data available'),
                );
              }

            case ConnectionState.done:
            // The stream has finished sending data and is closed.
              return const Center(
                child: Text('Stream has completed'),
              );

            default:
            // If none of the above cases match, handle an unexpected state.
              return const Center(
                child: Text('Something went wrong'),
              );
          }
        }
    );
  }

  /// User Info Container
  Container _buildContainer({required HomeController controller,
    required int index,
    required bool dark,
    required DocumentSnapshot<Map<String, dynamic>> otherUserData,
    required QueryDocumentSnapshot<Map<String, dynamic>> chatData,
    required String unRead,
    required bool isReceiver,
    required String timeStamp,
  }) {
    return Container(
      color: controller.selectedList.contains(
          index)
          ? (dark
          ? AppColors.blue003B5C
          : AppColors.blueF1F6FA)
          : null,
      padding: EdgeInsets.symmetric(
          horizontal: ScreenHeight.fifteen,
          vertical: ScreenHeight.ten),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .center,
        children: [
          CustomCachedImageStack(
            height: ScreenHeight.sixty,
            width: ScreenHeight.sixty,
            color: AppColors.blueA1B5D8
                .withOpacity(0.5),
            image: otherUserData.get(
                "profileImage"),
            imageRadius: ScreenHeight.fifty,
            positionRight: ScreenHeight.four,
            positionBottom: ScreenHeight.six,
            child: Container(
              height: ScreenHeight.eight,
              width: ScreenHeight.eight,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green0FE16D
              ),
            ),
            onTap: () {
              controller.showUserImageDialog(
                AppAssets.dummyImage,);
            },
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
            children: [
              SizedBox(
                width: Get.width*0.5,
                child: Text(otherUserData.get("name"),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenPixels.twenty,
                    fontWeight: FontWeight.w500,
                  ),),
              ),
              Text(chatData['lastMessage'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenPixels.twelve,
                  color: dark
                      ? AppColors.grey797C7B
                      : AppColors
                      .grey797C7B.withOpacity(
                      0.5),
                ),),

            ],
          ),
          const Spacer(),
          controller.selectedList.contains(index)
              ?
          _buildNotificationAndDelete()
              : _buildChatTimeAndCount(dark, unRead, isReceiver, timeStamp)
        ],
      ),
    );
  }

  /// handle notifications and delete
  Row _buildNotificationAndDelete() {
    return Row(
      children: [
        CircularIcon(
          svgIcon: AppAssets.icNotification,
          containerColor: AppColors
              .black000E08,
          onTap: () {},
        ),
        10.width,
        CircularIcon(
          svgIcon: AppAssets.icDelete,
          containerColor: AppColors
              .redEA3736,
          onTap: () {},
        ),
      ],
    );
  }

  /// handle Time and message count
  Column _buildChatTimeAndCount(bool dark, String unRead, bool isReceiver,
      String timeStamp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .end,
      children: [
        Text(formatTimeStamp(timeStamp), style: TextStyle(
          fontSize: ScreenPixels.twelve,
          color: dark
              ? AppColors.grey797C7B
              : AppColors
              .grey797C7B.withOpacity(0.5),
        ),),
        5.height,
        if (isReceiver && unRead.isNotEmpty)
          Container(
            padding: EdgeInsets.all(
                ScreenHeight.six),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.redF04A4C
            ),
            child: Text(unRead, style: TextStyle(
              fontSize: ScreenPixels.twelve,
              color: AppColors.white,
              fontWeight: FontWeight.w900,
            ),),
          ),
      ],
    );
  }

  /// Time stamps
  String formatTimeStamp(String timeStamp) {
    // convert timestamp date in DateTime
    var date = DateTime.parse(timeStamp);

    // convert date in "MM/dd/yy" format
    String getDate = DateFormat("MM/dd/yy").format(date);

    // Get today's date without the time component
    var today = DateTime.now();
    // Get yesterday date
    var yesterday = today.subtract(const Duration(days: 1));

    // difference between current date and message date
    final difference = today.difference(date);

    // Compare the full date (day, month, and year)
    if (date.year == today.year && date.month == today.month &&
        date.day == today.day) {
      if (difference.inSeconds < 60) {
        return "${difference.inSeconds} sec ago";
      } else if (difference.inMinutes >= 1 && difference.inMinutes < 60) {
        return "${difference.inMinutes} min ago";
      } else if (difference.inMinutes >= 60 && difference.inHours <= 10) {
        return "${difference.inHours} hr ago";
      } else {
        return "today";
      }
    } else if (date.year == yesterday.year && date.month == yesterday.month &&
        date.day == yesterday.day) {
      return "yesterday";
    } else {
      return getDate; // Otherwise, return the formatted time
    }
  }

  /// hand on Tap
  void _onChatTap(HomeController controller, int index, String fromId) {
    if (controller.selectedList.contains(index)) {
      controller.selectedList.remove(index);
    } else {
      if (controller.selectedList.isNotEmpty) {
        controller.selectedList.add(index);
      } else {
        controller.moveToSingleChat(fromId);
      }
    }
  }

  /// handle on long press
  void _onChatLongPress(HomeController controller, int index) {
    if (controller.selectedList.isEmpty) {
      controller.selectedList.add(index);
    } else if (controller.selectedList.contains(index)) {
      controller.selectedList.remove(index);
    } else {
      controller.selectedList.add(index);
    }
  }

  /// handle connection status
  Widget _loadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  /// handle connection status
  Widget _errorState() {
    return const Center(child: Text('Error loading user data'));
  }

  /// handle connection status
  Widget _emptyState() {
    return const Center(child: Text('No user data available'));
  }
}

