
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 468 (156.0 per locale)
 *
 * Built on 2022-07-12 at 20:56 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	es, // 'es'
	pt, // 'pt'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsEs _translationsEs = _StringsEs.build();
late _StringsPt _translationsPt = _StringsPt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.es: return _translationsEs;
			case AppLocale.pt: return _translationsPt;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.es: return _StringsEs.build();
			case AppLocale.pt: return _StringsPt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.es: return 'es';
			case AppLocale.pt: return 'pt';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'es': return AppLocale.es;
			case 'pt': return AppLocale.pt;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get TitleTermsScreen => 'Terms and Conditions';
	String get alertBottomSubtitleHomeScreen => 'Privacy notice number:';
	String get alertBottomTitleHomeScreen => 'Notice of Privacy';
	String get buttonAddPatient => 'Add';
	String get buttonRegisterScreen => 'Create Account';
	String get buttonTitleProfilePage => 'Change';
	String get calculatorTitleHomeScreen => 'Calculator';
	String get card1HomeScreen => 'CALCULATORS';
	String get card2HomeScreen => 'CATALOGS';
	String get card3HomeScreen => 'TUTORIALS';
	String get dontHaveAccountSubtitleHomeScreen => 'here';
	String get dontHaveAccountTitleHomeScreen => 'Don\'t have an account? Create one ';
	String get hintLastEmailAddPatient => 'Email';
	String get hintLastNameAddPatient => 'Surnames';
	String get hintNameAddPatient => 'Name';
	String get hintPhoneAddPatient => 'Telephone';
	String get hintTextConfirmPasswordProfilePage => 'Confirm Password';
	String get hintTextConfirmPasswordRegisterScreen => 'confirm password';
	String get hintTextCountryProfilePage => 'Parents';
	String get hintTextCountryRegisterScreen => 'Parents';
	String get hintTextEmailProfilePage => 'Mail';
	String get hintTextEmailRegisterScreen => 'E-mail';
	String get hintTextNameProfilePage => 'Name';
	String get hintTextNameRegisterScreen => 'Full name';
	String get hintTextNewPasswordProfilePage => 'New Password';
	String get hintTextPasswordProfilePage => 'Current password';
	String get hintTextPasswordRegisterScreen => 'Password';
	String get modalText1TitleRegisterScreen => 'Brilliant!';
	String get modalText1RegisterScreen => 'Account created successfully';
	String get modalText2RegisterScreen => 'Make sure all fields are filled';
	String get modalText3RegisterScreen => 'Passwords do not match';
	String get modalText4RegisterScreen => 'It is necessary to accept the terms and conditions';
	String get hintTextPatientsPage => 'Search by name';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	String get loginModalErrorTitle => 'Warning';
	String get loginModalErrorSubtitle => 'Check that your data is correct.';
	String get loginTitleHomeScreen => 'Log in';
	String get savePasswordLoginScreen => 'Remember password';
	String get singOffTitleProfilePage => 'Sign off';
	String get subtitleAcceptRegisterScreen => 'terms and Conditions';
	String get subtitleHomeScreen => 'Welcome to the tool that optimizes your adaptation';
	String get subtitleLoginScreen => 'Hello, enter your information';
	String get subtitleWelcomeRegisterScreen => 'Create your account in one step, enter your data';
	String get titleAcceptRegisterScreen => 'I agree';
	String get titleAddPatient => 'New patient';
	String get titleAppBarRegisterScreen => 'Create an account';
	String get titleButtonLoginScreen => 'Start';
	String get titleCatalogPage => 'Catalog';
	String get titleHomeScreen => 'Hello,';
	String get titleLoginScreen => 'Log in';
	String get titlePatientsPage => 'Patients';
	String get subtitlePatientsPage => 'To perform any calculation, you must select a patient or create a new one to save the results.';
	String get titleProfilePage => 'Profile';
	String get titleTutorialesPage => 'Tutorials';
	String get titleWelcomeRegisterScreen => 'WELCOME!';
	List<dynamic> get tutoriales => [
		_Strings0i0En._(_root),
		_Strings0i1En._(_root),
		_Strings0i2En._(_root),
		_Strings0i3En._(_root),
		_Strings0i4En._(_root),
		_Strings0i5En._(_root),
		_Strings0i6En._(_root),
		_Strings0i7En._(_root),
	];
	String get unselectTextCatalogPage => 'Select a country from the list to see its corresponding catalog';
	String get calc1Title => 'Spherical calculator';
	String get calc2Title => 'Toric calculator';
	String get calc3Title => 'Multifocal calculator';
	String get calc4Title => 'Monovision Calculator';
	String get calc1TitleSpherica => 'Spherical';
	String get calc2TitleToric => 'Toric';
	String get calc3TitleMultifocal => 'Multifocal';
	String get calc4TitleMonovision => 'Monovision';
	late final _StringsCalculatorEsfericosEn calculatorEsfericos = _StringsCalculatorEsfericosEn._(_root);
	late final _StringsCalculatorToricosEn calculatorToricos = _StringsCalculatorToricosEn._(_root);
	late final _StringsCalculatorMultifocalEn calculatorMultifocal = _StringsCalculatorMultifocalEn._(_root);
	String get calculatorResultsTitle1 => 'Calculated data';
	String get calculatorResultsTitle2 => 'Final prescription for contact lens';
	String get calculatorResultsTitle3 => 'Recommended products';
	String get setPatientTitle => 'Brilliant!';
	String get setPatientSubtitle => 'The patient has been registered.';
	String get setPatientTitleProblem => 'Caveat';
	String get setPatientSubtitleProblem => 'Enter all the fields.';
	String get backModalBottom => 'BEHIND';
	String get saveModalBottom => 'SAVE';
	String get saveModalBottomRight => 'Keep just the right eye prescription?';
	String get saveModalBottomLeft => 'Keep only the left eye prescription?';
	String get saveModalBottomRight2 => 'Now select the prescription of the right eye';
	String get saveModalBottomLeft2 => 'Now select the prescription for the left eye';
	String get savePresTitle => 'Confirm';
	String get savePresTitle1 => 'Right eye prescription';
	String get savePresTitle2 => 'Left eye prescription';
	String get savePresSave => 'Save';
	String get prescriptionBack => 'Resume';
	String get prescriptionButton1 => 'PRESCRIPTION HISTORY';
	String get prescriptionTitle1 => 'Prescription history';
	String get toricModalTitle => 'Shaft adjustment';
	String get toricModalSubTitle => 'New adapted result';
	String get calculatorTotalToast => 'There are no recommended products with these parameters';
	String get calculatorTotalModalTitle => 'Invalid Parameters';
	String get calculatorTotalModalSubTitle => 'It is not possible to adapt multifocals with these parameters, try Monovision';
	String get calculatorConfirmSendCalendar1 => 'The tratment of ';
	String get calculatorConfirmSendCalendar2 => ' for ';
	String get calculatorConfirmSendCalendar3 => ' It is about to end, contact him for a new prescription. ';
	String get calculatorConfirmSendCalendarModal1 => 'This prescription was saved in your diary ';
	String get calculatorConfirmSendCalendarModal2 => 'A notification will be created';
	String get calculatorConfirmSendCalendarModal3 => 'to contact  ';
	String get calculatorConfirmSendCalendarModal4 => 'to deliver your next treatment';
	String get calculatorConfirmSendCalendarModalButton => 'ACCEPT';
	String get calculatorConfirmSendCalendarModalButton2 => 'FINALIZE';
	String get hisotirlaPrescriptionsEye1 => 'Right eye';
	String get hisotirlaPrescriptionsEye2 => 'Left eye';
	String get hisotirlaPrescriptionsEyeR => 'Right eye prescription';
	String get hisotirlaPrescriptionsEyeL => 'Left eye prescription';
	String get hisotirlaPrescriptionsEyeE => 'Deadline';
	String get cancelarButtom => 'Delete account';
	String get cancelarButtomModal => 'CANCEL';
	String get modalDeleteAccountText1 => 'You are about to ';
	String get modalDeleteAccountText2 => 'delete your account, ';
	String get modalDeleteAccountText3 => 'are you sure?. This change cannot be reversed';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get fail => 'Logged in failed';
	String get success => 'Logged in successfully';
}

