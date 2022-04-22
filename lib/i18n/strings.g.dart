
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 375 (125.0 per locale)
 *
 * Built on 2022-04-21 at 20:46 UTC
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
	String get savePresTitle => 'Confirm';
	String get savePresTitle1 => 'Right eye prescription';
	String get savePresTitle2 => 'Left eye prescription';
	String get savePresSave => 'Save';
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
	@override String get TitleTermsScreen => 'Términos y condiciones';
	@override String get alertBottomSubtitleHomeScreen => 'No. de Aviso de privacidad:';
	@override String get alertBottomTitleHomeScreen => 'Aviso de privacidad';
	@override String get buttonAddPatient => 'Agregar';
	@override String get buttonRegisterScreen => 'Crear cuenta';
	@override String get buttonTitleProfilePage => 'Cambiar';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get card1HomeScreen => 'CALCULADORAS';
	@override String get card2HomeScreen => 'CATÁLOGOS';
	@override String get card3HomeScreen => 'TUTORIALES';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aquí';
	@override String get dontHaveAccountTitleHomeScreen => '¿No tienes cuenta? crea una';
	@override String get hintLastEmailAddPatient => 'Correo electrónico';
	@override String get hintLastNameAddPatient => 'Apellidos';
	@override String get hintNameAddPatient => 'Nombre';
	@override String get hintPhoneAddPatient => 'Teléfono';
	@override String get hintTextConfirmPasswordProfilePage => 'Confirmar contraseña';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar contraseña';
	@override String get hintTextCountryProfilePage => 'País';
	@override String get hintTextCountryRegisterScreen => 'País';
	@override String get hintTextEmailProfilePage => 'Correo';
	@override String get hintTextEmailRegisterScreen => 'Correo electrónico';
	@override String get hintTextNameProfilePage => 'Nombre';
	@override String get hintTextNameRegisterScreen => 'Nombre completo';
	@override String get hintTextNewPasswordProfilePage => 'Nueva contraseña';
	@override String get hintTextPasswordProfilePage => 'Contraseña actual';
	@override String get hintTextPasswordRegisterScreen => 'Contraseña';
	@override String get modalText1TitleRegisterScreen => 'Genial!';
	@override String get modalText1RegisterScreen => 'Cuenta creada exitosamente';
	@override String get modalText2RegisterScreen => 'Asegurate que todos los campos esten llenos';
	@override String get modalText3RegisterScreen => 'Las contraseñas no coinciden';
	@override String get modalText4RegisterScreen => 'Es necesario aceptar los términos y condiciones';
	@override String get hintTextPatientsPage => 'Buscar por nombre';
	@override late final _StringsLoginEs login = _StringsLoginEs._(_root);
	@override String get loginModalErrorTitle => 'Advertencia';
	@override String get loginModalErrorSubtitle => 'Verifica que tus datos sean correctos.';
	@override String get loginTitleHomeScreen => 'Iniciar sesión';
	@override String get savePasswordLoginScreen => 'Recordar contraseña';
	@override String get singOffTitleProfilePage => 'Cerrar sesión';
	@override String get subtitleAcceptRegisterScreen => 'términos y condiciones';
	@override String get subtitleHomeScreen => 'Bienvenido a la herramienta que optimiza tu adapdación';
	@override String get subtitleLoginScreen => 'Hola, introduce tus datos';
	@override String get subtitleWelcomeRegisterScreen => 'Crea tu cuenta con un solo paso, introduce tus datos';
	@override String get titleAcceptRegisterScreen => 'Acepto';
	@override String get titleAddPatient => 'Nuevo paciente';
	@override String get titleAppBarRegisterScreen => 'Crear cuenta';
	@override String get titleButtonLoginScreen => 'Iniciar';
	@override String get titleCatalogPage => 'Catálogo';
	@override String get titleHomeScreen => 'Hola,';
	@override String get titleLoginScreen => 'Iniciar sesión';
	@override String get titlePatientsPage => 'Pacientes';
	@override String get subtitlePatientsPage => 'Para realizar cualquier cálculo debes seleccionar un paciente o crear uno nuevo para guardar los resultados.';
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
	@override String get unselectTextCatalogPage => 'Selecciona de la lista un país para ver su catálogo correspondiente';
	@override String get calc1Title => 'Calculadora esféricos';
	@override String get calc2Title => 'Calculadora tóricos';
	@override String get calc3Title => 'Calculadora multifocales';
	@override String get calc4Title => 'Calculadora monovisión';
	@override String get calc1TitleSpherica => 'Esféricos';
	@override String get calc2TitleToric => 'Tóricos';
	@override late final _StringsCalculatorEsfericosEs calculatorEsfericos = _StringsCalculatorEsfericosEs._(_root);
	@override late final _StringsCalculatorToricosEs calculatorToricos = _StringsCalculatorToricosEs._(_root);
	@override late final _StringsCalculatorMultifocalEs calculatorMultifocal = _StringsCalculatorMultifocalEs._(_root);
	@override String get calculatorResultsTitle1 => 'Datos calculados';
	@override String get calculatorResultsTitle2 => 'Prescripción final para lente de contacto';
	@override String get calculatorResultsTitle3 => 'Productos recomendados';
	@override String get setPatientTitle => 'Genial!';
	@override String get setPatientSubtitle => 'El paciente ha sido registrado.';
	@override String get setPatientTitleProblem => 'Advertencia';
	@override String get setPatientSubtitleProblem => 'Ingresa todos los campos.';
	@override String get backModalBottom => 'ATRÁS';
	@override String get saveModalBottom => 'GUARDAR';
	@override String get saveModalBottomRight => '¿Guardar solo la prescripción del ojo derecho?';
	@override String get saveModalBottomLeft => '¿Guardar solo la prescripción del ojo izquierdo?';
	@override String get savePresTitle => 'Confirmar';
	@override String get savePresTitle1 => 'Prescripción ojo derecho';
	@override String get savePresTitle2 => 'Prescripción ojo izquierdo';
	@override String get savePresSave => 'Guardar';
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
	@override String get title => 'Selección del paciente';
}

