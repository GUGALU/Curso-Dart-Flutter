import 'veiculo.dart';
import 'aluno.dart';

void show(){

  var veiculo = Veiculo("Fiat", "Uno");

  print(veiculo.marca);
  veiculo.mover();

  var carro = Carro(4, "Volkswagen", "Gol");

  print(carro.marca);
  carro.mover();

  var bicicleta = Bicicleta("Caloi", "Mountain Bike");
  bicicleta.mover();

  
  Aluno a1 = Aluno(true, "Maria", 30, 1.6);
  a1.exibir();
  mostrarPessoa(a1);

  Aluno a2 = Aluno(false, "José", 15, 1.7);
  a2.nome = "José";
  print("O aluno se chama ${a2.nome}");

  Aluno a3 = Tecnico(true, "Carolina", 16, 1.65, "Informática");
  a3.exibir();
  mostrarPessoa(a3);

}

void mostrarPessoa(Aluno a) {
  a.exibir();
}

