class EndPoints {
  ///---------------------------------------------- Base url ----------------------------------------------
  static const baseUrl = 'https://dreamspotacademy.com/public/i-ora/public/api';

  static const login = "$baseUrl/employee-app/login";
  static const forgotPassword = "$baseUrl/forgot-password";
  static const otp = "$baseUrl/add-otp";
  static const resetPassword = "$baseUrl/reset-password";
  static const profile = "$baseUrl/employee-app/employee-profile";
  static const editProfile = "$baseUrl/employee-app/edit-employee-profile";
  static const dashboardObj = "$baseUrl/dashboard/list-objects";
  static const workList = "$baseUrl/work/work-lists";
  static const cityList = "$baseUrl/cities";
  static const problem = "$baseUrl/problems";
  static const taskList = "$baseUrl/work/task-lists";
  static const resendOtp = "$baseUrl/resend-otp";
  static const signature = "$baseUrl/signatures";
  static const editSignature = "$baseUrl/signatures/1?_method=PUT";
  static const deleteSignature = "$baseUrl/signatures/";
  static const editProblem = "$baseUrl/problems/1?_method=PUT";
  static const deleteProblem = "$baseUrl/problems/";
  static const singleObj = "$baseUrl/dashboard/list-object/";
  static const taskStatusUpdate = "$baseUrl/dashboard/task-status";
  static const logOut = "$baseUrl/logoutEmployee";
  static const translation = "$baseUrl/translations";
  static const unAssignObj = "$baseUrl/dashboard/list-unassign-obj";
}
