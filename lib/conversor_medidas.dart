import 'dart:io';

void exibeMenuConversorMedidas() {
  print(''' 
---------------------------------
  # CONVERSOR DE MEDIDAS #
---------------------------------

1. Metro p/ Centímetro
2. Quilometro p/ Metro
3. Centimetro p/ Milimetros

''');
}

void capturaOpcao() {
  try {
    print("Selecione a opção desejada: ");

    int opcao = int.parse(stdin.readLineSync()!);

    String resultCalculo;

    switch (opcao) {
      case 1:
        {
          resultCalculo = callFunction(() {
            print(
                "Digite o valor em metros para convertemos para centímetros: ");

            double valor = double.parse(stdin.readLineSync()!);

            double valorConvertido = retornaMetroCentimetro(valor);

            return format(valor) +
                ' (m) é igual a ' +
                format(valorConvertido) +
                ' centímetros';
          });

          print(resultCalculo);

          break;
        }

      case 2:
        {
          resultCalculo = callFunction(() {
            print(
                "Digite o valor em quilometros para convertemos para metros: ");

            double valor = double.parse(stdin.readLineSync()!);

            double valorConvertido = retornaQuilometroMetro(valor);

            return format(valor) +
                ' (km) é igual a ' +
                format(valorConvertido) +
                ' metros';
          });

          print(resultCalculo);

          break;
        }

      case 3:
        {
          resultCalculo = callFunction(() {
            print(
                "Digite o valor em centímetros para convertemos para milímetros: ");

            double valor = double.parse(stdin.readLineSync()!);

            double valorConvertido = retornaCentimetroMilimetro(valor);

            return format(valor) +
                ' (cm) é igual a ' +
                format(valorConvertido) +
                ' milímetros';
          });

          print(resultCalculo);

          break;
        }

      default:
        {
          print("opcao invalida");
          break;
        }
    }
  } on FormatException {
    print('Formato inválido');
  } catch (erro) {
    print('Erro! $erro');
  }
}

String callFunction(Function funcao) {
  return funcao();
}

double retornaMetroCentimetro(double valor) {
  return valor * 100;
}

double retornaQuilometroMetro(double valor) {
  return valor * 1000;
}

double retornaCentimetroMilimetro(double valor) {
  return valor * 10;
}

String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
