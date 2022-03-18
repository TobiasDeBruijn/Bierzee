String? validateRequired(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required';
  }

  return null;
}

const int serverParamLength = 64;

String? validateLength(String? value) {
  if(value != null) {
    if (value.length > serverParamLength) {
      return 'Maximum length of $serverParamLength characters';
    }
  }

  return null;
}

typedef ValidatorFunction = String? Function(String?);

String? requireAllValid(String? value, List<ValidatorFunction> validators) {
  for(final ValidatorFunction f in validators) {
    String? validationResult = f(value);
    if(validationResult != null) {
      return validationResult;
    }
  }
  return null;
}