class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }
    else if(value.length <= 5){
      return 'Field should be greater than 5 character';
    }
    return null;
  }

  static String? validateUserID({required String uid}) {
    if (uid.isEmpty) {
      return 'User ID can\'t be empty';
    } else if (uid.length <= 5) {
      return 'User ID should be greater than 5 characters';
    }

    return null;
  }


  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    }
    else if (password.length <= 8) {
      return 'Password should be greater than 8 characters';
    }

    return null;
  }

  static String? validateNumber({required String value}){
    if(value.isEmpty)
      {
        return 'Field can\'t be empty';
      }
    final number = num.tryParse(value);
    if(number == null){
      return 'Field can\'t be string. You must enter a number !';
    }
    return null;
  }
  static String? validateOptional({required String value}){
    if(value.isEmpty){
      return null;
    }
  }
}