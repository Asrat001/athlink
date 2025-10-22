
const double cPadding = 24.0;
const double cBorderRadius = 5.0;
const double cLineSize = 6.0;
const double cDotSize = 7.0;
const double cSelectedDotSize = 14.0;
const double elevation=4.0;

// Buttons
const double cButtonSize = 48.0;
const double cButtonPadding = 10.0;

const double cSplashRadius = 32.0;
const double cSmallSplashRadius = 24.0;
class Podcast {
  final String imageUrl;
  final String title;
  final String host;
  final String duration;

  Podcast({
    required this.imageUrl,
    required this.title,
    required this.host,
    required this.duration,
  });
}
class Category {
  final String name;
  final String imageUrl;
  final String color;

  Category({required this.name, required this.imageUrl,required this.color});
}



final List<Podcast> podcasts = [
  Podcast(
    imageUrl: "https://picsum.photos/200/300?random=1",
    title: "The Future of AI",
    host: "John Doe",
    duration: "45 min",
  ),
  Podcast(
    imageUrl: "https://picsum.photos/200/300?random=2",
    title: "Flutter for Beginners",
    host: "Jane Smith",
    duration: "30 min",
  ),
  Podcast(
    imageUrl: "https://picsum.photos/200/300?random=3",
    title: "Mindfulness & Productivity",
    host: "Dr. Alex Green",
    duration: "25 min",
  ),
  Podcast(
    imageUrl: "https://picsum.photos/200/300?random=4",
    title: "Tech Trends Weekly",
    host: "Emily Brown",
    duration: "50 min",
  ),
];


final List<Category> categories = [
  Category(
    name: "Music",
    imageUrl: "https://i.pravatar.cc/150?img=11",
    color: "0xFF1DB954"
  ),
  Category(
    name: "Podcasts",
    imageUrl: "https://i.pravatar.cc/150?img=12",
    color: "0xFFE91E63"
  ),
  Category(
    name: "News",
    imageUrl: "https://i.pravatar.cc/150?img=13",
    color: "0xFF9C27B0"
  ),
  Category(
    name: "Sports",
    imageUrl: "https://i.pravatar.cc/150?img=14",
    color: "0xFF3F51B5"
  ),
  Category(
    name: "Tech",
    imageUrl: "https://i.pravatar.cc/150?img=15",
    color: "0xFF2196F3"
  ),
  Category(
    name: "Education",
    imageUrl: "https://i.pravatar.cc/150?img=16",
    color: "0xFF009688"
  ),
];

class RatioStation {
  final String name;
  final String description;
  final String stermingUrl;

  RatioStation({required this.name, required this.description, required this.stermingUrl});
}

final List<RatioStation> fakeDataList = [
  RatioStation(name: "Item 1", description: "First item description", stermingUrl: "https://stream-173.zeno.fm/cwkxynwagt5tv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJjd2t4eW53YWd0NXR2IiwiaG9zdCI6InN0cmVhbS0xNzMuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6IjVtRExyaG9yU1RpMjY1TnM1X0xzX3ciLCJpYXQiOjE3NTkyMjc5OTksImV4cCI6MTc1OTIyODA1OX0.4iF1_Q17gZ43UXLZSx3quVy_x6f2hr4SGmQTLz99KgU"),
  RatioStation(name: "Item 2", description: "Second item description", stermingUrl: "https://stream-155.zeno.fm/txxpndf1wwzuv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJ0eHhwbmRmMXd3enV2IiwiaG9zdCI6InN0cmVhbS0xNTUuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InBDQVdVX2I2Uzdlb2pyekdkdUx5LVEiLCJpYXQiOjE3NTkyMjgwNjEsImV4cCI6MTc1OTIyODEyMX0.yWWxCmVubk-b73NL0AOv3g01BiTyfBPKKUlik8_GBT8"),
  RatioStation(name: "Item 3", description: "Third item description", stermingUrl: "https://stream-159.zeno.fm/b8skbyqeqeruv?zt=eyJhbGciOiJIUzI1NiJ9.eyJzdHJlYW0iOiJiOHNrYnlxZXFlcnV2IiwiaG9zdCI6InN0cmVhbS0xNTkuemVuby5mbSIsInJ0dGwiOjUsImp0aSI6InJfTDdWMjZIVFZLVVZHTmdKbWVSZ0EiLCJpYXQiOjE3NTkyMzQ3MDcsImV4cCI6MTc1OTIzNDc2N30.w2yFt26j5kxI3YFvd5oEULYHgPCcHXZiLQf-SqmZ_XQ"),
  RatioStation(name: "Item 4", description: "Fourth item description", stermingUrl: "https://bisratfm-atunwadigital.streamguys1.com/bisratfm"),
];



//hashmethod

//// base url
const String cBaseUrl = 'http://139.59.141.150:4000/api/v1/';




// List Items
const double cListItemPadding = 18.0;
const double cListItemSpace = 12.0;

// Animations
const Duration cFastAnimationDuration = Duration(milliseconds: 150);
const Duration cTransitionDuration = Duration(milliseconds: 300);
const Duration cAnimationDuration = Duration(milliseconds: 500);
const Duration cAnimatedListDuration = Duration(milliseconds: 600);
//
String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter an email address';
  }

  // Regular expression for email validation
  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',
    caseSensitive: false,
  );

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Please enter a valid email address (e.g., user@domain.com)';
  }
  return null;
}
// BottomSheet
const double cBottomSheetBorderRadius = 28.0;