// Path: tutoriales.0
class _Strings0i0En {
	_Strings0i0En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/seleccion_pacientes.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4';
	String get title => 'Patient selection';
}

// Path: tutoriales.1
class _Strings0i1En {
	_Strings0i1En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/eleccion_lente.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4';
	String get title => 'Choice of contact lens';
}

// Path: tutoriales.2
class _Strings0i2En {
	_Strings0i2En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/adaptacion_esfericos.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4';
	String get title => 'Spherical adaptation';
}

// Path: tutoriales.3
class _Strings0i3En {
	_Strings0i3En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/adaptacion_toricos.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4';
	String get title => 'Toric adaptation';
}

// Path: tutoriales.4
class _Strings0i4En {
	_Strings0i4En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/adaptacion_multifocal.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4';
	String get title => 'Multifocal adaptation';
}

// Path: tutoriales.5
class _Strings0i5En {
	_Strings0i5En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/adaptacion_monovision.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4';
	String get title => 'Monovision adaptation';
}

// Path: tutoriales.6
class _Strings0i6En {
	_Strings0i6En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/insercion_gabinete.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4';
	String get title => 'Insertion and removal in the cabinet';
}

// Path: tutoriales.7
class _Strings0i7En {
	_Strings0i7En._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get image => './assets/tutorials/insercion_casa.png';
	String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4';
	String get title => 'Insertion, removal and maintenance at home';
}

// Path: calculatorEsfericos
class _StringsCalculatorEsfericosEn {
	_StringsCalculatorEsfericosEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get text => 'To calculate \n \n1. Choose the type of lens \n2. Enter the corresponding data for each eye (right and/or left).';
	String get eyeRight => 'RIGHT';
	String get eyeLeft => 'LEFT';
	String get type => 'Lens type';
	String get esphere => 'Sphere';
	String get distance => 'Distance';
	String get button => 'Calculate';
}

// Path: calculatorToricos
class _StringsCalculatorToricosEn {
	_StringsCalculatorToricosEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get eyeRight => 'RIGHT';
	String get eyeLeft => 'LEFT';
	String get type => 'Lens type';
	String get esphere => 'Sphere';
	String get distance => 'Distance';
	String get cylinder => 'Cylinder';
	String get axis => 'Axis';
	String get button => 'Calcular';
}

// Path: calculatorMultifocal
class _StringsCalculatorMultifocalEn {
	_StringsCalculatorMultifocalEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get eyeRight => 'RIGHT';
	String get eyeLeft => 'LEFT';
	String get type => 'Lens type';
	String get esphere => 'Sphere';
	String get distance => 'Distance';
	String get cylinder => 'Cylinder';
	String get dominant => 'Dominant';
	String get button => 'Calcular';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsEs _root = this;

	// Translations
	@override String get TitleTermsScreen => 'T??rminos y condiciones';
	@override String get alertBottomSubtitleHomeScreen => 'No. de Aviso de privacidad:';
	@override String get alertBottomTitleHomeScreen => 'Aviso de privacidad';
	@override String get buttonAddPatient => 'Agregar';
	@override String get buttonRegisterScreen => 'Crear cuenta';
	@override String get buttonTitleProfilePage => 'Cambiar';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get card1HomeScreen => 'CALCULADORAS';
	@override String get card2HomeScreen => 'CAT??LOGOS';
	@override String get card3HomeScreen => 'TUTORIALES';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aqu??';
	@override String get dontHaveAccountTitleHomeScreen => '??No tienes cuenta? crea una';
	@override String get hintLastEmailAddPatient => 'Correo electr??nico';
	@override String get hintLastNameAddPatient => 'Apellidos';
	@override String get hintNameAddPatient => 'Nombre';
	@override String get hintPhoneAddPatient => 'Tel??fono';
	@override String get hintTextConfirmPasswordProfilePage => 'Confirmar contrase??a';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar contrase??a';
	@override String get hintTextCountryProfilePage => 'Pa??s';
	@override String get hintTextCountryRegisterScreen => 'Pa??s';
	@override String get hintTextEmailProfilePage => 'Correo';
	@override String get hintTextEmailRegisterScreen => 'Correo electr??nico';
	@override String get hintTextNameProfilePage => 'Nombre';
	@override String get hintTextNameRegisterScreen => 'Nombre completo';
	@override String get hintTextNewPasswordProfilePage => 'Nueva contrase??a';
	@override String get hintTextPasswordProfilePage => 'Contrase??a actual';
	@override String get hintTextPasswordRegisterScreen => 'Contrase??a';
	@override String get modalText1TitleRegisterScreen => 'Genial!';
	@override String get modalText1RegisterScreen => 'Cuenta creada exitosamente';
	@override String get modalText2RegisterScreen => 'Asegurate que todos los campos esten llenos';
	@override String get modalText3RegisterScreen => 'Las contrase??as no coinciden';
	@override String get modalText4RegisterScreen => 'Es necesario aceptar los t??rminos y condiciones';
	@override String get hintTextPatientsPage => 'Buscar por nombre';
	@override late final _StringsLoginEs login = _StringsLoginEs._(_root);
	@override String get loginModalErrorTitle => 'Advertencia';
	@override String get loginModalErrorSubtitle => 'Verifica que tus datos sean correctos.';
	@override String get loginTitleHomeScreen => 'Iniciar sesi??n';
	@override String get savePasswordLoginScreen => 'Recordar contrase??a';
	@override String get singOffTitleProfilePage => 'Cerrar sesi??n';
	@override String get subtitleAcceptRegisterScreen => 't??rminos y condiciones';
	@override String get subtitleHomeScreen => 'Bienvenido a la herramienta que optimiza tu adapdaci??n';
	@override String get subtitleLoginScreen => 'Hola, introduce tus datos';
	@override String get subtitleWelcomeRegisterScreen => 'Crea tu cuenta con un solo paso, introduce tus datos';
	@override String get titleAcceptRegisterScreen => 'Acepto';
	@override String get titleAddPatient => 'Nuevo paciente';
	@override String get titleAppBarRegisterScreen => 'Crear cuenta';
	@override String get titleButtonLoginScreen => 'Iniciar';
	@override String get titleCatalogPage => 'Cat??logo';
	@override String get titleHomeScreen => 'Hola,';
	@override String get titleLoginScreen => 'Iniciar sesi??n';
	@override String get titlePatientsPage => 'Pacientes';
	@override String get subtitlePatientsPage => 'Para realizar cualquier c??lculo debes seleccionar un paciente o crear uno nuevo para guardar los resultados.';
	@override String get titleProfilePage => 'Perfil';
	@override String get titleTutorialesPage => 'Tutoriales';
	@override String get titleWelcomeRegisterScreen => 'BIENVENIDO!';
	@override List<dynamic> get tutoriales => [
		_Strings0i0Es._(_root),
		_Strings0i1Es._(_root),
		_Strings0i2Es._(_root),
		_Strings0i3Es._(_root),
		_Strings0i4Es._(_root),
		_Strings0i5Es._(_root),
		_Strings0i6Es._(_root),
		_Strings0i7Es._(_root),
	];
	@override String get unselectTextCatalogPage => 'Selecciona de la lista un pa??s para ver su cat??logo correspondiente';
	@override String get calc1Title => 'Calculadora esf??ricos';
	@override String get calc2Title => 'Calculadora t??ricos';
	@override String get calc3Title => 'Calculadora multifocales';
	@override String get calc4Title => 'Calculadora monovisi??n';
	@override String get calc1TitleSpherica => 'Esf??ricos';
	@override String get calc2TitleToric => 'T??ricos';
	@override String get calc3TitleMultifocal => 'Multifocal';
	@override String get calc4TitleMonovision => 'Monovisi??n';
	@override late final _StringsCalculatorEsfericosEs calculatorEsfericos = _StringsCalculatorEsfericosEs._(_root);
	@override late final _StringsCalculatorToricosEs calculatorToricos = _StringsCalculatorToricosEs._(_root);
	@override late final _StringsCalculatorMultifocalEs calculatorMultifocal = _StringsCalculatorMultifocalEs._(_root);
	@override String get calculatorResultsTitle1 => 'Datos calculados';
	@override String get calculatorResultsTitle2 => 'Prescripci??n final para lente de contacto';
	@override String get calculatorResultsTitle3 => 'Productos recomendados';
	@override String get setPatientTitle => 'Genial!';
	@override String get setPatientSubtitle => 'El paciente ha sido registrado.';
	@override String get setPatientTitleProblem => 'Advertencia';
	@override String get setPatientSubtitleProblem => 'Ingresa todos los campos.';
	@override String get backModalBottom => 'ATR??S';
	@override String get saveModalBottom => 'GUARDAR';
	@override String get saveModalBottomRight => '??Guardar solo la prescripci??n del ojo derecho?';
	@override String get saveModalBottomLeft => '??Guardar solo la prescripci??n del ojo izquierdo?';
	@override String get saveModalBottomRight2 => 'Selecciona ahora la prescripci??n del ojo derecho';
	@override String get saveModalBottomLeft2 => 'Selecciona ahora la prescripci??n del ojo izquierdo';
	@override String get savePresTitle => 'Confirmar';
	@override String get savePresTitle1 => 'Prescripci??n ojo derecho';
	@override String get savePresTitle2 => 'Prescripci??n ojo izquierdo';
	@override String get savePresSave => 'Guardar';
	@override String get prescriptionBack => 'Resumen';
	@override String get prescriptionButton1 => 'HISTORIAL DE PRESCRIPCIONES';
	@override String get prescriptionTitle1 => 'Historial de prescripciones';
	@override String get toricModalTitle => 'Ajuste del eje';
	@override String get toricModalSubTitle => 'Nuevo resultado adaptado';
	@override String get calculatorTotalToast => 'No hay productos recomendados con estos par??metros';
	@override String get calculatorTotalModalTitle => 'Par??metros no v??lidos';
	@override String get calculatorTotalModalSubTitle => 'No se puede hacer adaptaci??n de multifocales con esos par??metros, intente con Monovisi??n';
	@override String get calculatorConfirmSendCalendar1 => 'El tratamiento de ';
	@override String get calculatorConfirmSendCalendar2 => ' para ';
	@override String get calculatorConfirmSendCalendar3 => ' Esta por terminar, contactalo para nueva prescripcion. ';
	@override String get calculatorConfirmSendCalendarModal1 => 'Esta prescripci??n se guard?? en su agenda ';
	@override String get calculatorConfirmSendCalendarModal2 => 'Se crear?? una notificaci??n ??l ';
	@override String get calculatorConfirmSendCalendarModal3 => 'para contactar a   ';
	@override String get calculatorConfirmSendCalendarModal4 => 'para entregarle su siguiente tratamiento';
	@override String get calculatorConfirmSendCalendarModalButton => 'ACEPTAR';
	@override String get calculatorConfirmSendCalendarModalButton2 => 'FINALIZAR';
	@override String get hisotirlaPrescriptionsEye1 => 'Ojo derecho';
	@override String get hisotirlaPrescriptionsEye2 => 'Ojo izquierdo';
	@override String get hisotirlaPrescriptionsEyeR => 'Prescripci??n ojo derecho';
	@override String get hisotirlaPrescriptionsEyeL => 'Prescripci??n ojo izquierdo';
	@override String get hisotirlaPrescriptionsEyeE => 'Fecha de entrega';
	@override String get cancelarButtom => 'Eliminar cuenta';
	@override String get cancelarButtomModal => 'CANCELAR';
	@override String get modalDeleteAccountText1 => 'Est??s a punto de ';
	@override String get modalDeleteAccountText2 => 'eliminar tu cuenta, ';
	@override String get modalDeleteAccountText3 => '??est??s seguro?. Este cambio no puede ser revertido';
}

