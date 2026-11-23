# suelto_mobprog

# Lab Activity 1: Discussion

Integrating Images in the Newsfeed

+ Post Photos: `NewsfeedCard` uses Flutter’s `Image` widget to show photos inside a post.
+ Showing or Hiding Photos: The `hasImage` setting decides if a photo appears.
+ How It Works in the Code: In `newsfeed_screen.dart`, the Borderline Pinay Disorder post sets `hasImage: true`, which displays `assets/images/bod.jpg`. If `hasImage` is off (`false`) or left out, the app uses `SizedBox.shrink()` so there isn't an awkward empty space.

Profile Pictures

The author's profile picture is separate from the photo in the post. `NewsfeedCard` gets the author's picture from the `profileImage` setting:

+ Stephanie Nicole Suelto uses `assets/icons/pfp.jpg`.
+ The Borderline Pinay Disorder page uses `assets/icons/bpdpfp.jpg`.

The card puts this picture inside a `CircleAvatar` (a round icon). If no picture is provided, it shows a basic default person icon instead.

Comment Box Avatar

The tiny picture next to “Write a comment...” belongs to the person writing the comment, not the person who made the post. Right now, it uses `assets/icons/spfp.jpg` (the gothic girl behind the mask from my spam account). Since this image is typed directly into `newsfeed_card.dart`, that same spam account picture shows up under both posts.