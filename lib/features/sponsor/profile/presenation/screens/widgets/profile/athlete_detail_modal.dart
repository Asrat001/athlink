import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AthleteDetailModal extends StatelessWidget {
  final String athleteImage;
  final String athleteName;
  final String athletePosition;
  final String sponsorName;

  const AthleteDetailModal({
    super.key,
    required this.athleteImage,
    required this.athleteName,
    required this.athletePosition,
    required this.sponsorName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            _buildDragHandle(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAthleteImage(),
                  const SizedBox(height: 25),
                  _buildAthleteName(),
                  const SizedBox(height: 10),
                  _buildAthletePosition(),
                  const SizedBox(height: 20),
                  _buildSponsorInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 60,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildAthleteImage() {
    return Container(
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
          athleteImage,
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
    );
  }

  Widget _buildAthleteName() {
    return Text(
      athleteName,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildAthletePosition() {
    return Text(
      athletePosition,
      style: TextStyle(
        color: AppColors.lightGrey,
        fontSize: 18,
      ),
    );
  }

  Widget _buildSponsorInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        "Sponsored by $sponsorName. Tap anywhere to close.",
        style: TextStyle(
          color: AppColors.textGrey,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}