// Path: login
class _StringsLoginEs implements _StringsLoginEn {
	_StringsLoginEs._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get fail => 'Login fehlgeschlagen';
	@override String get success => 'Login erfolgreich';
}

// Path: tutoriales.0
class _Strings0i0Es implements _Strings0i0En {
	_Strings0i0Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/seleccion_pacientes.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4';
	@override String get title => 'Selecci??n del paciente';
}

// Path: tutoriales.1
class _Strings0i1Es implements _Strings0i1En {
	_Strings0i1Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/eleccion_lente.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4';
	@override String get title => 'Elecci??n del lente de contacto';
}

// Path: tutoriales.2
class _Strings0i2Es implements _Strings0i2En {
	_Strings0i2Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_esfericos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4';
	@override String get title => 'Adaptaci??n esf??ricos';
}

// Path: tutoriales.3
class _Strings0i3Es implements _Strings0i3En {
	_Strings0i3Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_toricos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4';
	@override String get title => 'Adaptaci??n t??ricos';
}

// Path: tutoriales.4
class _Strings0i4Es implements _Strings0i4En {
	_Strings0i4Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_multifocal.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4';
	@override String get title => 'Adaptaci??n multifocal';
}

// Path: tutoriales.5
class _Strings0i5Es implements _Strings0i5En {
	_Strings0i5Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_monovision.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4';
	@override String get title => 'Adaptaci??n monovisi??n';
}

// Path: tutoriales.6
class _Strings0i6Es implements _Strings0i6En {
	_Strings0i6Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_gabinete.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4';
	@override String get title => 'Inserci??n y remoci??n en el gabinete';
}

// Path: tutoriales.7
class _Strings0i7Es implements _Strings0i7En {
	_Strings0i7Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_casa.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4';
	@override String get title => 'Inserci??n, remoci??n y mantenimiento en casa';
}

// Path: calculatorEsfericos
class _StringsCalculatorEsfericosEs implements _StringsCalculatorEsfericosEn {
	_StringsCalculatorEsfericosEs._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get text => 'Para calcular \n \n1. Elige el tipo de lente \n2. Introduce los datos correspondientes para cada ojo (derecho y/o izquierdo).';
	@override String get eyeRight => 'DERECHO';
	@override String get eyeLeft => 'IZQUIERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Distancia';
	@override String get button => 'Calcular';
}

// Path: calculatorToricos
class _StringsCalculatorToricosEs implements _StringsCalculatorToricosEn {
	_StringsCalculatorToricosEs._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get eyeRight => 'DERECHO';
	@override String get eyeLeft => 'IZQUIERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Distancia';
	@override String get cylinder => 'Cilindro';
	@override String get axis => 'Eje';
	@override String get button => 'Calcular';
}

// Path: calculatorMultifocal
class _StringsCalculatorMultifocalEs implements _StringsCalculatorMultifocalEn {
	_StringsCalculatorMultifocalEs._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get eyeRight => 'DERECHO';
	@override String get eyeLeft => 'IZQUIERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Distancia';
	@override String get cylinder => 'Cilindro';
	@override String get dominant => 'Dominante';
	@override String get button => 'Calcular';
}

