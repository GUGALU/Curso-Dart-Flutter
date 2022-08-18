void show() {
  // print
  print('Olá mundo');

  // variavel string
  String nome = "Rafael";
  print("Seu nome é: " + nome);

  // interpolaçao de string
  print("Seu nome é: $nome");

  // Variavel int
  // operadores aritmeticos: +, -, *, /, ~/, %
  int numero = 5;
  int resultado = numero + 5;
  print("Resultado: $resultado");

  // Variavel double
  double res = numero / 2;
  print("Resultado: $res");



  // exemplo if
  int idade = 14;
  
  if (idade >= 18) {
    print("É de maior");
  } else {
    print("É de menor");
  }

  // declare duas variaveis int com valores
  // e mostre o resto da divisão delas na tela
  int num1 = 79;
  int num2 = 23;

  print("O resto foi: ${num1 % num2}");

  int a = 10;
  int b = 10;

  if (a > b) {
    print(a);
  } else {
    if (b > a) {
      print(b);
    } else {
      print("São iguais");
    }
  }


  // com a variavel idade acima, mostre na tela se
  // a pessoa é criança, adolescente, adulto ou idoso
  if (idade < 14) {
    print("Criança");
  } else if (idade < 20) {
    print("Adolescente");
  } else if (idade < 60) {
    print("Adulto");
  } else {
    print("Idoso");
  } 

  // faça um algoritmo que tenha 3 variaveis int com notas
  // faça a média desses números e mostre o equivalente da média em conceito
  // sendo que: 
  // se a media for menor que 60: D
  // se a media for menor que 75: C
  // se a media for menor que 85: B
  // se a media for maior que 85: A

  int n1 = 70;
  int n2 = 80;
  int n3 = 80;

  double media = (n1 + n2 + n3) / 3;
  print(media);

  if (media < 60) {
    print("D");
  } else if (media < 75) {
    print("C");
  } else if (media < 85) {
    print("B");
  } else {
    print("A");
  }


}
