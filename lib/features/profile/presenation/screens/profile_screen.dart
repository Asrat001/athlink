import 'dart:io';
import 'dart:math';
import 'package:athlink/di.dart';
import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile_edit_page.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TransformationController _transformationController =
      TransformationController();

  File? _bannerImage;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Fetch profile data and sponsored athletes when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getProfile();
      ref.read(jobListProvider.notifier).fetchSponsoredAthletes();
    });
  }

  Future<void> _pickBannerImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _bannerImage = File(picked.path));
    }
  }

  Future<void> _pickProfileImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _profileImage = File(picked.path));
    }
  }

  bool isEditMode = false;

  Future<void> _handleProfileSave(
    String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  ) async {
    // Call the update API
    final success = await ref
        .read(profileProvider.notifier)
        .updateSponsorProfile(
          name: name,
          description: description,
          address: address,
          profileImage: profileImage,
          bannerImage: bannerImage,
        );

    if (success) {
      // Exit edit mode and clear local images after successful save
      if (mounted) {
        setState(() {
          isEditMode = false;
          _profileImage = null;
          _bannerImage = null;
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      // Show error message
      if (mounted) {
        final errorMessage =
            ref.read(profileProvider).errorMessage ??
            'Failed to update profile';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      }
    }
  }

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
            child: InkWell(
              onTap: isEditMode ? _pickBannerImage : null,
              child: _bannerImage != null
                  ? Image.file(
                      _bannerImage!,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                  : fullBannerUrl.isNotEmpty
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
              child: InkWell(
                onTap: isEditMode ? _pickProfileImage : null,
                child: _profileImage != null
                    ? Image.file(
                        _profileImage!,
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
                    : fullProfileUrl.isNotEmpty
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
                      ? ProfileEditPage(
                          sponsorProfile: sponsorProfile,
                          profileImage: _profileImage,
                          bannerImage: _bannerImage,
                          onSave: _handleProfileSave,
                        )
                      : Container(
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              CustomText(
                                title: sponsorProfile?.name ?? "No name set",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.black,
                              ),
                              CustomText(
                                title:
                                    sponsorProfile?.address ?? "No address set",
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
                                      "No description set",
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

                              Consumer(
                                builder: (context, ref, child) {
                                  final jobListState = ref.watch(
                                    jobListProvider,
                                  );

                                  if (jobListState.isSponsorshipsLoading) {
                                    return SizedBox(
                                      height: 400,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }

                                  if (jobListState.sponsorshipsErrorMessage !=
                                      null) {
                                    return SizedBox(
                                      height: 400,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              title:
                                                  'Error loading sponsored athletes',
                                              textColor: AppColors.red,
                                            ),
                                            SizedBox(height: 8),
                                            CustomText(
                                              title: jobListState
                                                  .sponsorshipsErrorMessage!,
                                              textColor: AppColors.grey,
                                              fontSize: 12,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  if (jobListState.sponsoredAthletes.isEmpty) {
                                    return SizedBox(
                                      height: 400,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              title:
                                                  'No sponsored athletes yet',
                                              textColor: AppColors.grey,
                                              fontSize: 16,
                                            ),
                                            SizedBox(height: 8),
                                            CustomText(
                                              title:
                                                  'Accept applicants in the Manage tab to see them here',
                                              textColor: AppColors.grey,
                                              fontSize: 12,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }

                                  // Extract images and names from sponsored athletes
                                  final athleteImages = jobListState
                                      .sponsoredAthletes
                                      .map((item) {
                                        final profileImageUrl = item
                                            .athlete
                                            .athleteProfile
                                            ?.profileImageUrl;
                                        if (profileImageUrl != null &&
                                            profileImageUrl.isNotEmpty) {
                                          return '$fileBaseUrl$profileImageUrl';
                                        }
                                        // Use a consistent placeholder based on athlete ID
                                        final idHash =
                                            item.athlete.id?.hashCode ?? 0;
                                        return 'https://picsum.photos/200?random=${idHash.abs()}';
                                      })
                                      .toList();

                                  final athleteNames = jobListState
                                      .sponsoredAthletes
                                      .map((item) {
                                        // Try to get name from various sources
                                        String? name =
                                            item.athlete.athleteProfile?.name ??
                                            item.athlete.name;

                                        // If no name, try to extract from email
                                        if (name == null || name.isEmpty) {
                                          final email = item.athlete.email;
                                          if (email != null &&
                                              email.isNotEmpty) {
                                            // Extract username from email (before @)
                                            name = email.split('@').first;
                                            // Capitalize first letter
                                            if (name.isNotEmpty) {
                                              name =
                                                  name[0].toUpperCase() +
                                                  name.substring(1);
                                            }
                                          }
                                        }

                                        return name ??
                                            'Athlete ${item.athlete.id?.substring(0, 8) ?? ""}';
                                      })
                                      .toList();

                                  final athletePositions = jobListState
                                      .sponsoredAthletes
                                      .map((item) {
                                        final position = item
                                            .athlete
                                            .athleteProfile
                                            ?.position;
                                        if (position != null &&
                                            position.isNotEmpty) {
                                          return position;
                                        }
                                        // Fallback to sport name if position is not available
                                        final sportName =
                                            item.athlete.sport.isNotEmpty
                                            ? item.athlete.sport.first.name
                                            : null;
                                        return sportName ??
                                            'Professional Athlete';
                                      })
                                      .toList();

                                  return SizedBox(
                                    height: 400,
                                    child: AthletesSponsored3d(
                                      athleteImages: athleteImages,
                                      athleteNames: athleteNames,
                                      athletePositions: athletePositions,
                                      sponsorName:
                                          sponsorProfile?.name ?? 'Sponsor',
                                    ),
                                  );
                                },
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
  final List<String> athletePositions;
  final String sponsorName;

  const AthletesSponsored3d({
    super.key,
    required this.athleteImages,
    required this.athleteNames,
    required this.athletePositions,
    required this.sponsorName,
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
    // //debugPrint('=== AthletesSponsored3d initState ===');
    // //debugPrint('Athletes count: ${widget.athleteImages.length}');
    _horizontalController.addListener(_onScroll);
    _verticalController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //debugPrint('PostFrameCallback - centering scrolls');
      if (_horizontalController.hasClients) {
        final maxH = _horizontalController.position.maxScrollExtent;
        final targetH = maxH / 2;
        //debugPrint('H: max=$maxH, target=$targetH');
        _horizontalController.jumpTo(targetH);
        setState(() {
          _horizontalOffset = targetH;
        });
      }

      if (_verticalController.hasClients) {
        final maxV = _verticalController.position.maxScrollExtent;
        final targetV = maxV / 2;
        //debugPrint('V: max=$maxV, target=$targetV');
        _verticalController.jumpTo(targetV);
        setState(() {
          _verticalOffset = targetV;
        });
      }
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
    return SizedBox(
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
    // For small number of athletes, use fewer columns to center better
    final int columns = widget.athleteImages.length <= 4 ? 3 : 7;
    final double baseItemSize = widget.athleteImages.length <= 4 ? 100.0 : 65.0;
    const double spacing = 10.0;

    final double itemSize = baseItemSize;
    final double gridWidth = columns * (itemSize + spacing) + spacing;
    final int rows = (widget.athleteImages.length / columns).ceil();
    final double gridHeight = rows * (itemSize + spacing) + spacing;

    // For small grids, add extra padding to make the grid larger and center it properly
    final bool isSmallGrid = widget.athleteImages.length <= 4;
    final double extraPadding = isSmallGrid ? 200.0 : 0.0;

    //debugPrint('=== AthletesSponsored3d Grid ===');
    //debugPrint('Athletes: ${widget.athleteImages.length}');
    //debugPrint('Columns: $columns, Rows: $rows');
    //debugPrint('ItemSize: $itemSize, Spacing: $spacing');
    //debugPrint('Grid: ${gridWidth}x$gridHeight, ExtraPadding: $extraPadding');
    //debugPrint('Total container: ${gridWidth + (extraPadding * 2)}x${gridHeight + (extraPadding * 2)}');

    return SingleChildScrollView(
      controller: _verticalController,
      physics: const NeverScrollableScrollPhysics(),
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: gridWidth + (extraPadding * 2),
          height: gridHeight + (extraPadding * 2),
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
                  extraPadding,
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
    double extraPadding,
  ) {
    final int row = index ~/ columns;
    final int col = index % columns;

    // Base position in the grid, THEN add extraPadding to center small grids
    final double baseX = col * (itemSize + spacing) + extraPadding;
    final double baseY = row * (itemSize + spacing) + extraPadding;

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

    if (index == 0) {
      //debugPrint('=== Item #0 Visibility Check ===');
      //debugPrint('Position: row=$row, col=$col');
      //debugPrint('Base: ($baseX, $baseY), Center: ($itemCenterX, $itemCenterY)');
      //debugPrint('Container: ${containerWidth}x$containerHeight, radius=$containerRadius');
      //debugPrint('ContainerCenter: ($containerCenterX, $containerCenterY)');
      //debugPrint('Offsets: H=$_horizontalOffset, V=$_verticalOffset');
      //debugPrint('Delta: ($deltaX, $deltaY), Distance: $distance');
      //debugPrint('IsVisible: $isWithinCircle (distance <= radius: $distance <= $containerRadius)');
    }

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
                        widget.athletePositions[index],
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Sponsored by ${widget.sponsorName}. Tap anywhere to close.",
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