// Path: <root>
class _StringsPt implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPt.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsPt _root = this;

	// Translations
	@override String get TitleTermsScreen => 'Termos e Condi????es';
	@override String get alertBottomSubtitleHomeScreen => 'N?? do Aviso de Privacidade:';
	@override String get alertBottomTitleHomeScreen => 'Aviso de privacidade';
	@override String get buttonAddPatient => 'Adicionar';
	@override String get buttonRegisterScreen => 'Criar uma ';
	@override String get buttonTitleProfilePage => 'Mudar';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get card1HomeScreen => 'CALCULADORAS';
	@override String get card2HomeScreen => 'CAT??LOGOS';
	@override String get card3HomeScreen => 'TUTORIAIS';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aqui';
	@override String get dontHaveAccountTitleHomeScreen => 'N??o possui uma conta? Crie um';
	@override String get hintLastEmailAddPatient => 'Correio eletr??nico';
	@override String get hintLastNameAddPatient => 'Sobrenomes';
	@override String get hintNameAddPatient => 'Nome';
	@override String get hintPhoneAddPatient => 'Telefone';
	@override String get hintTextConfirmPasswordProfilePage => 'Confirmar senha';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar senha';
	@override String get hintTextCountryProfilePage => 'Pa??s';
	@override String get hintTextCountryRegisterScreen => 'Pa??s';
	@override String get hintTextEmailProfilePage => 'Correspond??ncia';
	@override String get hintTextEmailRegisterScreen => 'Correio eletr??nico';
	@override String get hintTextNameProfilePage => 'Nome';
	@override String get hintTextNameRegisterScreen => 'Nome completo';
	@override String get hintTextNewPasswordProfilePage => 'Nova senha';
	@override String get hintTextPasswordProfilePage => 'Senha atual';
	@override String get hintTextPasswordRegisterScreen => 'Senha';
	@override String get modalText1TitleRegisterScreen => 'Brilhante!';
	@override String get modalText1RegisterScreen => 'Conta criada com sucesso';
	@override String get modalText2RegisterScreen => 'Verifique se todos os campos est??o preenchidos';
	@override String get modalText3RegisterScreen => 'As senhas n??o coincidem';
	@override String get modalText4RegisterScreen => '?? necess??rio aceitar os termos e condi????es';
	@override String get hintTextPatientsPage => 'Procura por nome';
	@override late final _StringsLoginPt login = _StringsLoginPt._(_root);
	@override String get loginModalErrorTitle => 'Aviso';
	@override String get loginModalErrorSubtitle => 'Verifique se seus dados est??o corretos.';
	@override String get loginTitleHomeScreen => 'Iniciar sess??o';
	@override String get savePasswordLoginScreen => 'Lembrar senha';
	@override String get singOffTitleProfilePage => 'Fechar Sess??o';
	@override String get subtitleAcceptRegisterScreen => 'termos e Condi????es';
	@override String get subtitleHomeScreen => 'Bem-vindo ?? ferramenta que otimiza sua adapta????o';
	@override String get subtitleLoginScreen => 'Ol??, insira suas informa????es';
	@override String get subtitleWelcomeRegisterScreen => 'Crie sua conta com uma ??nica etapa, insira seus dados';
	@override String get titleAcceptRegisterScreen => 'Eu concordo';
	@override String get titleAddPatient => 'Novo paciente';
	@override String get titleAppBarRegisterScreen => 'Criar uma conta';
	@override String get titleButtonLoginScreen => 'Iniciar';
	@override String get titleCatalogPage => 'Cat??logo';
	@override String get titleHomeScreen => 'Ol??,';
	@override String get titleLoginScreen => 'Iniciar sess??o';
	@override String get titlePatientsPage => 'Pacientes';
	@override String get subtitlePatientsPage => 'Para realizar qualquer c??lculo, voc?? deve selecionar um paciente ou criar um novo para salvar os resultados.';
	@override String get titleProfilePage => 'Perfil';
	@override String get titleTutorialesPage => 'Tutoriais';
	@override String get titleWelcomeRegisterScreen => 'BEM-VINDO!';
	@override List<dynamic> get tutoriales => [
		_Strings0i0Pt._(_root),
		_Strings0i1Pt._(_root),
		_Strings0i2Pt._(_root),
		_Strings0i3Pt._(_root),
		_Strings0i4Pt._(_root),
		_Strings0i5Pt._(_root),
		_Strings0i6Pt._(_root),
		_Strings0i7Pt._(_root),
	];
	@override String get unselectTextCatalogPage => 'Selecione um pa??s da lista para ver seu cat??logo correspondente';
	@override String get calc1Title => 'Calculadora esf??rica';
	@override String get calc2Title => 'Calculadora t??rica';
	@override String get calc3Title => 'Calculadora multifocal';
	@override String get calc4Title => 'Calculadora Monovis??o';
	@override String get calc1TitleSpherica => 'Esf??rica';
	@override String get calc2TitleToric => 'T??rica';
	@override String get calc3TitleMultifocal => 'Multifocal';
	@override String get calc4TitleMonovision => 'Monovis??o';
	@override late final _StringsCalculatorEsfericosPt calculatorEsfericos = _StringsCalculatorEsfericosPt._(_root);
	@override late final _StringsCalculatorToricosPt calculatorToricos = _StringsCalculatorToricosPt._(_root);
	@override late final _StringsCalculatorMultifocalPt calculatorMultifocal = _StringsCalculatorMultifocalPt._(_root);
	@override String get calculatorResultsTitle1 => 'Dados calculados';
	@override String get calculatorResultsTitle2 => 'Prescri????o final para lentes de contato';
	@override String get calculatorResultsTitle3 => 'Produtos recomendados';
	@override String get setPatientTitle => 'Brilhante!';
	@override String get setPatientSubtitle => 'O paciente foi cadastrado.';
	@override String get setPatientTitleProblem => 'Embargo';
	@override String get setPatientSubtitleProblem => 'Digite todos os campos.';
	@override String get backModalBottom => 'COSTAS';
	@override String get saveModalBottom => 'SALVE ';
	@override String get saveModalBottomRight => 'Manter apenas a prescri????o do olho direito?';
	@override String get saveModalBottomLeft => 'Manter apenas a prescri????o do olho esquerdo?';
	@override String get saveModalBottomRight2 => 'Agora selecione a prescri????o do olho direito';
	@override String get saveModalBottomLeft2 => 'Selecione agora a prescri????o do olho esquerdo?';
	@override String get savePresTitle => 'Confirme';
	@override String get savePresTitle1 => 'Prescri????o do olho direito';
	@override String get savePresTitle2 => 'Prescri????o do olho esquerdo';
	@override String get savePresSave => 'Salve';
	@override String get prescriptionBack => 'Retomar';
	@override String get prescriptionButton1 => 'HIST??RICO DE PRESCRI????O';
	@override String get prescriptionTitle1 => 'Hist??rico de prescri????o';
	@override String get toricModalTitle => 'Ajuste do eixo';
	@override String get toricModalSubTitle => 'Novo resultado adaptado';
	@override String get calculatorTotalToast => 'N??o h?? produtos recomendados com esses par??metros';
	@override String get calculatorTotalModalTitle => 'Par??metros inv??lidos';
	@override String get calculatorTotalModalSubTitle => 'N??o ?? poss??vel adaptar multifocais com esses par??metros, tente Monovision';
	@override String get calculatorConfirmSendCalendar1 => 'O tratamento de ';
	@override String get calculatorConfirmSendCalendar2 => ' por ';
	@override String get calculatorConfirmSendCalendar3 => ' Est?? prestes a acabar, contacte-o para uma nova receita. ';
	@override String get calculatorConfirmSendCalendarModal1 => 'Esta receita foi salva em seu di??rio';
	@override String get calculatorConfirmSendCalendarModal2 => 'Uma notifica????o ser?? criada ';
	@override String get calculatorConfirmSendCalendarModal3 => 'contactar ';
	@override String get calculatorConfirmSendCalendarModal4 => 'para entregar seu pr??ximo tratamento ';
	@override String get calculatorConfirmSendCalendarModalButton => 'ACEITAR';
	@override String get calculatorConfirmSendCalendarModalButton2 => 'FINALIZAR';
	@override String get hisotirlaPrescriptionsEye1 => 'Olho direito';
	@override String get hisotirlaPrescriptionsEye2 => 'Olho esquerdo';
	@override String get hisotirlaPrescriptionsEyeR => 'Prescri????o do olho direito';
	@override String get hisotirlaPrescriptionsEyeL => 'Prescri????o do olho esquerdo';
	@override String get hisotirlaPrescriptionsEyeE => 'Data de entrega';
	@override String get cancelarButtom => 'Eliminar conta';
	@override String get cancelarButtomModal => 'CANCELAR';
	@override String get modalDeleteAccountText1 => 'Voc?? est?? prestes a ';
	@override String get modalDeleteAccountText2 => 'deletar sua conta, ';
	@override String get modalDeleteAccountText3 => 'tem certeza?. Esta altera????o n??o pode ser revertida';
}

// Path: login
class _StringsLoginPt implements _StringsLoginEn {
	_StringsLoginPt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get fail => 'Login fehlgeschlagen';
	@override String get success => 'Login erfolgreich';
}

// Path: tutoriales.0
class _Strings0i0Pt implements _Strings0i0En {
	_Strings0i0Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/seleccion_pacientes.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4';
	@override String get title => 'Sele????o de pacientes';
}

// Path: tutoriales.1
class _Strings0i1Pt implements _Strings0i1En {
	_Strings0i1Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/eleccion_lente.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4';
	@override String get title => 'Escolha da lente de contato';
}

