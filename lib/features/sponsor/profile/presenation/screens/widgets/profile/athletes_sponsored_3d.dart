import 'dart:math';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'athlete_detail_modal.dart';

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
    _initializeControllers();
  }

  void _initializeControllers() {
    _horizontalController.addListener(_onScroll);
    _verticalController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerScrollPositions();
    });
  }

  void _centerScrollPositions() {
    if (_horizontalController.hasClients) {
      final maxH = _horizontalController.position.maxScrollExtent;
      final targetH = maxH / 2;
      _horizontalController.jumpTo(targetH);
      setState(() {
        _horizontalOffset = targetH;
      });
    }

    if (_verticalController.hasClients) {
      final maxV = _verticalController.position.maxScrollExtent;
      final targetV = maxV / 2;
      _verticalController.jumpTo(targetV);
      setState(() {
        _verticalOffset = targetV;
      });
    }
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

    double newHorizontalOffset = _horizontalOffset - deltaX * 1.2;
    double newVerticalOffset = _verticalOffset - deltaY * 1.2;

    newHorizontalOffset = newHorizontalOffset.clamp(
      0.0,
      _horizontalController.position.maxScrollExtent,
    );
    newVerticalOffset = newVerticalOffset.clamp(
      0.0,
      _verticalController.position.maxScrollExtent,
    );

    _horizontalController.jumpTo(newHorizontalOffset);
    _verticalController.jumpTo(newVerticalOffset);

    setState(() {
      _horizontalOffset = newHorizontalOffset;
      _verticalOffset = newVerticalOffset;
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    _isPanning = false;
    _applyMomentum(details.velocity);
  }

  void _applyMomentum(Velocity velocity) {
    final double velocityX = velocity.pixelsPerSecond.dx / 1000;
    final double velocityY = velocity.pixelsPerSecond.dy / 1000;

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
    final int columns = widget.athleteImages.length <= 4 ? 3 : 7;
    final double baseItemSize = widget.athleteImages.length <= 4 ? 100.0 : 65.0;
    const double spacing = 10.0;

    final double itemSize = baseItemSize;
    final double gridWidth = columns * (itemSize + spacing) + spacing;
    final int rows = (widget.athleteImages.length / columns).ceil();
    final double gridHeight = rows * (itemSize + spacing) + spacing;

    final bool isSmallGrid = widget.athleteImages.length <= 4;
    final double extraPadding = isSmallGrid ? 200.0 : 0.0;

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
          child: _buildAthleteCircle(index, itemSize, scale),
        ),
      ),
    );
  }

  Widget _buildAthleteCircle(int index, double itemSize, double scale) {
    return SizedBox(
      width: itemSize,
      height: itemSize,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(itemSize / 2),
          onTap: () => _showAthleteDetail(index),
          splashColor: AppColors.primary.withOpacity(0.3),
          highlightColor: AppColors.primary.withOpacity(0.2),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withOpacity(0.8),
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4 * scale),
                  blurRadius: 20 * scale,
                  spreadRadius: 3 * scale,
                ),
              ],
            ),
            child: ClipOval(
              child: Stack(
                children: [
                  _buildAthleteImage(index, itemSize),
                  _buildImageOverlay(),
                  _buildAthleteName(index, scale),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAthleteImage(int index, double itemSize) {
    return Image.network(
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
              value: loadingProgress.expectedTotalBytes != null
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
    );
  }

  Widget _buildImageOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }

  Widget _buildAthleteName(int index, double scale) {
    return Positioned(
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
    );
  }

  void _showAthleteDetail(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return AthleteDetailModal(
          athleteImage: widget.athleteImages[index],
          athleteName: widget.athleteNames[index],
          athletePosition: widget.athletePositions[index],
          sponsorName: widget.sponsorName,
        );
      },
    );
  }
}