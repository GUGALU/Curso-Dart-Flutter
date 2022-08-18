void show(){
  // valores anulaveis
  int? numero = 42;
  String? nome = "nome";

  // nao funciona pois a função input retorna um valor anulavel
  // e o int.parse exige uma String nao anulavel
  // int.parse(input());

  // funciona pois estou garantindo que o retorno de input nao sera anulavel
  // usar assim somente quando ha certeza de que o valor nunca vai sera nulo
  int.parse(input()!);

  // funciona e previne erros usando um valor padrao
  int.parse(input() ?? "0");

  String? txt = input();
  if (txt != null){
    int.parse(txt);
  }

  somarNums(1, 5);
  somarNums(5, null);
}

String? input(){
  return "123";
}


void somarNums(int? n1, int? n2){
  if (n1 != null && n2 != null){
    print(n1+n2);
  }
  else{
    print("Valores inválidos");
  }
}