// Path: tutoriales.2
class _Strings0i2Pt implements _Strings0i2En {
	_Strings0i2Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_esfericos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4';
	@override String get title => 'Adapta????o esf??rica';
}

// Path: tutoriales.3
class _Strings0i3Pt implements _Strings0i3En {
	_Strings0i3Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_toricos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4';
	@override String get title => 'Adapta????o t??rica';
}

// Path: tutoriales.4
class _Strings0i4Pt implements _Strings0i4En {
	_Strings0i4Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_multifocal.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4';
	@override String get title => 'Adapta????o multifocal';
}

// Path: tutoriales.5
class _Strings0i5Pt implements _Strings0i5En {
	_Strings0i5Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_monovision.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4';
	@override String get title => 'Adapta????o ?? monovis??o';
}

// Path: tutoriales.6
class _Strings0i6Pt implements _Strings0i6En {
	_Strings0i6Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_gabinete.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4';
	@override String get title => 'Inser????o e remo????o no gabinete';
}

// Path: tutoriales.7
class _Strings0i7Pt implements _Strings0i7En {
	_Strings0i7Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_casa.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4';
	@override String get title => 'Inser????o, remo????o e manuten????o em casa';
}

// Path: calculatorEsfericos
class _StringsCalculatorEsfericosPt implements _StringsCalculatorEsfericosEn {
	_StringsCalculatorEsfericosPt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get text => 'Para calcular \n \n1. Escolha o tipo de lente \n2. Insira os dados correspondentes para cada olho (direito e/ou esquerdo).';
	@override String get eyeRight => 'CERTO';
	@override String get eyeLeft => 'ESQUERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Dist??ncia';
	@override String get button => 'Calcular';
}

// Path: calculatorToricos
class _StringsCalculatorToricosPt implements _StringsCalculatorToricosEn {
	_StringsCalculatorToricosPt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get eyeRight => 'CERTO';
	@override String get eyeLeft => 'ESQUERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Dist??ncia';
	@override String get cylinder => 'Cilindro';
	@override String get axis => 'Eixo';
	@override String get button => 'Calcular';
}

