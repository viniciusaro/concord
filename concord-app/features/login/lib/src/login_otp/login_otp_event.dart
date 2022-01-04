abstract class LoginOtpEvent {}

class LoginOtpEventSendOtp implements LoginOtpEvent {
  final String otp;
  LoginOtpEventSendOtp(this.otp);
}
