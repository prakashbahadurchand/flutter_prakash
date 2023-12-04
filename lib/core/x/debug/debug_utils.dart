import 'dart:developer';

void logd(String message) {
  log(message, name: 'DEBUG');
}

void loge(String message) {
  log(message, name: 'ERROR', level: 1000, error: message);
}

void logi(String message) {
  log(message, name: 'INFO', level: 800);
}

void logRed(String message) {
  const redColorCode = '\x1B[31m'; // ANSI escape sequence for red color
  const resetColorCode = '\x1B[0m'; // ANSI escape sequence to reset color

  log('$redColorCode$message$resetColorCode');
}