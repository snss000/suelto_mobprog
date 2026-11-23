import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suelto_mobprog/constant.dart';
import 'package:suelto_mobprog/widgets/custom_text.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final String? profileImage;
  final int? numOfLikes;
  final bool? hasImage;
  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.profileImage,
    this.numOfLikes,
    this.hasImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                profileImage == null
                    ? const Icon(Icons.person)
                    : CircleAvatar(
                        radius: ScreenUtil().setWidth(18),
                        backgroundImage: AssetImage(profileImage!),
                      ),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            // post Content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            hasImage == true
                ? const Image(image: AssetImage('assets/images/bod.jpg'))
                : SizedBox.shrink(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // print('Like button pressed');
                  },
                  icon: Icon(Icons.thumb_up, color: fbPrimary),
                  label: CustomText(
                    text: numOfLikes.toString(),
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.mode_comment_outlined, color: fbDarkPrimary),
                  label: CustomText(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.redo_outlined, color: fbDarkPrimary),
                  label: CustomText(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: fbDarkPrimary,
                  ),
                ),
              ],
            ),
            Divider(
              height: ScreenUtil().setHeight(1),
              thickness: 1,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(6),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: CommentSort(),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setWidth(10),
                  backgroundImage: const AssetImage('assets/icons/spfp.jpg'),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(8),
                  ),
                  height: ScreenUtil().setHeight(30),
                  width: ScreenUtil().setWidth(330),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setSp(10)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: 'Write a comment...',
                          fontSize: ScreenUtil().setSp(11),
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      const CommentIcon(icon: Icons.person_pin_circle_outlined),
                      const CommentIcon(icon: Icons.emoji_emotions_outlined),
                      const CommentIcon(icon: Icons.camera_alt_outlined),
                      const CommentIcon(icon: Icons.gif_box_outlined),
                      const CommentIcon(icon: Icons.sticky_note_2_outlined),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class CommentSort extends StatefulWidget {
  const CommentSort({super.key});

  @override
  State<CommentSort> createState() => CommentSortState();
}

class CommentSortState extends State<CommentSort> {
  String selectedSort = 'Most relevant';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (sort) => setState(() => selectedSort = sort),
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'Most relevant', child: Text('Most relevant')),
        PopupMenuItem(value: 'Newest', child: Text('Newest')),
        PopupMenuItem(value: 'All comments', child: Text('All comments')),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: selectedSort,
            fontSize: ScreenUtil().setSp(10),
            fontWeight: FontWeight.bold,
            color: Colors.grey[700]!,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey[700],
            size: ScreenUtil().setSp(16),
          ),
        ],
      ),
    );
  }
}

class CommentIcon extends StatelessWidget {
  const CommentIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[600], size: ScreenUtil().setSp(13)),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tightFor(
        width: ScreenUtil().setWidth(20),
        height: ScreenUtil().setHeight(20),
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}
