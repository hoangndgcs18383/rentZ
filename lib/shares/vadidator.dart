class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }
    else if(value.length <= 3){
      return 'Field should be greater than 3 character';
    }
    return null;
  }

  static String? validateEmail({required String email}) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp('$pattern');
    if (email.isEmpty) {
      return 'User ID can\'t be empty';
    } else if (email.length <= 5) {
      return 'User ID should be greater than 5 characters';
    }
    if(!regex.hasMatch(email)){
      return 'Enter a valid email address';
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
    if(number!.isNaN){
      return 'Field can\'t be string. Please enter a number !';
    }
    if(number >= 10 ) {
      return 'Field can\'t more than 10 numbers. Please enter again!';
    }
  }
  static String? validatePrice({required String value}){
    if(value.isEmpty)
    {
      return 'Field can\'t be empty';
    }
    final number = num.tryParse(value);
    if(number!.isNaN){
      return 'Field can\'t be string. Please enter a number !';
    }
    if(number <= 10) {
      return 'Field can\'t less than 10\$. Please enter again!';
    }
    if(number >= 1000) {
      return 'Field can\'t more than 1000\$. Please enter again!';
    }
  }
  static String? validateOptional({required String value}){
    if(value.isEmpty){
      return null;
    }
  }
}