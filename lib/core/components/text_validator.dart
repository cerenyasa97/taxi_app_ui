class TextValidator{
  static bool phoneValidation(String phone){
      String pattern = r'(^[0-9]{10,12}$)';
      RegExp regExp = new RegExp(pattern);
      if (phone.length < 10 || !regExp.hasMatch(phone)) {
        return false;
      }
      else {
        return true;
      }
  }
}