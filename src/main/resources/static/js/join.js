function formatDate(input) {
    var value = input.value;

    // 숫자를 '-'로 구분하여 yyyy-mm-dd 형식으로 변경
    if (value.length === 4) {
      value = value + '-';
    } else if (value.length === 7) {
      value = value + '-';
    }

    input.value = value;
  }