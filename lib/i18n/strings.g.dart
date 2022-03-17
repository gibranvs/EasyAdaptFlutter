
/*
 * Generated file. Do not edit.
 *
 * Locales: 3
 * Strings: 60 (20.0 per locale)
 *
 * Built on 2022-03-17 at 15:41 UTC
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
	String get buttonRegisterScreen => 'Create Account';
	String get calculatorTitleHomeScreen => 'Calculator';
	String get dontHaveAccountSubtitleHomeScreen => 'here';
	String get dontHaveAccountTitleHomeScreen => 'Don\'t have an account? Create one ';
	String get hintTextConfirmPasswordRegisterScreen => 'confirm password';
	String get hintTextCountryRegisterScreen => 'Parents';
	String get hintTextEmailRegisterScreen => 'E-mail';
	String get hintTextNameRegisterScreen => 'Full name';
	String get hintTextPasswordRegisterScreen => 'Password';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	String get loginTitleHomeScreen => 'Log in';
	String get subtitleAcceptRegisterScreen => 'terms and Conditions';
	String get subtitleWelcomeRegisterScreen => 'Create your account in one step, enter your data';
	String get titleAcceptRegisterScreen => 'I agree';
	String get titleAppBarRegisterScreen => 'Create an account';
	String get titleWelcomeRegisterScreen => 'WELCOME!';
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
	@override String get buttonRegisterScreen => 'Crear cuenta';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aquí';
	@override String get dontHaveAccountTitleHomeScreen => '¿No tienes cuenta? crea una';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar contraseña';
	@override String get hintTextCountryRegisterScreen => 'País';
	@override String get hintTextEmailRegisterScreen => 'Correo electrónico';
	@override String get hintTextNameRegisterScreen => 'Nombre completo';
	@override String get hintTextPasswordRegisterScreen => 'Contraseña';
	@override late final _StringsLoginEs login = _StringsLoginEs._(_root);
	@override String get loginTitleHomeScreen => 'Iniciar sesión';
	@override String get subtitleAcceptRegisterScreen => 'términos y condiciones';
	@override String get subtitleWelcomeRegisterScreen => 'Crea tu cuenta con un solo paso, introduce tus datos';
	@override String get titleAcceptRegisterScreen => 'Acepto';
	@override String get titleAppBarRegisterScreen => 'Crear cuenta';
	@override String get titleWelcomeRegisterScreen => 'BIENVENIDO!';
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
	@override String get buttonRegisterScreen => 'Criar uma ';
	@override String get calculatorTitleHomeScreen => 'Calculadora';
	@override String get dontHaveAccountSubtitleHomeScreen => 'aqui';
	@override String get dontHaveAccountTitleHomeScreen => 'Não possui uma conta? Crie um';
	@override String get hintTextConfirmPasswordRegisterScreen => 'Confirmar senha';
	@override String get hintTextCountryRegisterScreen => 'País';
	@override String get hintTextEmailRegisterScreen => 'Correio eletrônico';
	@override String get hintTextNameRegisterScreen => 'Nome completo';
	@override String get hintTextPasswordRegisterScreen => 'Senha';
	@override late final _StringsLoginPt login = _StringsLoginPt._(_root);
	@override String get loginTitleHomeScreen => 'Iniciar sessão';
	@override String get subtitleAcceptRegisterScreen => 'termos e Condições';
	@override String get subtitleWelcomeRegisterScreen => 'Crie sua conta com uma única etapa, insira seus dados';
	@override String get titleAcceptRegisterScreen => 'Eu concordo';
	@override String get titleAppBarRegisterScreen => 'Criar uma conta';
	@override String get titleWelcomeRegisterScreen => 'BEM-VINDO!';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Terms and Conditions',
			'alertBottomSubtitleHomeScreen': 'Privacy notice number:',
			'alertBottomTitleHomeScreen': 'Notice of Privacy',
			'buttonRegisterScreen': 'Create Account',
			'calculatorTitleHomeScreen': 'Calculator',
			'dontHaveAccountSubtitleHomeScreen': 'here',
			'dontHaveAccountTitleHomeScreen': 'Don\'t have an account? Create one ',
			'hintTextConfirmPasswordRegisterScreen': 'confirm password',
			'hintTextCountryRegisterScreen': 'Parents',
			'hintTextEmailRegisterScreen': 'E-mail',
			'hintTextNameRegisterScreen': 'Full name',
			'hintTextPasswordRegisterScreen': 'Password',
			'login.fail': 'Logged in failed',
			'login.success': 'Logged in successfully',
			'loginTitleHomeScreen': 'Log in',
			'subtitleAcceptRegisterScreen': 'terms and Conditions',
			'subtitleWelcomeRegisterScreen': 'Create your account in one step, enter your data',
			'titleAcceptRegisterScreen': 'I agree',
			'titleAppBarRegisterScreen': 'Create an account',
			'titleWelcomeRegisterScreen': 'WELCOME!',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Términos y condiciones',
			'alertBottomSubtitleHomeScreen': 'No. de Aviso de privacidad:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidad',
			'buttonRegisterScreen': 'Crear cuenta',
			'calculatorTitleHomeScreen': 'Calculadora',
			'dontHaveAccountSubtitleHomeScreen': 'aquí',
			'dontHaveAccountTitleHomeScreen': '¿No tienes cuenta? crea una',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar contraseña',
			'hintTextCountryRegisterScreen': 'País',
			'hintTextEmailRegisterScreen': 'Correo electrónico',
			'hintTextNameRegisterScreen': 'Nombre completo',
			'hintTextPasswordRegisterScreen': 'Contraseña',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginTitleHomeScreen': 'Iniciar sesión',
			'subtitleAcceptRegisterScreen': 'términos y condiciones',
			'subtitleWelcomeRegisterScreen': 'Crea tu cuenta con un solo paso, introduce tus datos',
			'titleAcceptRegisterScreen': 'Acepto',
			'titleAppBarRegisterScreen': 'Crear cuenta',
			'titleWelcomeRegisterScreen': 'BIENVENIDO!',
		};
	}
}

extension on _StringsPt {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'TitleTermsScreen': 'Termos e Condições',
			'alertBottomSubtitleHomeScreen': 'Nº do Aviso de Privacidade:',
			'alertBottomTitleHomeScreen': 'Aviso de privacidade',
			'buttonRegisterScreen': 'Criar uma ',
			'calculatorTitleHomeScreen': 'Calculadora',
			'dontHaveAccountSubtitleHomeScreen': 'aqui',
			'dontHaveAccountTitleHomeScreen': 'Não possui uma conta? Crie um',
			'hintTextConfirmPasswordRegisterScreen': 'Confirmar senha',
			'hintTextCountryRegisterScreen': 'País',
			'hintTextEmailRegisterScreen': 'Correio eletrônico',
			'hintTextNameRegisterScreen': 'Nome completo',
			'hintTextPasswordRegisterScreen': 'Senha',
			'login.fail': 'Login fehlgeschlagen',
			'login.success': 'Login erfolgreich',
			'loginTitleHomeScreen': 'Iniciar sessão',
			'subtitleAcceptRegisterScreen': 'termos e Condições',
			'subtitleWelcomeRegisterScreen': 'Crie sua conta com uma única etapa, insira seus dados',
			'titleAcceptRegisterScreen': 'Eu concordo',
			'titleAppBarRegisterScreen': 'Criar uma conta',
			'titleWelcomeRegisterScreen': 'BEM-VINDO!',
		};
	}
}
