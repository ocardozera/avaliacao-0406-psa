import 'package:test/test.dart';
import 'package:dart_application_1/conversor_medidas.dart' as conversorMedidas;
import 'package:dart_application_1/calculo_imc.dart' as calculoImc;

void main() {
  //Testes do Conversor de Medidas
  group('Testes do Conversor de Medidas', () {
    test('Convertendo 53 metros para centímetros', () {
      expect(conversorMedidas.retornaMetroCentimetro(53), 5300);
    });

    test('Convertendo 15 quilometros para metros', () {
      expect(conversorMedidas.retornaQuilometroMetro(15), 15000);
    });

    test('Convertendo 29 centimetros para milimetros', () {
      expect(conversorMedidas.retornaCentimetroMilimetro(28), 280);
    });
  });

  group('Testes do Cálculo de IMC', () {
    test('Primeiro teste do IMC (62 quilos, 1.75 de altura', () {
      expect(calculoImc.calculaImc(altura: 1.75, peso: 62), 20.244897959183675);
    });

    test('Convertendo 15 quilometros para metros', () {
      expect(calculoImc.retornaStrIMCByIdade(idade: 21, imc: 20.44),
          'Seu IMC é: 20.44. E você está com: Peso adequado');
    });
  });
}
