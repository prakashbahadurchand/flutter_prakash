class ErrorResponse {
  Map<String, List<String>>? errors;

  ErrorResponse({
    this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? parsedErrors = {};
    json.forEach((key, value) {
      if (value is List<dynamic>) {
        parsedErrors[key] = value.cast<String>();
      }
    });

    return ErrorResponse(errors: parsedErrors);
  }

  String? toListString() {
    return errors?.values.map((value) => value.toString()).toString().split("[")[1].split("]")[0];
  }

  String? toFirstString() {
    return errors?.values.expand((x) => x).toList().first;
  }
}

/*```

SAMPLES:

"errors": {
        "key": ["Password not match from database"],
    }
"errors": {
        "phone": ["Phone is required"],
        "email": ["Email format is not valid"],
        "": ["Field is required"]
    }
"errors": {}
"errors": null
NO_ERRORS_KEY_INCLUDED

```*/
