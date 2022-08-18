class Veiculo{
  String marca;
  String modelo;
  int posicao = 0;

  // construtor
  Veiculo(this.marca, this.modelo);
  

  void mover(){
    posicao+=5;
    print(posicao);
  }
} 

// herança
class Carro extends Veiculo{
  int qntdPortas;
  int combustivel = 100;

  Carro(this.qntdPortas, String marca, String modelo) : super(marca, modelo);

  @override
  void mover(){
    posicao+=5;
    combustivel-=1;
    print(posicao);
  }

}


class Bicicleta extends Veiculo{

  Bicicleta(String marca, String modelo) : super(marca, modelo);
  
  // polimorfismo - sobrescrita de método
  @override
  void mover(){
    posicao+=2;
    print(posicao);
  }
}

/*
Atividade 1 - Adicione um atributo inteiro 
com o nome combustível e valor padrão de 100 na classe Carro. 
Utilize o polimorfismo para modificar a função mover, 
de modo que sempre que o carro se mova ele perca 1 de combustível.
*/

/*
Atividade 2 - Crie uma classe chamada Pessoa que possui os 
atributos nome e idade. Crie um atributo chamado motorista 
do tipo Pessoa. Instancie e passe uma Pessoa para o construtor da classe Carro.
*/

class Pessoa{
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);
}