// Path: calculatorMultifocal
class _StringsCalculatorMultifocalPt implements _StringsCalculatorMultifocalEn {
	_StringsCalculatorMultifocalPt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get eyeRight => 'CERTO';
	@override String get eyeLeft => 'ESQUERDO';
	@override String get type => 'Tipo de lente';
	@override String get esphere => 'Esfera';
	@override String get distance => 'Dist??ncia';
	@override String get cylinder => 'Cilindro';
	@override String get dominant => 'Dominante';
	@override String get button => 'Calcular';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Terms and Conditions',
			'alertBottomSubtitleHomeScreen': 'Privacy notice number:',
			'alertBottomTitleHomeScreen': 'Notice of Privacy',
			'buttonAddPatient': 'Add',
			'buttonRegisterScreen': 'Create Account',
			'buttonTitleProfilePage': 'Change',
			'calculatorTitleHomeScreen': 'Calculator',
			'card1HomeScreen': 'CALCULATORS',
			'card2HomeScreen': 'CATALOGS',
			'card3HomeScreen': 'TUTORIALS',
			'dontHaveAccountSubtitleHomeScreen': 'here',
			'dontHaveAccountTitleHomeScreen': 'Don\'t have an account? Create one ',
			'hintLastEmailAddPatient': 'Email',
			'hintLastNameAddPatient': 'Surnames',
			'hintNameAddPatient': 'Name',
			'hintPhoneAddPatient': 'Telephone',
			'hintTextConfirmPasswordProfilePage': 'Confirm Password',
			'hintTextConfirmPasswordRegisterScreen': 'confirm password',
			'hintTextCountryProfilePage': 'Parents',
			'hintTextCountryRegisterScreen': 'Parents',
			'hintTextEmailProfilePage': 'Mail',
			'hintTextEmailRegisterScreen': 'E-mail',
			'hintTextNameProfilePage': 'Name',
			'hintTextNameRegisterScreen': 'Full name',
			'hintTextNewPasswordProfilePage': 'New Password',
			'hintTextPasswordProfilePage': 'Current password',
			'hintTextPasswordRegisterScreen': 'Password',
			'modalText1TitleRegisterScreen': 'Brilliant!',
			'modalText1RegisterScreen': 'Account created successfully',
			'modalText2RegisterScreen': 'Make sure all fields are filled',
			'modalText3RegisterScreen': 'Passwords do not match',
			'modalText4RegisterScreen': 'It is necessary to accept the terms and conditions',
			'hintTextPatientsPage': 'Search by name',
			'login.fail': 'Logged in failed',
			'login.success': 'Logged in successfully',
			'loginModalErrorTitle': 'Warning',
			'loginModalErrorSubtitle': 'Check that your data is correct.',
			'loginTitleHomeScreen': 'Log in',
			'savePasswordLoginScreen': 'Remember password',
			'singOffTitleProfilePage': 'Sign off',
			'subtitleAcceptRegisterScreen': 'terms and Conditions',
			'subtitleHomeScreen': 'Welcome to the tool that optimizes your adaptation',
			'subtitleLoginScreen': 'Hello, enter your information',
			'subtitleWelcomeRegisterScreen': 'Create your account in one step, enter your data',
			'titleAcceptRegisterScreen': 'I agree',
			'titleAddPatient': 'New patient',
			'titleAppBarRegisterScreen': 'Create an account',
			'titleButtonLoginScreen': 'Start',
			'titleCatalogPage': 'Catalog',
			'titleHomeScreen': 'Hello,',
			'titleLoginScreen': 'Log in',
			'titlePatientsPage': 'Patients',
			'subtitlePatientsPage': 'To perform any calculation, you must select a patient or create a new one to save the results.',
			'titleProfilePage': 'Profile',
			'titleTutorialesPage': 'Tutorials',
			'titleWelcomeRegisterScreen': 'WELCOME!',
			'tutoriales.0.image': './assets/tutorials/seleccion_pacientes.png',
			'tutoriales.0.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4',
			'tutoriales.0.title': 'Patient selection',
			'tutoriales.1.image': './assets/tutorials/eleccion_lente.png',
			'tutoriales.1.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4',
			'tutoriales.1.title': 'Choice of contact lens',
			'tutoriales.2.image': './assets/tutorials/adaptacion_esfericos.png',
			'tutoriales.2.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4',
			'tutoriales.2.title': 'Spherical adaptation',
			'tutoriales.3.image': './assets/tutorials/adaptacion_toricos.png',
			'tutoriales.3.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4',
			'tutoriales.3.title': 'Toric adaptation',
			'tutoriales.4.image': './assets/tutorials/adaptacion_multifocal.png',
			'tutoriales.4.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4',
			'tutoriales.4.title': 'Multifocal adaptation',
			'tutoriales.5.image': './assets/tutorials/adaptacion_monovision.png',
			'tutoriales.5.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4',
			'tutoriales.5.title': 'Monovision adaptation',
			'tutoriales.6.image': './assets/tutorials/insercion_gabinete.png',
			'tutoriales.6.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4',
			'tutoriales.6.title': 'Insertion and removal in the cabinet',
			'tutoriales.7.image': './assets/tutorials/insercion_casa.png',
			'tutoriales.7.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4',
			'tutoriales.7.title': 'Insertion, removal and maintenance at home',
			'unselectTextCatalogPage': 'Select a country from the list to see its corresponding catalog',
			'calc1Title': 'Spherical calculator',
			'calc2Title': 'Toric calculator',
			'calc3Title': 'Multifocal calculator',
			'calc4Title': 'Monovision Calculator',
			'calc1TitleSpherica': 'Spherical',
			'calc2TitleToric': 'Toric',
			'calc3TitleMultifocal': 'Multifocal',
			'calc4TitleMonovision': 'Monovision',
			'calculatorEsfericos.text': 'To calculate \n \n1. Choose the type of lens \n2. Enter the corresponding data for each eye (right and/or left).',
			'calculatorEsfericos.eyeRight': 'RIGHT',
			'calculatorEsfericos.eyeLeft': 'LEFT',
			'calculatorEsfericos.type': 'Lens type',
			'calculatorEsfericos.esphere': 'Sphere',
			'calculatorEsfericos.distance': 'Distance',
			'calculatorEsfericos.button': 'Calculate',
			'calculatorToricos.eyeRight': 'RIGHT',
			'calculatorToricos.eyeLeft': 'LEFT',
			'calculatorToricos.type': 'Lens type',
			'calculatorToricos.esphere': 'Sphere',
			'calculatorToricos.distance': 'Distance',
			'calculatorToricos.cylinder': 'Cylinder',
			'calculatorToricos.axis': 'Axis',
			'calculatorToricos.button': 'Calcular',
			'calculatorMultifocal.eyeRight': 'RIGHT',
			'calculatorMultifocal.eyeLeft': 'LEFT',
			'calculatorMultifocal.type': 'Lens type',
			'calculatorMultifocal.esphere': 'Sphere',
			'calculatorMultifocal.distance': 'Distance',
			'calculatorMultifocal.cylinder': 'Cylinder',
			'calculatorMultifocal.dominant': 'Dominant',
			'calculatorMultifocal.button': 'Calcular',
			'calculatorResultsTitle1': 'Calculated data',
			'calculatorResultsTitle2': 'Final prescription for contact lens',
			'calculatorResultsTitle3': 'Recommended products',
			'setPatientTitle': 'Brilliant!',
			'setPatientSubtitle': 'The patient has been registered.',
			'setPatientTitleProblem': 'Caveat',
			'setPatientSubtitleProblem': 'Enter all the fields.',
			'backModalBottom': 'BEHIND',
			'saveModalBottom': 'SAVE',
			'saveModalBottomRight': 'Keep just the right eye prescription?',
			'saveModalBottomLeft': 'Keep only the left eye prescription?',
			'saveModalBottomRight2': 'Now select the prescription of the right eye',
			'saveModalBottomLeft2': 'Now select the prescription for the left eye',
			'savePresTitle': 'Confirm',
			'savePresTitle1': 'Right eye prescription',
			'savePresTitle2': 'Left eye prescription',
			'savePresSave': 'Save',
			'prescriptionBack': 'Resume',
			'prescriptionButton1': 'PRESCRIPTION HISTORY',
			'prescriptionTitle1': 'Prescription history',
			'toricModalTitle': 'Shaft adjustment',
			'toricModalSubTitle': 'New adapted result',
			'calculatorTotalToast': 'There are no recommended products with these parameters',
			'calculatorTotalModalTitle': 'Invalid Parameters',
			'calculatorTotalModalSubTitle': 'It is not possible to adapt multifocals with these parameters, try Monovision',
			'calculatorConfirmSendCalendar1': 'The tratment of ',
			'calculatorConfirmSendCalendar2': ' for ',
			'calculatorConfirmSendCalendar3': ' It is about to end, contact him for a new prescription. ',
			'calculatorConfirmSendCalendarModal1': 'This prescription was saved in your diary ',
			'calculatorConfirmSendCalendarModal2': 'A notification will be created',
			'calculatorConfirmSendCalendarModal3': 'to contact  ',
			'calculatorConfirmSendCalendarModal4': 'to deliver your next treatment',
			'calculatorConfirmSendCalendarModalButton': 'ACCEPT',
			'calculatorConfirmSendCalendarModalButton2': 'FINALIZE',
			'hisotirlaPrescriptionsEye1': 'Right eye',
			'hisotirlaPrescriptionsEye2': 'Left eye',
			'hisotirlaPrescriptionsEyeR': 'Right eye prescription',
			'hisotirlaPrescriptionsEyeL': 'Left eye prescription',
			'hisotirlaPrescriptionsEyeE': 'Deadline',
			'cancelarButtom': 'Delete account',
			'cancelarButtomModal': 'CANCEL',
			'modalDeleteAccountText1': 'You are about to ',
			'modalDeleteAccountText2': 'delete your account, ',
			'modalDeleteAccountText3': 'are you sure?. This change cannot be reversed',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'T??rminos y condiciones',
			'alertBottomSubtitleHomeScreen': 'No. de Aviso de privacidad:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidad',
			'buttonAddPatient': 'Agregar',
			'buttonRegisterScreen': 'Crear cuenta',
			'buttonTitleProfilePage': 'Cambiar',
			'calculatorTitleHomeScreen': 'Calculadora',
			'card1HomeScreen': 'CALCULADORAS',
			'card2HomeScreen': 'CAT??LOGOS',
			'card3HomeScreen': 'TUTORIALES',
			'dontHaveAccountSubtitleHomeScreen': 'aqu??',
			'dontHaveAccountTitleHomeScreen': '??No tienes cuenta? crea una',
			'hintLastEmailAddPatient': 'Correo electr??nico',
			'hintLastNameAddPatient': 'Apellidos',
			'hintNameAddPatient': 'Nombre',
			'hintPhoneAddPatient': 'Tel??fono',
			'hintTextConfirmPasswordProfilePage': 'Confirmar contrase??a',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar contrase??a',
			'hintTextCountryProfilePage': 'Pa??s',
			'hintTextCountryRegisterScreen': 'Pa??s',
			'hintTextEmailProfilePage': 'Correo',
			'hintTextEmailRegisterScreen': 'Correo electr??nico',
			'hintTextNameProfilePage': 'Nombre',
			'hintTextNameRegisterScreen': 'Nombre completo',
			'hintTextNewPasswordProfilePage': 'Nueva contrase??a',
			'hintTextPasswordProfilePage': 'Contrase??a actual',
			'hintTextPasswordRegisterScreen': 'Contrase??a',
			'modalText1TitleRegisterScreen': 'Genial!',
			'modalText1RegisterScreen': 'Cuenta creada exitosamente',
			'modalText2RegisterScreen': 'Asegurate que todos los campos esten llenos',
			'modalText3RegisterScreen': 'Las contrase??as no coinciden',
			'modalText4RegisterScreen': 'Es necesario aceptar los t??rminos y condiciones',
			'hintTextPatientsPage': 'Buscar por nombre',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginModalErrorTitle': 'Advertencia',
			'loginModalErrorSubtitle': 'Verifica que tus datos sean correctos.',
			'loginTitleHomeScreen': 'Iniciar sesi??n',
			'savePasswordLoginScreen': 'Recordar contrase??a',
			'singOffTitleProfilePage': 'Cerrar sesi??n',
			'subtitleAcceptRegisterScreen': 't??rminos y condiciones',
			'subtitleHomeScreen': 'Bienvenido a la herramienta que optimiza tu adapdaci??n',
			'subtitleLoginScreen': 'Hola, introduce tus datos',
			'subtitleWelcomeRegisterScreen': 'Crea tu cuenta con un solo paso, introduce tus datos',
			'titleAcceptRegisterScreen': 'Acepto',
			'titleAddPatient': 'Nuevo paciente',
			'titleAppBarRegisterScreen': 'Crear cuenta',
			'titleButtonLoginScreen': 'Iniciar',
			'titleCatalogPage': 'Cat??logo',
			'titleHomeScreen': 'Hola,',
			'titleLoginScreen': 'Iniciar sesi??n',
			'titlePatientsPage': 'Pacientes',
			'subtitlePatientsPage': 'Para realizar cualquier c??lculo debes seleccionar un paciente o crear uno nuevo para guardar los resultados.',
			'titleProfilePage': 'Perfil',
			'titleTutorialesPage': 'Tutoriales',
			'titleWelcomeRegisterScreen': 'BIENVENIDO!',
			'tutoriales.0.image': './assets/tutorials/seleccion_pacientes.png',
			'tutoriales.0.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4',
			'tutoriales.0.title': 'Selecci??n del paciente',
			'tutoriales.1.image': './assets/tutorials/eleccion_lente.png',
			'tutoriales.1.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4',
			'tutoriales.1.title': 'Elecci??n del lente de contacto',
			'tutoriales.2.image': './assets/tutorials/adaptacion_esfericos.png',
			'tutoriales.2.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4',
			'tutoriales.2.title': 'Adaptaci??n esf??ricos',
			'tutoriales.3.image': './assets/tutorials/adaptacion_toricos.png',
			'tutoriales.3.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4',
			'tutoriales.3.title': 'Adaptaci??n t??ricos',
			'tutoriales.4.image': './assets/tutorials/adaptacion_multifocal.png',
			'tutoriales.4.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4',
			'tutoriales.4.title': 'Adaptaci??n multifocal',
			'tutoriales.5.image': './assets/tutorials/adaptacion_monovision.png',
			'tutoriales.5.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4',
			'tutoriales.5.title': 'Adaptaci??n monovisi??n',
			'tutoriales.6.image': './assets/tutorials/insercion_gabinete.png',
			'tutoriales.6.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4',
			'tutoriales.6.title': 'Inserci??n y remoci??n en el gabinete',
			'tutoriales.7.image': './assets/tutorials/insercion_casa.png',
			'tutoriales.7.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4',
			'tutoriales.7.title': 'Inserci??n, remoci??n y mantenimiento en casa',
			'unselectTextCatalogPage': 'Selecciona de la lista un pa??s para ver su cat??logo correspondiente',
			'calc1Title': 'Calculadora esf??ricos',
			'calc2Title': 'Calculadora t??ricos',
			'calc3Title': 'Calculadora multifocales',
			'calc4Title': 'Calculadora monovisi??n',
			'calc1TitleSpherica': 'Esf??ricos',
			'calc2TitleToric': 'T??ricos',
			'calc3TitleMultifocal': 'Multifocal',
			'calc4TitleMonovision': 'Monovisi??n',
			'calculatorEsfericos.text': 'Para calcular \n \n1. Elige el tipo de lente \n2. Introduce los datos correspondientes para cada ojo (derecho y/o izquierdo).',
			'calculatorEsfericos.eyeRight': 'DERECHO',
			'calculatorEsfericos.eyeLeft': 'IZQUIERDO',
			'calculatorEsfericos.type': 'Tipo de lente',
			'calculatorEsfericos.esphere': 'Esfera',
			'calculatorEsfericos.distance': 'Distancia',
			'calculatorEsfericos.button': 'Calcular',
			'calculatorToricos.eyeRight': 'DERECHO',
			'calculatorToricos.eyeLeft': 'IZQUIERDO',
			'calculatorToricos.type': 'Tipo de lente',
			'calculatorToricos.esphere': 'Esfera',
			'calculatorToricos.distance': 'Distancia',
			'calculatorToricos.cylinder': 'Cilindro',
			'calculatorToricos.axis': 'Eje',
			'calculatorToricos.button': 'Calcular',
			'calculatorMultifocal.eyeRight': 'DERECHO',
			'calculatorMultifocal.eyeLeft': 'IZQUIERDO',
			'calculatorMultifocal.type': 'Tipo de lente',
			'calculatorMultifocal.esphere': 'Esfera',
			'calculatorMultifocal.distance': 'Distancia',
			'calculatorMultifocal.cylinder': 'Cilindro',
			'calculatorMultifocal.dominant': 'Dominante',
			'calculatorMultifocal.button': 'Calcular',
			'calculatorResultsTitle1': 'Datos calculados',
			'calculatorResultsTitle2': 'Prescripci??n final para lente de contacto',
			'calculatorResultsTitle3': 'Productos recomendados',
			'setPatientTitle': 'Genial!',
			'setPatientSubtitle': 'El paciente ha sido registrado.',
			'setPatientTitleProblem': 'Advertencia',
			'setPatientSubtitleProblem': 'Ingresa todos los campos.',
			'backModalBottom': 'ATR??S',
			'saveModalBottom': 'GUARDAR',
			'saveModalBottomRight': '??Guardar solo la prescripci??n del ojo derecho?',
			'saveModalBottomLeft': '??Guardar solo la prescripci??n del ojo izquierdo?',
			'saveModalBottomRight2': 'Selecciona ahora la prescripci??n del ojo derecho',
			'saveModalBottomLeft2': 'Selecciona ahora la prescripci??n del ojo izquierdo',
			'savePresTitle': 'Confirmar',
			'savePresTitle1': 'Prescripci??n ojo derecho',
			'savePresTitle2': 'Prescripci??n ojo izquierdo',
			'savePresSave': 'Guardar',
			'prescriptionBack': 'Resumen',
			'prescriptionButton1': 'HISTORIAL DE PRESCRIPCIONES',
			'prescriptionTitle1': 'Historial de prescripciones',
			'toricModalTitle': 'Ajuste del eje',
			'toricModalSubTitle': 'Nuevo resultado adaptado',
			'calculatorTotalToast': 'No hay productos recomendados con estos par??metros',
			'calculatorTotalModalTitle': 'Par??metros no v??lidos',
			'calculatorTotalModalSubTitle': 'No se puede hacer adaptaci??n de multifocales con esos par??metros, intente con Monovisi??n',
			'calculatorConfirmSendCalendar1': 'El tratamiento de ',
			'calculatorConfirmSendCalendar2': ' para ',
			'calculatorConfirmSendCalendar3': ' Esta por terminar, contactalo para nueva prescripcion. ',
			'calculatorConfirmSendCalendarModal1': 'Esta prescripci??n se guard?? en su agenda ',
			'calculatorConfirmSendCalendarModal2': 'Se crear?? una notificaci??n ??l ',
			'calculatorConfirmSendCalendarModal3': 'para contactar a   ',
			'calculatorConfirmSendCalendarModal4': 'para entregarle su siguiente tratamiento',
			'calculatorConfirmSendCalendarModalButton': 'ACEPTAR',
			'calculatorConfirmSendCalendarModalButton2': 'FINALIZAR',
			'hisotirlaPrescriptionsEye1': 'Ojo derecho',
			'hisotirlaPrescriptionsEye2': 'Ojo izquierdo',
			'hisotirlaPrescriptionsEyeR': 'Prescripci??n ojo derecho',
			'hisotirlaPrescriptionsEyeL': 'Prescripci??n ojo izquierdo',
			'hisotirlaPrescriptionsEyeE': 'Fecha de entrega',
			'cancelarButtom': 'Eliminar cuenta',
			'cancelarButtomModal': 'CANCELAR',
			'modalDeleteAccountText1': 'Est??s a punto de ',
			'modalDeleteAccountText2': 'eliminar tu cuenta, ',
			'modalDeleteAccountText3': '??est??s seguro?. Este cambio no puede ser revertido',
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Termos e Condi????es',
			'alertBottomSubtitleHomeScreen': 'N?? do Aviso de Privacidade:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidade',
			'buttonAddPatient': 'Adicionar',
			'buttonRegisterScreen': 'Criar uma ',
			'buttonTitleProfilePage': 'Mudar',
			'calculatorTitleHomeScreen': 'Calculadora',
			'card1HomeScreen': 'CALCULADORAS',
			'card2HomeScreen': 'CAT??LOGOS',
			'card3HomeScreen': 'TUTORIAIS',
			'dontHaveAccountSubtitleHomeScreen': 'aqui',
			'dontHaveAccountTitleHomeScreen': 'N??o possui uma conta? Crie um',
			'hintLastEmailAddPatient': 'Correio eletr??nico',
			'hintLastNameAddPatient': 'Sobrenomes',
			'hintNameAddPatient': 'Nome',
			'hintPhoneAddPatient': 'Telefone',
			'hintTextConfirmPasswordProfilePage': 'Confirmar senha',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar senha',
			'hintTextCountryProfilePage': 'Pa??s',
			'hintTextCountryRegisterScreen': 'Pa??s',
			'hintTextEmailProfilePage': 'Correspond??ncia',
			'hintTextEmailRegisterScreen': 'Correio eletr??nico',
			'hintTextNameProfilePage': 'Nome',
			'hintTextNameRegisterScreen': 'Nome completo',
			'hintTextNewPasswordProfilePage': 'Nova senha',
			'hintTextPasswordProfilePage': 'Senha atual',
			'hintTextPasswordRegisterScreen': 'Senha',
			'modalText1TitleRegisterScreen': 'Brilhante!',
			'modalText1RegisterScreen': 'Conta criada com sucesso',
			'modalText2RegisterScreen': 'Verifique se todos os campos est??o preenchidos',
			'modalText3RegisterScreen': 'As senhas n??o coincidem',
			'modalText4RegisterScreen': '?? necess??rio aceitar os termos e condi????es',
			'hintTextPatientsPage': 'Procura por nome',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginModalErrorTitle': 'Aviso',
			'loginModalErrorSubtitle': 'Verifique se seus dados est??o corretos.',
			'loginTitleHomeScreen': 'Iniciar sess??o',
			'savePasswordLoginScreen': 'Lembrar senha',
			'singOffTitleProfilePage': 'Fechar Sess??o',
			'subtitleAcceptRegisterScreen': 'termos e Condi????es',
			'subtitleHomeScreen': 'Bem-vindo ?? ferramenta que otimiza sua adapta????o',
			'subtitleLoginScreen': 'Ol??, insira suas informa????es',
			'subtitleWelcomeRegisterScreen': 'Crie sua conta com uma ??nica etapa, insira seus dados',
			'titleAcceptRegisterScreen': 'Eu concordo',
			'titleAddPatient': 'Novo paciente',
			'titleAppBarRegisterScreen': 'Criar uma conta',
			'titleButtonLoginScreen': 'Iniciar',
			'titleCatalogPage': 'Cat??logo',
			'titleHomeScreen': 'Ol??,',
			'titleLoginScreen': 'Iniciar sess??o',
			'titlePatientsPage': 'Pacientes',
			'subtitlePatientsPage': 'Para realizar qualquer c??lculo, voc?? deve selecionar um paciente ou criar um novo para salvar os resultados.',
			'titleProfilePage': 'Perfil',
			'titleTutorialesPage': 'Tutoriais',
			'titleWelcomeRegisterScreen': 'BEM-VINDO!',
			'tutoriales.0.image': './assets/tutorials/seleccion_pacientes.png',
			'tutoriales.0.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4',
			'tutoriales.0.title': 'Sele????o de pacientes',
			'tutoriales.1.image': './assets/tutorials/eleccion_lente.png',
			'tutoriales.1.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4',
			'tutoriales.1.title': 'Escolha da lente de contato',
			'tutoriales.2.image': './assets/tutorials/adaptacion_esfericos.png',
			'tutoriales.2.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4',
			'tutoriales.2.title': 'Adapta????o esf??rica',
			'tutoriales.3.image': './assets/tutorials/adaptacion_toricos.png',
			'tutoriales.3.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4',
			'tutoriales.3.title': 'Adapta????o t??rica',
			'tutoriales.4.image': './assets/tutorials/adaptacion_multifocal.png',
			'tutoriales.4.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4',
			'tutoriales.4.title': 'Adapta????o multifocal',
			'tutoriales.5.image': './assets/tutorials/adaptacion_monovision.png',
			'tutoriales.5.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4',
			'tutoriales.5.title': 'Adapta????o ?? monovis??o',
			'tutoriales.6.image': './assets/tutorials/insercion_gabinete.png',
			'tutoriales.6.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4',
			'tutoriales.6.title': 'Inser????o e remo????o no gabinete',
			'tutoriales.7.image': './assets/tutorials/insercion_casa.png',
			'tutoriales.7.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4',
			'tutoriales.7.title': 'Inser????o, remo????o e manuten????o em casa',
			'unselectTextCatalogPage': 'Selecione um pa??s da lista para ver seu cat??logo correspondente',
			'calc1Title': 'Calculadora esf??rica',
			'calc2Title': 'Calculadora t??rica',
			'calc3Title': 'Calculadora multifocal',
			'calc4Title': 'Calculadora Monovis??o',
			'calc1TitleSpherica': 'Esf??rica',
			'calc2TitleToric': 'T??rica',
			'calc3TitleMultifocal': 'Multifocal',
			'calc4TitleMonovision': 'Monovis??o',
			'calculatorEsfericos.text': 'Para calcular \n \n1. Escolha o tipo de lente \n2. Insira os dados correspondentes para cada olho (direito e/ou esquerdo).',
			'calculatorEsfericos.eyeRight': 'CERTO',
			'calculatorEsfericos.eyeLeft': 'ESQUERDO',
			'calculatorEsfericos.type': 'Tipo de lente',
			'calculatorEsfericos.esphere': 'Esfera',
			'calculatorEsfericos.distance': 'Dist??ncia',
			'calculatorEsfericos.button': 'Calcular',
			'calculatorToricos.eyeRight': 'CERTO',
			'calculatorToricos.eyeLeft': 'ESQUERDO',
			'calculatorToricos.type': 'Tipo de lente',
			'calculatorToricos.esphere': 'Esfera',
			'calculatorToricos.distance': 'Dist??ncia',
			'calculatorToricos.cylinder': 'Cilindro',
			'calculatorToricos.axis': 'Eixo',
			'calculatorToricos.button': 'Calcular',
			'calculatorMultifocal.eyeRight': 'CERTO',
			'calculatorMultifocal.eyeLeft': 'ESQUERDO',
			'calculatorMultifocal.type': 'Tipo de lente',
			'calculatorMultifocal.esphere': 'Esfera',
			'calculatorMultifocal.distance': 'Dist??ncia',
			'calculatorMultifocal.cylinder': 'Cilindro',
			'calculatorMultifocal.dominant': 'Dominante',
			'calculatorMultifocal.button': 'Calcular',
			'calculatorResultsTitle1': 'Dados calculados',
			'calculatorResultsTitle2': 'Prescri????o final para lentes de contato',
			'calculatorResultsTitle3': 'Produtos recomendados',
			'setPatientTitle': 'Brilhante!',
			'setPatientSubtitle': 'O paciente foi cadastrado.',
			'setPatientTitleProblem': 'Embargo',
			'setPatientSubtitleProblem': 'Digite todos os campos.',
			'backModalBottom': 'COSTAS',
			'saveModalBottom': 'SALVE ',
			'saveModalBottomRight': 'Manter apenas a prescri????o do olho direito?',
			'saveModalBottomLeft': 'Manter apenas a prescri????o do olho esquerdo?',
			'saveModalBottomRight2': 'Agora selecione a prescri????o do olho direito',
			'saveModalBottomLeft2': 'Selecione agora a prescri????o do olho esquerdo?',
			'savePresTitle': 'Confirme',
			'savePresTitle1': 'Prescri????o do olho direito',
			'savePresTitle2': 'Prescri????o do olho esquerdo',
			'savePresSave': 'Salve',
			'prescriptionBack': 'Retomar',
			'prescriptionButton1': 'HIST??RICO DE PRESCRI????O',
			'prescriptionTitle1': 'Hist??rico de prescri????o',
			'toricModalTitle': 'Ajuste do eixo',
			'toricModalSubTitle': 'Novo resultado adaptado',
			'calculatorTotalToast': 'N??o h?? produtos recomendados com esses par??metros',
			'calculatorTotalModalTitle': 'Par??metros inv??lidos',
			'calculatorTotalModalSubTitle': 'N??o ?? poss??vel adaptar multifocais com esses par??metros, tente Monovision',
			'calculatorConfirmSendCalendar1': 'O tratamento de ',
			'calculatorConfirmSendCalendar2': ' por ',
			'calculatorConfirmSendCalendar3': ' Est?? prestes a acabar, contacte-o para uma nova receita. ',
			'calculatorConfirmSendCalendarModal1': 'Esta receita foi salva em seu di??rio',
			'calculatorConfirmSendCalendarModal2': 'Uma notifica????o ser?? criada ',
			'calculatorConfirmSendCalendarModal3': 'contactar ',
			'calculatorConfirmSendCalendarModal4': 'para entregar seu pr??ximo tratamento ',
			'calculatorConfirmSendCalendarModalButton': 'ACEITAR',
			'calculatorConfirmSendCalendarModalButton2': 'FINALIZAR',
			'hisotirlaPrescriptionsEye1': 'Olho direito',
			'hisotirlaPrescriptionsEye2': 'Olho esquerdo',
			'hisotirlaPrescriptionsEyeR': 'Prescri????o do olho direito',
			'hisotirlaPrescriptionsEyeL': 'Prescri????o do olho esquerdo',
			'hisotirlaPrescriptionsEyeE': 'Data de entrega',
			'cancelarButtom': 'Eliminar conta',
			'cancelarButtomModal': 'CANCELAR',
			'modalDeleteAccountText1': 'Voc?? est?? prestes a ',
			'modalDeleteAccountText2': 'deletar sua conta, ',
			'modalDeleteAccountText3': 'tem certeza?. Esta altera????o n??o pode ser revertida',
		};
	}
}
