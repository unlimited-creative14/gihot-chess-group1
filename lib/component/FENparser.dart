//       rheakaehr//1c5c/p1p1p1p1p///P1P1P1P1P/1C5C/R/1HEAKAEHR b 0 0

void fenParser(var board, String fen) {
  String str_board = fen.split(" ")[0];
  List<String> rows = str_board.split("/");
  int idx = 0;
  var l_mapping = "rheakcp";
  var u_mapping = "RHEAKCP";

  for (var row in rows) {
    if (row.length == 0) {
      for (int i = 0; i < 9; i++) board[idx][i] = 0;
    } else {
      int j = 0;
      List<int> r = row.codeUnits;
      int i = 0;
      for (int ele in r) {
        if (ele >= 48 && ele <= 57) {
          for (int k = 0; k < ele - 48; k++) {
            board[idx][j] = 0;
            j++;
          }
        } else if (ele >= 65 && ele <= 90) {
          board[idx][j] = u_mapping.indexOf(row[i]) + 1;
          j++;
        } else {
          board[idx][j] = -l_mapping.indexOf(row[i]) - 1;
          j++;
        }
        i++;
      }
      if (j < 9) {
        for (int k = j; k < 9; k++) {
          board[idx][j] = 0;
        }
      }
    }
    idx++;
  }
}
