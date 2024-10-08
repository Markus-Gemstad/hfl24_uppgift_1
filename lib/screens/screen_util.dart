import 'dart:io';

void clearScreen() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
