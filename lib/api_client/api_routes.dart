class ApiRoutes{
  static const baseUrl= 'http://139.59.5.113:3000/';
  /// Auth Api Routes
  static const logIn = 'api/auth/login';
  static const register = 'api/auth/signup';
  static const verifyOtp = 'api/auth/otp';
  static const reSendOtp = 'api/auth/otp/resend';
  static const forgotPassword = 'api/auth/forgot/password';
  static const updatePassword = 'api/auth/update/password';

  /// home all sports route
  static const allSports = 'api/sports/';


  ///Coach routes
  static const coachRegister= 'api/coach';
  static const uploadImg= 'upload';
}