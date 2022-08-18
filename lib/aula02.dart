void show(){
  // while exemplo
  int contador = 1;
  while (contador <= 10){
    print("Rafael");
    contador = contador + 1;
  }


  // atividade - faça a tabuada do numero 5 com while
  contador = 1;
  while(contador <= 10){
    print('5 * $contador = ${contador*5}');
    contador+=1;
  }


  // for exemplo
  for (int contador = 0; contador <= 10; contador+=1){
    print(contador);
  }

  // for progressão
  int n = 30;
  int resultado = 0;
  for (int contador = 0; contador <= n; contador+=1){
    resultado+=contador;
  }
  print(resultado);

  
  // lista / var
  var lista = [13, 59, 23, 13];
  lista.add(4);
  print(lista[3]);

  // printar itens da lista com for
  for (int i = 0; i < lista.length; i+=1){
    print(lista[i]);
  }

  // printar itens da lista com for in
  for (var numero in lista) {
    if (59 == numero) {
      print("está na lista");
      break;
    }
  }


  somar();

  print(somarReturn());

  print(somarParam(1, 1));

  fazerTabuada(5);
  
  print(somarParamNome(num1: 1, num2: 1));

  mostrarLista(lista: lista);



  // exceções
  try{
    print(5~/0);
  }
  on IntegerDivisionByZeroException {
    print("Não é possível dividir por 0");
  }

  // validar com exceções
  String input = "123";
  if (validarNumero(input)){
    print(input);
  }
  else{
    print("Este campo só permite números");
  }
  

  // atividades
  mostrarPares();
  mostrarPares2();
  encontrarNumero(lista: lista, numero: 4);
}

// funçao exemplo
void somar(){
  int resultado = 1+1;
  print(resultado);
}

// funçao com return
int somarReturn(){
  return 1+1;
}

// parametros
int somarParam(int num1, int num2){
  return num1+num2;
}

// atividade faça uma função que receba como parametro um numero
// e mostre na tela a tabuada do mesmo
void fazerTabuada(int n){
  int contador = 1;
  while(contador <= 10){
    print('5 * $contador = ${contador*5}');
    contador++;
  }
}

// parametros nomeados
int somarParamNome({required int num1, required int num2}){
  return num1+num2;
}

// printar uma lista
void mostrarLista({required List lista}){
  for (var item in lista){
    print(item);
  }
}

// validar que o valor contem somente numeros
bool validarNumero(String input){
  try{
    int.parse(input);
    return true;
  }
  on FormatException{
    return false;
  }
  
  
}

// atividade - Faça uma função que mostre na tela todos os 
// numeros pares de 1 a 100. Utilize for.
void mostrarPares(){
  for (var i = 1; i <= 100; i+=1){
    if (i % 2 == 0){
      print(i);
    }
  }
}

void mostrarPares2(){
  for (var i = 2; i <= 100; i+=2){
    print(i);
  }
}


// atividade - Faça uma função que receba uma 
// lista de números e um número int como parâmetro nomeado. 
// Percorra a lista com for in e mostre na tela se o número está na lista.
void encontrarNumero({required List<int> lista, required int numero}) {
  for (var n in lista) {
    if (n == numero) {
      print("O número está na lista");
      return;
    }
  }
  print("O número não está na lista");
}