// Path: tutoriales.1
class _Strings0i1Es implements _Strings0i1En {
	_Strings0i1Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/eleccion_lente.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4';
	@override String get title => 'Elección del lente de contacto';
}

// Path: tutoriales.2
class _Strings0i2Es implements _Strings0i2En {
	_Strings0i2Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_esfericos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4';
	@override String get title => 'Adaptación esféricos';
}

// Path: tutoriales.3
class _Strings0i3Es implements _Strings0i3En {
	_Strings0i3Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_toricos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4';
	@override String get title => 'Adaptación tóricos';
}

// Path: tutoriales.4
class _Strings0i4Es implements _Strings0i4En {
	_Strings0i4Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_multifocal.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4';
	@override String get title => 'Adaptación multifocal';
}

// Path: tutoriales.5
class _Strings0i5Es implements _Strings0i5En {
	_Strings0i5Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_monovision.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4';
	@override String get title => 'Adaptación monovisión';
}

// Path: tutoriales.6
class _Strings0i6Es implements _Strings0i6En {
	_Strings0i6Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_gabinete.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4';
	@override String get title => 'Inserción y remoción en el gabinete';
}

// Path: tutoriales.7
class _Strings0i7Es implements _Strings0i7En {
	_Strings0i7Es._(this._root);

	// ignore: unused_field
	@override final _StringsEs _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_casa.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4';
	@override String get title => 'Inserción, remoción y mantenimiento en casa';
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
	@override String get TitleTermsScreen => 'Termos e Condições';
	@override String get alertBottomSubtitleHomeScreen => 'Nº do Aviso de Privacidade:';
	@override String get alertBottomTitleHomeScreen => 'Aviso de privacidade';
	@override String get buttonAddPatient => 'Adicionar';
	@override String get buttonRegisterScreen => 'Criar uma ';
	@override String get buttonTitleProfilePage => 'Mudar';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get card1HomeScreen => 'CALCULADORAS';
	@override String get card2HomeScreen => 'CATÁLOGOS';
	@override String get card3HomeScreen => 'TUTORIAIS';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aqui';
	@override String get dontHaveAccountTitleHomeScreen => 'Não possui uma conta? Crie um';
	@override String get hintLastEmailAddPatient => 'Correio eletrônico';
	@override String get hintLastNameAddPatient => 'Sobrenomes';
	@override String get hintNameAddPatient => 'Nome';
	@override String get hintPhoneAddPatient => 'Telefone';
	@override String get hintTextConfirmPasswordProfilePage => 'Confirmar senha';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar senha';
	@override String get hintTextCountryProfilePage => 'País';
	@override String get hintTextCountryRegisterScreen => 'País';
	@override String get hintTextEmailProfilePage => 'Correspondência';
	@override String get hintTextEmailRegisterScreen => 'Correio eletrônico';
	@override String get hintTextNameProfilePage => 'Nome';
	@override String get hintTextNameRegisterScreen => 'Nome completo';
	@override String get hintTextNewPasswordProfilePage => 'Nova senha';
	@override String get hintTextPasswordProfilePage => 'Senha atual';
	@override String get hintTextPasswordRegisterScreen => 'Senha';
	@override String get modalText1TitleRegisterScreen => 'Brilhante!';
	@override String get modalText1RegisterScreen => 'Conta criada com sucesso';
	@override String get modalText2RegisterScreen => 'Verifique se todos os campos estão preenchidos';
	@override String get modalText3RegisterScreen => 'As senhas não coincidem';
	@override String get modalText4RegisterScreen => 'É necessário aceitar os termos e condições';
	@override String get hintTextPatientsPage => 'Procura por nome';
	@override late final _StringsLoginPt login = _StringsLoginPt._(_root);
	@override String get loginModalErrorTitle => 'Aviso';
	@override String get loginModalErrorSubtitle => 'Verifique se seus dados estão corretos.';
	@override String get loginTitleHomeScreen => 'Iniciar sessão';
	@override String get savePasswordLoginScreen => 'Lembrar senha';
	@override String get singOffTitleProfilePage => 'Fechar Sessão';
	@override String get subtitleAcceptRegisterScreen => 'termos e Condições';
	@override String get subtitleHomeScreen => 'Bem-vindo à ferramenta que otimiza sua adaptação';
	@override String get subtitleLoginScreen => 'Olá, insira suas informações';
	@override String get subtitleWelcomeRegisterScreen => 'Crie sua conta com uma única etapa, insira seus dados';
	@override String get titleAcceptRegisterScreen => 'Eu concordo';
	@override String get titleAddPatient => 'Novo paciente';
	@override String get titleAppBarRegisterScreen => 'Criar uma conta';
	@override String get titleButtonLoginScreen => 'Iniciar';
	@override String get titleCatalogPage => 'Catálogo';
	@override String get titleHomeScreen => 'Olá,';
	@override String get titleLoginScreen => 'Iniciar sessão';
	@override String get titlePatientsPage => 'Pacientes';
	@override String get subtitlePatientsPage => 'Para realizar qualquer cálculo, você deve selecionar um paciente ou criar um novo para salvar os resultados.';
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
	@override String get unselectTextCatalogPage => 'Selecione um país da lista para ver seu catálogo correspondente';
	@override String get calc1Title => 'Calculadora esférica';
	@override String get calc2Title => 'Calculadora tórica';
	@override String get calc3Title => 'Calculadora multifocal';
	@override String get calc4Title => 'Calculadora Monovisão';
	@override String get calc1TitleSpherica => 'Esférica';
	@override String get calc2TitleToric => 'Tórica';
	@override late final _StringsCalculatorEsfericosPt calculatorEsfericos = _StringsCalculatorEsfericosPt._(_root);
	@override late final _StringsCalculatorToricosPt calculatorToricos = _StringsCalculatorToricosPt._(_root);
	@override late final _StringsCalculatorMultifocalPt calculatorMultifocal = _StringsCalculatorMultifocalPt._(_root);
	@override String get calculatorResultsTitle1 => 'Dados calculados';
	@override String get calculatorResultsTitle2 => 'Prescrição final para lentes de contato';
	@override String get calculatorResultsTitle3 => 'Produtos recomendados';
	@override String get setPatientTitle => 'Brilhante!';
	@override String get setPatientSubtitle => 'O paciente foi cadastrado.';
	@override String get setPatientTitleProblem => 'Embargo';
	@override String get setPatientSubtitleProblem => 'Digite todos os campos.';
	@override String get backModalBottom => 'COSTAS';
	@override String get saveModalBottom => 'SALVE ';
	@override String get saveModalBottomRight => 'Manter apenas a prescrição do olho direito?';
	@override String get saveModalBottomLeft => 'Manter apenas a prescrição do olho esquerdo?';
	@override String get savePresTitle => 'Confirme';
	@override String get savePresTitle1 => 'Prescrição do olho direito';
	@override String get savePresTitle2 => 'Prescrição do olho esquerdo';
	@override String get savePresSave => 'Salve';
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
	@override String get title => 'Seleção de pacientes';
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
	@override String get title => 'Adaptação esférica';
}

