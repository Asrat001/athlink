import 'package:flutter/material.dart';
import 'dart:math';

class AthletesSponsored3d extends StatefulWidget {
  const AthletesSponsored3d({super.key});

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

  final List<WatchApp> _allApps = [
    WatchApp("Messages", Icons.chat, Colors.green),
    WatchApp("Phone", Icons.phone, Colors.green),
    WatchApp("Mail", Icons.mail, Colors.blue),
    WatchApp("Calendar", Icons.calendar_today, Colors.red),
    WatchApp("Photos", Icons.photo, Colors.purple),
    WatchApp("Maps", Icons.map, Colors.orange),
    // WatchApp("Weather", Icons.wb_sunny, Colors.orange),
    // WatchApp("Music", Icons.music_note, Colors.pink),
    // WatchApp("Podcasts", Icons.podcasts, Colors.purple),
    // WatchApp("Health", Icons.favorite, Colors.red),
    // WatchApp("Activity", Icons.directions_run, Colors.green),
    // WatchApp("Workout", Icons.fitness_center, Colors.green),
    // WatchApp("Sleep", Icons.nightlight, Colors.purple),
    // WatchApp("Mindfulness", Icons.self_improvement, Colors.teal),
    // WatchApp("Camera", Icons.camera_alt, Colors.grey),
    // WatchApp("Wallet", Icons.wallet, Colors.black),
    // WatchApp("Settings", Icons.settings, Colors.grey),
    // WatchApp("Notes", Icons.note, Colors.yellow),
    // WatchApp("Reminders", Icons.notifications, Colors.orange),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
    // WatchApp("Books", Icons.book, Colors.brown),
    // WatchApp("TV", Icons.tv, Colors.purple),
    // WatchApp("Stocks", Icons.trending_up, Colors.green),
    // WatchApp("Voice Memos", Icons.mic, Colors.purple),
    // WatchApp("Calculator", Icons.calculate, Colors.blue),
    // WatchApp("Clock", Icons.access_time, Colors.blue),
    // WatchApp("Compass", Icons.explore, Colors.orange),
    // WatchApp("Translate", Icons.translate, Colors.blue),
    // WatchApp("Shortcuts", Icons.play_arrow, Colors.purple),
    // WatchApp("Find Devices", Icons.devices, Colors.blue),
    // WatchApp("Emergency", Icons.emergency, Colors.red),
  ];

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Animated Background
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(
                  _horizontalOffset / 300,
                  _verticalOffset / 300,
                ),
                radius: 2.5,
                colors: [Color(0xFF2a1a2a), Color(0xFF1a1a2a), Colors.black],
                stops: [0.0, 0.3, 1.0],
              ),
            ),
          ),

          // Large Circular Globe Container
          Positioned(
            top: 100,
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
    const double itemSize = 65.0;
    const double spacing = 20.0;

    final double gridWidth = columns * (itemSize + spacing) + spacing;
    final int rows = (_allApps.length / columns).ceil();
    final double gridHeight = rows * (itemSize + spacing) + spacing;

    return SingleChildScrollView(
      controller: _verticalController,
      physics: const NeverScrollableScrollPhysics(), // Disable default physics
      child: SingleChildScrollView(
        controller: _horizontalController,
        scrollDirection: Axis.horizontal,
        physics:
            const NeverScrollableScrollPhysics(), // Disable default physics
        child: Container(
          width: gridWidth,
          height: gridHeight,
          padding: EdgeInsets.all(spacing),
          child: Stack(
            children: [
              // Animated Globe Background
              // _buildAnimatedGlobeBackground(),

              // All Grid Items
              for (int index = 0; index < _allApps.length; index++)
                _buildSmoothGlobeItem(
                  _allApps[index],
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
    WatchApp app,
    int index,
    int columns,
    double itemSize,
    double spacing,
    double gridWidth,
    double gridHeight,
  ) {
    final int row = index ~/ columns;
    final int col = index % columns;

    // Base grid position
    final double baseX = col * (itemSize + spacing);
    final double baseY = row * (itemSize + spacing);

    // Circular container bounds
    final double containerWidth = MediaQuery.of(context).size.width - 20;
    final double containerHeight = MediaQuery.of(context).size.height - 110;
    final double containerRadius = min(containerWidth, containerHeight) / 2;

    // Item center in scroll space
    final double itemCenterX = baseX + itemSize / 2;
    final double itemCenterY = baseY + itemSize / 2;

    // Circular container center
    final double containerCenterX = _horizontalOffset + containerWidth / 2;
    final double containerCenterY = _verticalOffset + containerHeight / 2;

    // Distance from container center
    final double deltaX = itemCenterX - containerCenterX;
    final double deltaY = itemCenterY - containerCenterY;
    final double distance = sqrt(deltaX * deltaX + deltaY * deltaY);

    // Check if item is within circular bounds
    final bool isWithinCircle = distance <= containerRadius;

    if (!isWithinCircle) {
      return const SizedBox.shrink();
    }

    // Smooth animation values
    final double normalizedDistance = distance / containerRadius;

    // Enhanced scaling - much larger center items
    final double scale = 1.4 - (normalizedDistance * 0.8); // 0.6 to 1.4 scale

    // Smooth opacity
    final double opacity = 1.0 - (normalizedDistance * 0.4);

    // Calculate angle for directional effects
    final double angle = atan2(deltaY, deltaX);

    // Enhanced 3D effects that respond to direction
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
          child: Container(
            width: itemSize,
            height: itemSize,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () => _showAppDetail(app),
                splashColor: app.color.withOpacity(0.3),
                highlightColor: app.color.withOpacity(0.2),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.9,
                      colors: [
                        app.color.withOpacity(0.5),
                        app.color.withOpacity(0.15),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: app.color.withOpacity(0.8),
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: app.color.withOpacity(0.4 * scale),
                        blurRadius: 20 * scale,
                        spreadRadius: 3 * scale,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(app.icon, color: Colors.white, size: 38 * scale),
                      SizedBox(height: 8 * scale),
                      Text(
                        app.name.split(' ').first,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13 * scale,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAppDetail(WatchApp app) {
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
              color: Colors.grey[900],
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
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: app.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(app.icon, color: app.color, size: 50),
                      ),
                      SizedBox(height: 25),
                      Text(
                        app.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Tap anywhere to close",
                        style: TextStyle(color: Colors.grey[400], fontSize: 16),
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

class WatchApp {
  final String name;
  final IconData icon;
  final Color color;

  WatchApp(this.name, this.icon, this.color);
}
