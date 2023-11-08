import 'package:anotacoesapp/core/constantes/endpoint.dart';
import 'package:url_launcher/url_launcher.dart';

class Generico{

  Future<void> abrirLinkBrowser() async {
    final Uri _url = Uri.parse(EndPoint.urlGoogle);
    if (!await launchUrl(_url)) {
      throw Exception('Não foi possível acessar o endereço $_url');
    }
  }

}