// Path: tutoriales.3
class _Strings0i3Pt implements _Strings0i3En {
	_Strings0i3Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_toricos.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4';
	@override String get title => 'Adaptação tórica';
}

// Path: tutoriales.4
class _Strings0i4Pt implements _Strings0i4En {
	_Strings0i4Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_multifocal.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4';
	@override String get title => 'Adaptação multifocal';
}

// Path: tutoriales.5
class _Strings0i5Pt implements _Strings0i5En {
	_Strings0i5Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/adaptacion_monovision.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4';
	@override String get title => 'Adaptação à monovisão';
}

// Path: tutoriales.6
class _Strings0i6Pt implements _Strings0i6En {
	_Strings0i6Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_gabinete.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4';
	@override String get title => 'Inserção e remoção no gabinete';
}

// Path: tutoriales.7
class _Strings0i7Pt implements _Strings0i7En {
	_Strings0i7Pt._(this._root);

	// ignore: unused_field
	@override final _StringsPt _root;

	// Translations
	@override String get image => './assets/tutorials/insercion_casa.png';
	@override String get link => 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4';
	@override String get title => 'Inserção, remoção e manutenção em casa';
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
	@override String get distance => 'Distância';
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
	@override String get distance => 'Distância';
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
	@override String get distance => 'Distância';
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
			'savePresTitle': 'Confirm',
			'savePresTitle1': 'Right eye prescription',
			'savePresTitle2': 'Left eye prescription',
			'savePresSave': 'Save',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Términos y condiciones',
			'alertBottomSubtitleHomeScreen': 'No. de Aviso de privacidad:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidad',
			'buttonAddPatient': 'Agregar',
			'buttonRegisterScreen': 'Crear cuenta',
			'buttonTitleProfilePage': 'Cambiar',
			'calculatorTitleHomeScreen': 'Calculadora',
			'card1HomeScreen': 'CALCULADORAS',
			'card2HomeScreen': 'CATÁLOGOS',
			'card3HomeScreen': 'TUTORIALES',
			'dontHaveAccountSubtitleHomeScreen': 'aquí',
			'dontHaveAccountTitleHomeScreen': '¿No tienes cuenta? crea una',
			'hintLastEmailAddPatient': 'Correo electrónico',
			'hintLastNameAddPatient': 'Apellidos',
			'hintNameAddPatient': 'Nombre',
			'hintPhoneAddPatient': 'Teléfono',
			'hintTextConfirmPasswordProfilePage': 'Confirmar contraseña',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar contraseña',
			'hintTextCountryProfilePage': 'País',
			'hintTextCountryRegisterScreen': 'País',
			'hintTextEmailProfilePage': 'Correo',
			'hintTextEmailRegisterScreen': 'Correo electrónico',
			'hintTextNameProfilePage': 'Nombre',
			'hintTextNameRegisterScreen': 'Nombre completo',
			'hintTextNewPasswordProfilePage': 'Nueva contraseña',
			'hintTextPasswordProfilePage': 'Contraseña actual',
			'hintTextPasswordRegisterScreen': 'Contraseña',
			'modalText1TitleRegisterScreen': 'Genial!',
			'modalText1RegisterScreen': 'Cuenta creada exitosamente',
			'modalText2RegisterScreen': 'Asegurate que todos los campos esten llenos',
			'modalText3RegisterScreen': 'Las contraseñas no coinciden',
			'modalText4RegisterScreen': 'Es necesario aceptar los términos y condiciones',
			'hintTextPatientsPage': 'Buscar por nombre',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginModalErrorTitle': 'Advertencia',
			'loginModalErrorSubtitle': 'Verifica que tus datos sean correctos.',
			'loginTitleHomeScreen': 'Iniciar sesión',
			'savePasswordLoginScreen': 'Recordar contraseña',
			'singOffTitleProfilePage': 'Cerrar sesión',
			'subtitleAcceptRegisterScreen': 'términos y condiciones',
			'subtitleHomeScreen': 'Bienvenido a la herramienta que optimiza tu adapdación',
			'subtitleLoginScreen': 'Hola, introduce tus datos',
			'subtitleWelcomeRegisterScreen': 'Crea tu cuenta con un solo paso, introduce tus datos',
			'titleAcceptRegisterScreen': 'Acepto',
			'titleAddPatient': 'Nuevo paciente',
			'titleAppBarRegisterScreen': 'Crear cuenta',
			'titleButtonLoginScreen': 'Iniciar',
			'titleCatalogPage': 'Catálogo',
			'titleHomeScreen': 'Hola,',
			'titleLoginScreen': 'Iniciar sesión',
			'titlePatientsPage': 'Pacientes',
			'subtitlePatientsPage': 'Para realizar cualquier cálculo debes seleccionar un paciente o crear uno nuevo para guardar los resultados.',
			'titleProfilePage': 'Perfil',
			'titleTutorialesPage': 'Tutoriales',
			'titleWelcomeRegisterScreen': 'BIENVENIDO!',
			'tutoriales.0.image': './assets/tutorials/seleccion_pacientes.png',
			'tutoriales.0.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4',
			'tutoriales.0.title': 'Selección del paciente',
			'tutoriales.1.image': './assets/tutorials/eleccion_lente.png',
			'tutoriales.1.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4',
			'tutoriales.1.title': 'Elección del lente de contacto',
			'tutoriales.2.image': './assets/tutorials/adaptacion_esfericos.png',
			'tutoriales.2.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4',
			'tutoriales.2.title': 'Adaptación esféricos',
			'tutoriales.3.image': './assets/tutorials/adaptacion_toricos.png',
			'tutoriales.3.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4',
			'tutoriales.3.title': 'Adaptación tóricos',
			'tutoriales.4.image': './assets/tutorials/adaptacion_multifocal.png',
			'tutoriales.4.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4',
			'tutoriales.4.title': 'Adaptación multifocal',
			'tutoriales.5.image': './assets/tutorials/adaptacion_monovision.png',
			'tutoriales.5.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4',
			'tutoriales.5.title': 'Adaptación monovisión',
			'tutoriales.6.image': './assets/tutorials/insercion_gabinete.png',
			'tutoriales.6.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4',
			'tutoriales.6.title': 'Inserción y remoción en el gabinete',
			'tutoriales.7.image': './assets/tutorials/insercion_casa.png',
			'tutoriales.7.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4',
			'tutoriales.7.title': 'Inserción, remoción y mantenimiento en casa',
			'unselectTextCatalogPage': 'Selecciona de la lista un país para ver su catálogo correspondiente',
			'calc1Title': 'Calculadora esféricos',
			'calc2Title': 'Calculadora tóricos',
			'calc3Title': 'Calculadora multifocales',
			'calc4Title': 'Calculadora monovisión',
			'calc1TitleSpherica': 'Esféricos',
			'calc2TitleToric': 'Tóricos',
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
			'calculatorResultsTitle2': 'Prescripción final para lente de contacto',
			'calculatorResultsTitle3': 'Productos recomendados',
			'setPatientTitle': 'Genial!',
			'setPatientSubtitle': 'El paciente ha sido registrado.',
			'setPatientTitleProblem': 'Advertencia',
			'setPatientSubtitleProblem': 'Ingresa todos los campos.',
			'backModalBottom': 'ATRÁS',
			'saveModalBottom': 'GUARDAR',
			'saveModalBottomRight': '¿Guardar solo la prescripción del ojo derecho?',
			'saveModalBottomLeft': '¿Guardar solo la prescripción del ojo izquierdo?',
			'savePresTitle': 'Confirmar',
			'savePresTitle1': 'Prescripción ojo derecho',
			'savePresTitle2': 'Prescripción ojo izquierdo',
			'savePresSave': 'Guardar',
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Termos e Condições',
			'alertBottomSubtitleHomeScreen': 'Nº do Aviso de Privacidade:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidade',
			'buttonAddPatient': 'Adicionar',
			'buttonRegisterScreen': 'Criar uma ',
			'buttonTitleProfilePage': 'Mudar',
			'calculatorTitleHomeScreen': 'Calculadora',
			'card1HomeScreen': 'CALCULADORAS',
			'card2HomeScreen': 'CATÁLOGOS',
			'card3HomeScreen': 'TUTORIAIS',
			'dontHaveAccountSubtitleHomeScreen': 'aqui',
			'dontHaveAccountTitleHomeScreen': 'Não possui uma conta? Crie um',
			'hintLastEmailAddPatient': 'Correio eletrônico',
			'hintLastNameAddPatient': 'Sobrenomes',
			'hintNameAddPatient': 'Nome',
			'hintPhoneAddPatient': 'Telefone',
			'hintTextConfirmPasswordProfilePage': 'Confirmar senha',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar senha',
			'hintTextCountryProfilePage': 'País',
			'hintTextCountryRegisterScreen': 'País',
			'hintTextEmailProfilePage': 'Correspondência',
			'hintTextEmailRegisterScreen': 'Correio eletrônico',
			'hintTextNameProfilePage': 'Nome',
			'hintTextNameRegisterScreen': 'Nome completo',
			'hintTextNewPasswordProfilePage': 'Nova senha',
			'hintTextPasswordProfilePage': 'Senha atual',
			'hintTextPasswordRegisterScreen': 'Senha',
			'modalText1TitleRegisterScreen': 'Brilhante!',
			'modalText1RegisterScreen': 'Conta criada com sucesso',
			'modalText2RegisterScreen': 'Verifique se todos os campos estão preenchidos',
			'modalText3RegisterScreen': 'As senhas não coincidem',
			'modalText4RegisterScreen': 'É necessário aceitar os termos e condições',
			'hintTextPatientsPage': 'Procura por nome',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginModalErrorTitle': 'Aviso',
			'loginModalErrorSubtitle': 'Verifique se seus dados estão corretos.',
			'loginTitleHomeScreen': 'Iniciar sessão',
			'savePasswordLoginScreen': 'Lembrar senha',
			'singOffTitleProfilePage': 'Fechar Sessão',
			'subtitleAcceptRegisterScreen': 'termos e Condições',
			'subtitleHomeScreen': 'Bem-vindo à ferramenta que otimiza sua adaptação',
			'subtitleLoginScreen': 'Olá, insira suas informações',
			'subtitleWelcomeRegisterScreen': 'Crie sua conta com uma única etapa, insira seus dados',
			'titleAcceptRegisterScreen': 'Eu concordo',
			'titleAddPatient': 'Novo paciente',
			'titleAppBarRegisterScreen': 'Criar uma conta',
			'titleButtonLoginScreen': 'Iniciar',
			'titleCatalogPage': 'Catálogo',
			'titleHomeScreen': 'Olá,',
			'titleLoginScreen': 'Iniciar sessão',
			'titlePatientsPage': 'Pacientes',
			'subtitlePatientsPage': 'Para realizar qualquer cálculo, você deve selecionar um paciente ou criar um novo para salvar os resultados.',
			'titleProfilePage': 'Perfil',
			'titleTutorialesPage': 'Tutoriais',
			'titleWelcomeRegisterScreen': 'BEM-VINDO!',
			'tutoriales.0.image': './assets/tutorials/seleccion_pacientes.png',
			'tutoriales.0.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-1-SP-SD.mp4',
			'tutoriales.0.title': 'Seleção de pacientes',
			'tutoriales.1.image': './assets/tutorials/eleccion_lente.png',
			'tutoriales.1.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-2-ELC-SD.mp4',
			'tutoriales.1.title': 'Escolha da lente de contato',
			'tutoriales.2.image': './assets/tutorials/adaptacion_esfericos.png',
			'tutoriales.2.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-3-AE-SD.mp4',
			'tutoriales.2.title': 'Adaptação esférica',
			'tutoriales.3.image': './assets/tutorials/adaptacion_toricos.png',
			'tutoriales.3.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-4-AT-SD.mp4',
			'tutoriales.3.title': 'Adaptação tórica',
			'tutoriales.4.image': './assets/tutorials/adaptacion_multifocal.png',
			'tutoriales.4.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-5-AMF-SD.mp4',
			'tutoriales.4.title': 'Adaptação multifocal',
			'tutoriales.5.image': './assets/tutorials/adaptacion_monovision.png',
			'tutoriales.5.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-6-AMONO-SD.mp4',
			'tutoriales.5.title': 'Adaptação à monovisão',
			'tutoriales.6.image': './assets/tutorials/insercion_gabinete.png',
			'tutoriales.6.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-7-IRG-SD.mp4',
			'tutoriales.6.title': 'Inserção e remoção no gabinete',
			'tutoriales.7.image': './assets/tutorials/insercion_casa.png',
			'tutoriales.7.link': 'http://c1571423.ferozo.com/tutoriales/VID-BL-8-IRMC-SD.mp4',
			'tutoriales.7.title': 'Inserção, remoção e manutenção em casa',
			'unselectTextCatalogPage': 'Selecione um país da lista para ver seu catálogo correspondente',
			'calc1Title': 'Calculadora esférica',
			'calc2Title': 'Calculadora tórica',
			'calc3Title': 'Calculadora multifocal',
			'calc4Title': 'Calculadora Monovisão',
			'calc1TitleSpherica': 'Esférica',
			'calc2TitleToric': 'Tórica',
			'calculatorEsfericos.text': 'Para calcular \n \n1. Escolha o tipo de lente \n2. Insira os dados correspondentes para cada olho (direito e/ou esquerdo).',
			'calculatorEsfericos.eyeRight': 'CERTO',
			'calculatorEsfericos.eyeLeft': 'ESQUERDO',
			'calculatorEsfericos.type': 'Tipo de lente',
			'calculatorEsfericos.esphere': 'Esfera',
			'calculatorEsfericos.distance': 'Distância',
			'calculatorEsfericos.button': 'Calcular',
			'calculatorToricos.eyeRight': 'CERTO',
			'calculatorToricos.eyeLeft': 'ESQUERDO',
			'calculatorToricos.type': 'Tipo de lente',
			'calculatorToricos.esphere': 'Esfera',
			'calculatorToricos.distance': 'Distância',
			'calculatorToricos.cylinder': 'Cilindro',
			'calculatorToricos.axis': 'Eixo',
			'calculatorToricos.button': 'Calcular',
			'calculatorMultifocal.eyeRight': 'CERTO',
			'calculatorMultifocal.eyeLeft': 'ESQUERDO',
			'calculatorMultifocal.type': 'Tipo de lente',
			'calculatorMultifocal.esphere': 'Esfera',
			'calculatorMultifocal.distance': 'Distância',
			'calculatorMultifocal.cylinder': 'Cilindro',
			'calculatorMultifocal.dominant': 'Dominante',
			'calculatorMultifocal.button': 'Calcular',
			'calculatorResultsTitle1': 'Dados calculados',
			'calculatorResultsTitle2': 'Prescrição final para lentes de contato',
			'calculatorResultsTitle3': 'Produtos recomendados',
			'setPatientTitle': 'Brilhante!',
			'setPatientSubtitle': 'O paciente foi cadastrado.',
			'setPatientTitleProblem': 'Embargo',
			'setPatientSubtitleProblem': 'Digite todos os campos.',
			'backModalBottom': 'COSTAS',
			'saveModalBottom': 'SALVE ',
			'saveModalBottomRight': 'Manter apenas a prescrição do olho direito?',
			'saveModalBottomLeft': 'Manter apenas a prescrição do olho esquerdo?',
			'savePresTitle': 'Confirme',
			'savePresTitle1': 'Prescrição do olho direito',
			'savePresTitle2': 'Prescrição do olho esquerdo',
			'savePresSave': 'Salve',
		};
	}
}
