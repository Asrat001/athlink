import 'package:athlink/features/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum JobsView { listing, applicants }

enum ApplicantTab { newApplicants, invitees }

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  // Dummy jobs (same as yours)
  final List<Map<String, dynamic>> jobs = const [
    {
      "agencyLogo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
      "agencyName": "SP Sport Agency",
      "location": "Los Angeles, CA",
      "price": "500\$/m",
      "title": "Ambassador Deal",
      "tags": ["#Social Media Post", "#Model", "#Event speaker", "#Poster Ad"],
      "notifications": 9,
    },
    {
      "agencyLogo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
      "agencyName": "Quartz",
      "location": "New York, NY",
      "price": "750\$/m",
      "title": "Brand Ambassador Deal",
      "tags": ["#Reel", "#Model", "#Ambassador"],
      "notifications": 2,
    },
  ];

  // Dummy applicants
  final List<Map<String, dynamic>> newApplicants = [
    {
      "name": "Mariya Osteen",
      "club": "NY Woman's Flag Football",
      "age": 21,
      "rating": 4.9,
      "reviews": 726,
      "image":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
    {
      "name": "Ava Johnson",
      "club": "LA Fitness Team",
      "age": 25,
      "rating": 4.7,
      "reviews": 432,
      "image":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
    {
      "name": "Lina Gomez",
      "club": "NY Woman's Flag Football",
      "age": 20,
      "rating": 4.8,
      "reviews": 512,
      "image":
          "https://images.unsplash.com/photo-1545996124-1a7f9b545f7d?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
  ];

  final List<Map<String, dynamic>> invitees = [
    {
      "name": "Kara Smith",
      "club": "Chicago Elite",
      "age": 27,
      "rating": 4.5,
      "reviews": 210,
      "image":
          "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
  ];

  // UI state
  JobsView currentView = JobsView.listing;
  int? selectedJobIndex;
  ApplicantTab activeApplicantTab = ApplicantTab.newApplicants;

  void _openCreateJobModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const CreateJobModal(),
    );
  }

  void _showApplicantsForJob(int index) {
    setState(() {
      selectedJobIndex = index;
      currentView = JobsView.applicants;
      activeApplicantTab = ApplicantTab.newApplicants;
    });
  }

  void _backToListing() {
    setState(() {
      currentView = JobsView.listing;
      selectedJobIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.greyScaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.greyScaffoldBackground,
          elevation: 0,
          toolbarHeight: 65,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          // if you have svg assets, keep these; else replace with Icon(Icons.search)
                          // SvgPicture.asset('assets/images/search.svg'),
                          const Icon(Icons.search, color: AppColors.lightGrey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/images/filter.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.extraLightGrey,
                    width: 0.5,
                  ),
                ),
              ),
              child: const TabBar(
                indicatorColor: AppColors.primary,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.grey,
                indicatorWeight: 2.5,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(text: 'Jobs'),
                  Tab(text: 'Sponsorship'),
                ],
              ),
            ),

            // Main content: either Jobs listing or Applicants view
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: currentView == JobsView.listing
                    ? _buildJobsContent(context)
                    : _buildApplicantsContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- Jobs Listing ----------------
  Widget _buildJobsContent(BuildContext context) {
    if (jobs.isEmpty) {
      return _buildEmptyJobs(context);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem("Jobs Posted", jobs.length.toString()),
              _statItem("Funds Released", "\$0"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CustomText(
                title: 'Your previous Job Posts',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _openCreateJobModal(context);
                },
                child: const Icon(
                  Icons.add,
                  size: 26,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // job cards
          Column(
            children: List.generate(
              jobs.length,
              (index) => GestureDetector(
                onTap: () => _showApplicantsForJob(index),
                child: _jobCard(jobs[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        CustomText(title: label, fontSize: 14, textColor: AppColors.grey),
        const SizedBox(height: 6),
        CustomText(title: value, fontSize: 18, fontWeight: FontWeight.w700),
      ],
    );
  }

  Widget _jobCard(Map<String, dynamic> job) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Row(
            children: [
              // avatar with ring + online dot
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.black,
                        backgroundImage: NetworkImage(job["agencyLogo"]),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 4,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // title + subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: job["agencyName"],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  CustomText(
                    title: job["location"],
                    fontSize: 14,
                    textColor: AppColors.grey,
                  ),
                ],
              ),
              const Spacer(),
              // more icon
              const Icon(Icons.more_vert, size: 22, color: AppColors.lightGrey),
            ],
          ),

          const SizedBox(height: 16),

          // price + title
          CustomText(
            title: job["price"],
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          CustomText(
            title: job["title"],
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),

          const SizedBox(height: 12),
          const Divider(color: AppColors.extraLightGrey, height: 1),

          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: job["tags"]
                .map<Widget>(
                  (tag) => CustomText(
                    title: tag,
                    fontSize: 14,
                    textColor: AppColors.blue,
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.share_outlined, size: 22, color: AppColors.lightGrey),
              SizedBox(width: 30),
              Icon(Icons.favorite, size: 22, color: Colors.red),
              SizedBox(width: 30),
              Icon(Icons.bookmark_border, size: 22, color: AppColors.lightGrey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyJobs(BuildContext context) {
    final double appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    const double tabBarHeight = 48;
    final double viewportHeight =
        MediaQuery.of(context).size.height - appBarHeight - tabBarHeight;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: viewportHeight * 0.15),
              const Center(
                child: CustomText(
                  title: 'No job posted yet',
                  textColor: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RoundedButton(
                  label: 'Create a job post',
                  onPressed: () {},
                  height: 50,
                  borderRadius: 8,
                  backgroundColor: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Applicants view ----------------
  Widget _buildApplicantsContent(BuildContext context) {
    final job = jobs[selectedJobIndex ?? 0];
    return Column(
      key: const ValueKey('applicants_view'),
      children: [
        // top header card (job summary + back)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // back arrow
              GestureDetector(
                onTap: _backToListing,
                child: const Icon(Icons.arrow_back, color: AppColors.lightGrey),
              ),
              const SizedBox(width: 12),
              // logo
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(job["agencyLogo"]),
              ),
              const SizedBox(width: 12),
              // title + view detail
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: job["title"],
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      title: 'View detail',
                      fontSize: 14,
                      textColor: AppColors.primary.withOpacity(0.85),
                    ),
                  ],
                ),
              ),

              // badge
              if (job["notifications"] != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.18),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CustomText(
                    title: job["notifications"].toString(),
                    fontSize: 12,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),

        // segmented tabs: New applicants | Invitees
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Row(
            children: [
              _applicantTabButton(ApplicantTab.newApplicants, "New applicants"),
              const SizedBox(width: 16),
              _applicantTabButton(ApplicantTab.invitees, "Invitees"),
            ],
          ),
        ),

        // applicant list (only this area scrolls)
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: activeApplicantTab == ApplicantTab.newApplicants
                  ? newApplicants.length
                  : invitees.length,
              separatorBuilder: (_, __) => const SizedBox(height: 18),
              itemBuilder: (context, idx) {
                final applicant =
                    activeApplicantTab == ApplicantTab.newApplicants
                    ? newApplicants[idx]
                    : invitees[idx];
                return _applicantCard(applicant);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _applicantTabButton(ApplicantTab tab, String label) {
    final isActive = activeApplicantTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => activeApplicantTab = tab);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.greyScaffoldBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CustomText(
              title: label,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              textColor: isActive ? AppColors.black : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _applicantCard(Map<String, dynamic> data) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade200, Colors.grey.shade300],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // main row
          Row(
            children: [
              // large illustration on left
              Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  child: Image.network(
                    data["image"],
                    fit: BoxFit.cover,
                    height: 120,
                  ),
                ),
              ),

              // content area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: data["name"],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.black,
                      ),
                      const SizedBox(height: 4),
                      CustomText(
                        title: data["club"],
                        fontSize: 13,
                        textColor: AppColors.grey,
                      ),
                      const SizedBox(height: 6),
                      CustomText(
                        title: 'Age : ${data["age"]}',
                        fontSize: 12,
                        textColor: AppColors.grey,
                      ),
                      const SizedBox(height: 8),
                      // rating row + send button
                      Row(
                        children: [
                          // stars (simple representation)
                          Row(
                            children: List.generate(
                              5,
                              (i) => const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          CustomText(
                            title: '(${data["reviews"]})',
                            fontSize: 12,
                            textColor: AppColors.grey,
                          ),
                          const Spacer(),
                          RoundedButton(
                            label: 'Send proposal',
                            onPressed: () {
                              // action
                            },
                            height: 36,
                            width: 140,
                            borderRadius: 20,
                            backgroundColor: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // country flag top-right
          Positioned(
            top: 10,
            right: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                data["countryFlag"],
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
