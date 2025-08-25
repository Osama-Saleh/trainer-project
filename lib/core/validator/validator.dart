class CustomValidator {


static String? emailValidate(String? inputText) {
    if (inputText == null || inputText.isEmpty) {
      return 'filed is empty';
    }
    return null;
  }

static String? passwordValidate(String? inputText) {
    if (inputText == null || inputText.isEmpty) {
      return 'filed is empty';
    }
    return null;
  }
}
