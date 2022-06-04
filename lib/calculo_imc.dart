import 'dart:io';

void exibeMenuCalculoImc() {
  print(''' 
---------------------------------------------
            # CALCULO DE IMC #
---------------------------------------------

Primeiramente, precisamos coletar seus dados.

''');
}

void capturaDados() {
  try {
    print("Informe seu peso: ");
    double peso = double.parse(stdin.readLineSync()!);

    print("Informe sua altura: ");
    double altura = double.parse(stdin.readLineSync()!);

    print("Informe sua idade: ");
    int idade = int.parse(stdin.readLineSync()!);

    String resultCalculo;

    resultCalculo = callFunction(() {
      double calculoFinalImc = calculaImc(peso: peso, altura: altura);

      double imcFormatado = double.parse(format(calculoFinalImc));

      return retornaStrIMCByIdade(idade: idade, imc: imcFormatado);
    });

    print(resultCalculo);
  } on FormatException {
    print('Formato inválido');
  } catch (erro) {
    print('Erro! $erro');
  }
}

String callFunction(Function funcao) {
  return funcao();
}

String retornaStrIMCByIdade({required int idade, required double imc}) {
  String strPeso = '';

  if (idade < 60) {
    if (imc <= 18.4) {
      strPeso = 'Baixo peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      strPeso = 'Peso adequado';
    } else if (imc >= 25 && imc <= 29.9) {
      strPeso = 'Sobrepeso';
    } else if (imc >= 30) {
      strPeso = 'Obesidade';
    }
  } else if (idade >= 60) {
    if (imc <= 21.9) {
      strPeso = 'Baixo peso';
    } else if (imc >= 22 && imc <= 26.9) {
      strPeso = 'Peso adequado';
    } else if (imc >= 27) {
      strPeso = 'Sobrepeso';
    }
  }

  return 'Seu IMC é: $imc. E você está com: $strPeso';
}

double calculaImc({required double peso, required double altura}) {
  return peso / (altura * altura);
}

String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
