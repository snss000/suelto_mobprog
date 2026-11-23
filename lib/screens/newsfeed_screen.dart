import 'package:suelto_mobprog/widgets/newsfeed_card.dart';
import 'package:material_ui/material_ui.dart';

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Stephanie Nicole Suelto',
          profileImage: 'assets/icons/pfp.jpg',
          postContent: 'suntukan sa ace hardware',
          date: '1 minute ago',
          numOfLikes: 69,
        ),
        NewsfeedCard(
          userName: 'Borderline Pinay Disorder',
          profileImage: 'assets/icons/bpdpfp.jpg',
          postContent: 'i ball or die',

          date: 'November 23, 2026',
          numOfLikes: 1004,
          hasImage: true,
        ),
      ],
    );
  }
}
