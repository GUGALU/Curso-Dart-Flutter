class Aluno {
  bool tristeza = false;
  String nome = "";
  int idade = 0;
  double altura = 0;

  Aluno(this.tristeza, this.nome, this.idade, this.altura);

  void exibir() {
    print(nome);
    print(idade);
    print(altura);
    print(tristeza == true ? "Está triste" : "Não está triste");
  }
}

class Tecnico extends Aluno {
  String curso = "";

  Tecnico(bool tristeza, String nome, int idade, double altura, this.curso)
      : super(tristeza, nome, idade, altura);

  void exibir() {
    super.exibir();
    print(curso);
  }
}
