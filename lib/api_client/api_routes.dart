class ApiRoutes{
  static const baseUrl= 'http://139.59.5.113:3000/';
  // static const baseUrl= 'http://192.168.100.57:3000/';

  /// AUTHENTICATION ...............................
  static const logIn = 'api/auth/login';
  static const registerUser = 'api/auth/signup';
  static const verifyOtp = 'api/auth/otp';
  static const reSendOtp = 'api/auth/otp/resend';
  static const forgotPassword = 'api/auth/forgot/password';
  static const updatePassword = 'api/auth/update/password';
  static const getPosts = '/posts';

  /// home all sports route
  static const allSports = 'api/sports/';


  ///COACH ROUTES................................
  static const coachRegister= 'api/coach';
  static const updateCoachDetails= 'api/coach';
  static const uploadImg= 'upload';
  static const getCoachMonth= 'api/availability/monthly';
  static const getCoachTime= 'api/availability/daily';
  static const createSession= 'api/session/';
  static const getCoachBySportId = 'api/coach';
  static const getCoachByLocation = 'api/coach/location';
  static const addCoachAvailability = 'api/availability';


  ///GET USER BY ID ..................................
  static const userDetailsByID='api/user';

  ///TOURNAMENT ......................................
  static const addTournament='api/tournaments';
  static const fetchGroundReservation='api/ground/reservation';
  static const addTeam='api/teams';
  static const getInviteLink='api/invite';
  static const joinViaLink='api/invite/';
}