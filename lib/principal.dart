import 'package:dart_application_1/conversor_medidas.dart' as conversorMedidas;
import 'package:dart_application_1/calculo_imc.dart' as calculoImc;
import 'dart:io';

void exibeMenu() {
  print(''' 
---------------------------------
  # BEM VINDO AO SISTEMA UTIL #
---------------------------------

1. Conversor de medidas
2. Calculo de IMC

''');
}

void capturaOpcao() {
  try {
    print("Selecione a opção desejada: ");

    int opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        {
          conversorMedidas.exibeMenuConversorMedidas();
          conversorMedidas.capturaOpcao();
          break;
        }

      case 2:
        {
          calculoImc.exibeMenuCalculoImc();
          calculoImc.capturaDados();
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
