import 'dart:math';
import 'package:athlink/di.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile_edit_page.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    // Fetch profile data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getProfile();
    });
  }

  final List<String> athleteImages = List.generate(
    75,
    (i) => "https://picsum.photos/200?random=${i + 1}",
  );

  bool isEditMode = false;

  final List<String> athleteNames = [
    "LeBron James",
    "Serena Williams",
    "Cristiano Ronaldo",
    "Simone Biles",
    "Usain Bolt",
    "Megan Rapinoe",
    "Michael Phelps",
    "Naomi Osaka",
    "Stephen Curry",
    "Alex Morgan",
    "Roger Federer",
    "Katie Ledecky",
    "Lionel Messi",
    "Shaun White",
    "Novak Djokovic",
    "Allyson Felix",
    "Kevin Durant",
    "Carli Lloyd",
    "Rafael Nadal",
    "Simone Manuel",
    "Giannis Antetokounmpo",
    "Mikaela Shiffrin",
    "Patrick Mahomes",
    "Chloe Kim",
    "Tom Brady",
    "Diana Taurasi",
    "Aaron Rodgers",
    "Lindsey Vonn",
    "Mike Trout",
    "Sue Bird",
    "Bryce Harper",
    "Misty May-Treanor",
    "Drew Brees",
    "Kerri Walsh",
    "Clayton Kershaw",
    "Ronda Rousey",
    "Russell Wilson",
    "Hope Solo",
    "James Harden",
    "Maria Sharapova",
    "Anthony Davis",
    "Venus Williams",
    "Kawhi Leonard",
    "Gabby Douglas",
    "Kyrie Irving",
    "Sydney McLaughlin",
    "Damian Lillard",
    "Katarina Johnson",
    "Joel Embiid",
    "Nelly Korda",
    "Allyson Felix",
    "Kevin Durant",
    "Carli Lloyd",
    "Rafael Nadal",
    "Simone Manuel",
    "Giannis Antetokounmpo",
    "Mikaela Shiffrin",
    "Patrick Mahomes",
    "Chloe Kim",
    "Tom Brady",
    "Diana Taurasi",
    "Aaron Rodgers",
    "Lindsey Vonn",
    "Mike Trout",
    "Sue Bird",
    "Bryce Harper",
    "Misty May-Treanor",
    "Drew Brees",
    "Kerri Walsh",
    "Clayton Kershaw",
    "Ronda Rousey",
    "Russell Wilson",
    "Hope Solo",
    "James Harden",
    "Maria Sharapova",
    "Anthony Davis",
    "Venus Williams",
    "Kawhi Leonard",
    "Gabby Douglas",
    "Kyrie Irving",
    "Sydney McLaughlin",
    "Damian Lillard",
    "Katarina Johnson",
    "Joel Embiid",
    "Nelly Korda",
  ];

  Widget _buildHeader(
    BuildContext context,
    String? bannerUrl,
    String? profileImageUrl,
  ) {
    const double bannerHeight = 250;
    const double logoCircleRadius = 50;

    final String fullBannerUrl = UrlHelper.getFullImageUrl(bannerUrl);
    final String fullProfileUrl = UrlHelper.getFullImageUrl(profileImageUrl);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: bannerHeight,
          decoration: const BoxDecoration(color: AppColors.extraLightGrey),
        ),

        Positioned.fill(
          child: Opacity(
            opacity: 0.9,
            child: fullBannerUrl.isNotEmpty
                ? Image.network(
                    fullBannerUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: AppColors.extraLightGrey);
                    },
                  )
                : Container(color: AppColors.extraLightGrey),
          ),
        ),

        Positioned(
          bottom: 5,
          right: 20,
          child: InkWell(
            onTap: () {
              setState(() {
                isEditMode = !isEditMode;
              });
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              child: SvgPicture.asset(
                "assets/images/edit.svg",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: InkWell(
            onTap: () {
              final storageService = sl<LocalStorageService>();
              storageService.deleteAccessToken();
              storageService.deleteUserData();
              GoRouter.of(context).go(Routes.loginRouteName);
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              child: Icon(Icons.logout, color: AppColors.black),
            ),
          ),
        ),

        Positioned(
          bottom: 110,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(
                alpha: 0.7,
              ), // Fixed method name
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow,
              color: AppColors.black,
              size: 20,
            ),
          ),
        ),

        Positioned(
          bottom: -15,
          child: Container(
            width: logoCircleRadius * 2,
            height: logoCircleRadius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              border: Border.all(color: AppColors.white, width: 7),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.textGrey, // Used textGrey for shadow
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(logoCircleRadius),
              child: fullProfileUrl.isNotEmpty
                  ? Image.network(
                      fullProfileUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.extraLightGrey,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.grey,
                          ),
                        );
                      },
                    )
                  : Image.asset('assets/images/on1.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);
    final profileUser = profileState.profileUser;
    final sponsorProfile = profileUser?.sponsorProfile;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: profileState.isLoading && profileUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  _buildHeader(
                    context,
                    sponsorProfile?.bannerImageUrl,
                    sponsorProfile?.profileImageUrl,
                  ),

                  isEditMode
                      ? ProfileEditPage()
                      : Container(
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              CustomText(
                                title:
                                    sponsorProfile?.name ?? "Sp Sport Agency",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.black,
                              ),
                              CustomText(
                                title:
                                    sponsorProfile?.address ??
                                    "Los Angeles, CA",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.textGrey,
                              ),
                              SizedBox(height: 30),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: _StatItem(
                                        value:
                                            "${sponsorProfile?.stats.sponsorshipCampaigns ?? 0}",
                                        label: "Sponsorship Campaigns",
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: AppColors.divider,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    Expanded(
                                      child: _StatItem(
                                        value:
                                            "${sponsorProfile?.stats.athletesSponsored ?? 0}",
                                        label: "Athletes Represented",
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: AppColors.divider,
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    Expanded(
                                      child: _StatItem(
                                        value:
                                            "${sponsorProfile?.stats.globalPartners ?? 0}",
                                        label: "Global Partners",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 30),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: CustomText(
                                  title:
                                      sponsorProfile?.description ??
                                      "SponsorPro is a global sports sponsorship agency connecting athletes with brands. "
                                          "We specialize in football, athletics, and racket sports, helping companies find the "
                                          "right talent for their campaigns.",
                                  textAlign: TextAlign.center,
                                  textColor: AppColors.textSecondary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  SizedBox(width: 24),
                                  const CustomText(
                                    title: "Athletes Sponsored",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    textColor: AppColors.textPrimary,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              SizedBox(
                                height: 400,
                                child: AthletesSponsored3d(
                                  athleteImages: athleteImages,
                                  athleteNames: athleteNames,
                                ),
                              ),

                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                  PostFeedSection(
                    jobPosts: sponsorProfile?.jobPosts,
                    sponsorProfile: sponsorProfile,
                    profileUser: profileUser,
                  ),
                  // PostCardPage(),
                ],
              ),
            ),
    );
  }
}

class AthletesSponsored3d extends StatefulWidget {
  final List<String> athleteImages;
  final List<String> athleteNames;

  const AthletesSponsored3d({
    super.key,
    required this.athleteImages,
    required this.athleteNames,
  });

  @override
  State<AthletesSponsored3d> createState() => _AthletesSponsored3dState();
}

class _AthletesSponsored3dState extends State<AthletesSponsored3d> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();
  double _horizontalOffset = 0.0;
  double _verticalOffset = 0.0;
  Offset _startPanOffset = Offset.zero;
  bool _isPanning = false;

  @override
  void initState() {
    super.initState();
    _horizontalController.addListener(_onScroll);
    _verticalController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _horizontalController.jumpTo(
        _horizontalController.position.maxScrollExtent / 2,
      );
      _verticalController.jumpTo(
        _verticalController.position.maxScrollExtent / 2,
      );
    });
  }

  void _onScroll() {
    if (!_isPanning) {
      setState(() {
        _horizontalOffset = _horizontalController.offset;
        _verticalOffset = _verticalController.offset;
      });
    }
  }

  void _handlePanStart(DragStartDetails details) {
    _startPanOffset = details.localPosition;
    _isPanning = true;
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    final double deltaX = details.delta.dx;
    final double deltaY = details.delta.dy;

    // Calculate new positions with proper bounds checking
    double newHorizontalOffset = _horizontalOffset - deltaX * 1.2;
    double newVerticalOffset = _verticalOffset - deltaY * 1.2;

    // Apply bounds
    newHorizontalOffset = newHorizontalOffset.clamp(
      0.0,
      _horizontalController.position.maxScrollExtent,
    );
    newVerticalOffset = newVerticalOffset.clamp(
      0.0,
      _verticalController.position.maxScrollExtent,
    );

    // Update positions directly for immediate response
    _horizontalController.jumpTo(newHorizontalOffset);
    _verticalController.jumpTo(newVerticalOffset);

    setState(() {
      _horizontalOffset = newHorizontalOffset;
      _verticalOffset = newVerticalOffset;
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    _isPanning = false;

    // Add momentum for natural feel
    final double velocityX = details.velocity.pixelsPerSecond.dx / 1000;
    final double velocityY = details.velocity.pixelsPerSecond.dy / 1000;

    if (velocityX.abs() > 1.0 || velocityY.abs() > 1.0) {
      double momentumHorizontal = _horizontalOffset - velocityX * 50;
      double momentumVertical = _verticalOffset - velocityY * 50;

      momentumHorizontal = momentumHorizontal.clamp(
        0.0,
        _horizontalController.position.maxScrollExtent,
      );
      momentumVertical = momentumVertical.clamp(
        0.0,
        _verticalController.position.maxScrollExtent,
      );

      _horizontalController.animateTo(
        momentumHorizontal,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
      _verticalController.animateTo(
        momentumVertical,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  void dispose() {
    _horizontalController.removeListener(_onScroll);
    _verticalController.removeListener(_onScroll);
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            bottom: 10,
            child: _buildLargeCircularGlobe(),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCircularGlobe() {
    return GestureDetector(
      onPanStart: _handlePanStart,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      behavior: HitTestBehavior.opaque,
      child: ClipOval(child: _buildSmoothGlobeScroll()),
    );
  }

  Widget _buildSmoothGlobeScroll() {
    const int columns = 7;
    final double baseItemSize = widget.athleteImages.length <= 4 ? 100.0 : 65.0;
    const double spacing = 10.0;

    final double itemSize = baseItemSize;
    final double gridWidth = columns * (itemSize + spacing) + spacing;
    final int rows = (widget.athleteImages.length / columns).ceil();
    final double gridHeight = rows * (itemSize + spacing) + spacing;

    return SingleChildScrollView(
      controller: _verticalController,
      physics: const NeverScrollableScrollPhysics(),
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: gridWidth,
          height: gridHeight,
          padding: EdgeInsets.all(spacing),
          child: Stack(
            children: [
              for (int index = 0; index < widget.athleteImages.length; index++)
                _buildSmoothGlobeItem(
                  index,
                  columns,
                  itemSize,
                  spacing,
                  gridWidth,
                  gridHeight,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmoothGlobeItem(
    int index,
    int columns,
    double itemSize,
    double spacing,
    double gridWidth,
    double gridHeight,
  ) {
    final int row = index ~/ columns;
    final int col = index % columns;

    final double baseX = col * (itemSize + spacing);
    final double baseY = row * (itemSize + spacing);

    final double containerWidth = MediaQuery.of(context).size.width - 20;
    final double containerHeight = 360;
    final double containerRadius = min(containerWidth, containerHeight) / 2;

    final double itemCenterX = baseX + itemSize / 2;
    final double itemCenterY = baseY + itemSize / 2;

    final double containerCenterX = _horizontalOffset + containerWidth / 2;
    final double containerCenterY = _verticalOffset + containerHeight / 2;

    final double deltaX = itemCenterX - containerCenterX;
    final double deltaY = itemCenterY - containerCenterY;
    final double distance = sqrt(deltaX * deltaX + deltaY * deltaY);

    final bool isWithinCircle = distance <= containerRadius;

    if (!isWithinCircle) {
      return const SizedBox.shrink();
    }

    final double normalizedDistance = distance / containerRadius;

    final double scale = widget.athleteImages.length <= 4
        ? 1.8 - (normalizedDistance * 0.8)
        : 1.4 - (normalizedDistance * 0.8);

    final double opacity = 1.0 - (normalizedDistance * 0.4);

    final double rotationX = -deltaY / 600;
    final double rotationY = deltaX / 600;
    final double translateZ = (1 - normalizedDistance) * 40;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 120),
      curve: Curves.easeOut,
      left: baseX,
      top: baseY,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0005)
          ..translate(0.0, 0.0, translateZ)
          ..rotateX(rotationX)
          ..rotateY(rotationY)
          ..scale(scale),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: opacity.clamp(0.6, 1.0),
          child: SizedBox(
            width: itemSize,
            height: itemSize,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(itemSize / 2),
                onTap: () => _showAthleteDetail(index),
                splashColor: AppColors.primary.withValues(alpha: 0.3),
                highlightColor: AppColors.primary.withValues(alpha: 0.2),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0.8),
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4 * scale),
                        blurRadius: 20 * scale,
                        spreadRadius: 3 * scale,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Stack(
                      children: [
                        // Athlete Image
                        Image.network(
                          widget.athleteImages[index],
                          width: itemSize,
                          height: itemSize,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: itemSize,
                              height: itemSize,
                              color: AppColors.lightGrey,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: itemSize,
                              height: itemSize,
                              color: AppColors.lightGrey,
                              child: Icon(
                                Icons.person,
                                color: AppColors.grey,
                                size: itemSize * 0.5,
                              ),
                            );
                          },
                        ),

                        // Gradient overlay for better text visibility
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppColors.black.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                        ),

                        // Athlete Name
                        Positioned(
                          bottom: 8,
                          left: 4,
                          right: 4,
                          child: Column(
                            children: [
                              Text(
                                widget.athleteNames[index].split(' ').first,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: max(10 * scale, 10),
                                  fontWeight: FontWeight.w600,
                                  height: 1.1,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (scale > 1.2)
                                Text(
                                  widget.athleteNames[index].split(' ').last,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: max(9 * scale, 9),
                                    fontWeight: FontWeight.w500,
                                    height: 1.1,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAthleteDetail(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            widget.athleteImages[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.lightGrey,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.grey,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        widget.athleteNames[index],
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Professional Athlete",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Sponsored by SP Sport Agency. Tap anywhere to close.",
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: value,
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: AppColors.black,
          ),
          const SizedBox(height: 4),
          CustomText(
            title: label,

            textAlign: TextAlign.center,

            fontSize: 13,
            textColor: AppColors.grey,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
