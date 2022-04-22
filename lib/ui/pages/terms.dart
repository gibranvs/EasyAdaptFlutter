import 'package:flutter/material.dart';
import '../../i18n/strings.g.dart';

class TermsPage extends StatefulWidget {
  var t;

  TermsPage({Key? key, required this.t}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  String text = '';

  @override
  void didChangeDependencies() {
    loadData();

    super.didChangeDependencies();
  }

  loadData() {
    switch (LocaleSettings.currentLocale.languageTag) {
      case "es":
        setState(() {
          text = """
Bausch Health Companies Inc. (Bausch Health), es una empresa multinacional de especialidades farmacéuticas que desarrolla, fabrica y comercializa una extensa gama de productos farmacéuticos.

Nuestra misión es mejorar la vida de las familias a través de una variedad de terapias accesibles y de alta calidad.

Esta página tiene el objetivo de contribuir a la educación continua de profesionales de la salud visual, por lo que nos reservamos el derecho de eliminar contenido que:
- Vulnere o pretenda vulnerar los derechos humanos y/o garantías individuales consagradas en la Constitución.
- Resulte insultante, profano, calumnioso, despreciativo, de odio, acosador, amenazador u obsceno.
- Realice apología de actos criminales.
- Viole los derechos de autor o propiedad intelectual
- Resulte o pueda resultar fraudulento o engañoso.
- Incluya spam o pueda causar interferencia en la página.
- Viole disposiciones locales, regionales, nacionales o internacionales aplicables
- Mencionen otras marcas o productos ajenos a los aquí mencionados.
            
Ni Bausch Health, ni sus compañías subsidiarias y afiliadas alrededor del mundo, se hacen responsables por comentarios o información vertida en sus páginas que no haya sido directamente publicada por sus administradores. Todos los datos proporcionados a Bausch Health a través de esta página, o de cualquier otro medio de contacto, serán tratados conforme a nuestro aviso de privacidad que podrás consultar en: http://www.bauschhealth.com.mx/
""";
        });
        break;
      case "en":
        setState(() {
          text = """
th Companies Inc. (Bausch Health), is a multinational pharmaceutical specialty company that develops, manufactures and markets a wide range of pharmaceutical products.
 
Our mission is to improve the lives of families through a variety of high quality and accessible therapies.
 
This page aims to contribute to the continuing education of visual health professionals, so we reserve the right to remove content that:
- Violates or pretends to violate human rights and / or individual guarantees enshrined in the Constitution.
- Is insulting, profane, slanderous, contemptuous, hateful, harassing, threatening or obscene.
- Make an apology for criminal acts.
- Violate copyright or intellectual property.
- Is or may be fraudulent or misleading.
- Include spam or may cause interference on the page.
- Violate applicable local, regional, national or international regulations.
- Mention other brands or products other than those mentioned here.
     
Neither Bausch Health, nor its subsidiaries and affiliates around the world, are responsible for comments or information poured into its pages that has not been directly published by its administrators. All the data provided to Bausch Health through this page, or any other means of contact, will be treated in accordance with our privacy notice, which you can consult at: http://www.bauschhealth.com.mx/""";
        });
        break;
      case "pt":
        setState(() {
          text = """
A Bausch Health Companies Inc. (Bausch Health), é uma empresa multinacional de especialidades farmacêuticas que desenvolve, fabrica e comercializa uma ampla gama de produtos farmacêuticos.

Nossa missão é melhorar a vida das famílias através de uma variedade de terapias acessíveis e de alta qualidade

Esta página tem como objetivo contribuir para a educação continuada dos profissionais de saúde visual, por isso nos reservamos o direito de remover conteúdo que:

- Viola ou finge violar direitos humanos e / ou garantias individuais consagradas na Constituição
- É insultuoso, profano, calunioso, desdenhoso, odioso, assediador, ameaçador ou obsceno
- Faça um pedido de desculpas por atos criminosos. 
- Violar direitos autorais ou propriedade intelectual. 
- É ou pode ser fraudulento ou enganoso. 
- Inclua spam ou pode causar interferência na página. 
- Violar os regulamentos locais, regionais, nacionais ou internacionais aplicáveis. 
- Mencione outras marcas ou produtos, além dos mencionados aqui.
 
Nem a Bausch Health, nem suas subsidiárias e afiliadas ao redor do mundo, são responsáveis \u200B\u200Bpor comentários ou informações despejadas em suas páginas que não foram publicadas diretamente por seus administradores. Todos os dados fornecidos à Bausch Health através desta página, ou qualquer outro meio de contato, serão tratados de acordo com nosso aviso de privacidade, que você pode consultar em: http://www.bauschhealth.com.mx/
  

""";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          widget.t.TitleTermsScreen,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 118, 159, 1.0),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(56, 118, 159, 1.0),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Text(
            text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
