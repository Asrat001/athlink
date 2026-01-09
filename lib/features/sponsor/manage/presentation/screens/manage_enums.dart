/// Enums for managing the state of the Manage screen
enum JobsSectionState {
  /// Showing the list of job posts
  listing,

  /// Showing applicants for a selected job
  applicants,

  /// Showing detailed view of a hiring job
  jobDetail,

  /// Showing detailed view of a brand ambassador job
  baDetail,
}

/// Tabs within the applicants view
enum ApplicantTab {
  /// New applicants who applied for the job
  newApplicants,

  /// Athletes invited by the sponsor
  invitees,
}
