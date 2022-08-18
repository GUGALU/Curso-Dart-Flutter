import 'package:flutter/material.dart';
import '../calculadora.dart';
import '../constants.dart';
import '../views/results_view.dart';
import '../widgets/bottom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/icon_label.dart';
import '../widgets/rounded_icon_button.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  int altura = 175;
  int idade = 20;
  int peso = 70;
  String genero = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    cor: genero == "M" ? activeColor : cardColor,
                    onPressed: () {
                      setState(() {
                        genero = "M";
                      });
                    },
                    child: IconLabel(
                      label: "Masculino",
                      icon: Icons.male,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    cor: genero == "F" ? activeColor : cardColor,
                    onPressed: () {
                      setState(() {
                        genero = "F";
                      });
                    },
                    child: IconLabel(
                      label: "Feminino",
                      icon: Icons.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Altura",
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: bigText,
                      ),
                      const Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      thumbColor: highlightColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      trackHeight: 1,
                    ),
                    child: Slider(
                      min: 120,
                      max: 250,
                      value: altura.toDouble(),
                      onChanged: (value) => setState(() {
                        altura = value.toInt();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Peso", style: labelStyle),
                        Text(peso.toString(), style: bigText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  peso -= 1;
                                });
                              },
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  peso += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Idade", style: labelStyle),
                        Text(idade.toString(), style: bigText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  idade -= 1;
                                });
                              },
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  idade += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: "Calcular",
            onPressed: () {
              CalculadoraIMC calculadora = CalculadoraIMC(
                peso: peso,
                altura: altura,
              );

              calculadora.calcular();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Results(
                    resultado: calculadora.getResultado(),
                    descricao: calculadora.getDescricao(),
                    valor: calculadora.getImc(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
