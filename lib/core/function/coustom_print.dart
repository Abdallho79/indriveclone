void PrintString(String variableName, dynamic value) {
  print("========$variableName==========");
  print(value);
  print("==================");
}


PrintList(List myprints) {
  print("==================");
  for (var element in myprints) {
    print(element);
  }
  print("==================");
}
