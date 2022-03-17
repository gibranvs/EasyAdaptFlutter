
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 38 (19.0 per locale)
 *
 * Built on 2022-03-17 at 14:34 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.es;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.es) // set locale
/// - Locale locale = AppLocale.es.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.es) // locale check
enum AppLocale {
	es, // 'es' (base locale, fallback)
	pt, // 'pt'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
_TranslationsEs _t = _currLocale.translations;
_TranslationsEs get t => _t;

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
class Translations {
	Translations._(); // no constructor

	static _TranslationsEs of(BuildContext context) {
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

enum GenderContext {
	male,
	female,
}

// interfaces generated as mixins

mixin PageData2 {
	String get title;
	String? get content => null;
}

// translation instances

late _TranslationsEs _translationsEs = _TranslationsEs.build();
late _TranslationsPt _translationsPt = _TranslationsPt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_TranslationsEs get translations {
		switch (this) {
			case AppLocale.es: return _translationsEs;
			case AppLocale.pt: return _translationsPt;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.es.build(); // build
	/// String a = t.my.path; // access
	_TranslationsEs build() {
		switch (this) {
			case AppLocale.es: return _TranslationsEs.build();
			case AppLocale.pt: return _TranslationsPt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.es: return 'es';
			case AppLocale.pt: return 'pt';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
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
	final _TranslationsEs translations; // store translations to avoid switch call

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
class _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEs.build();

	// ignore: unused_field
	late final _TranslationsEs _root = this;

	// Translations
	String get alert_bottom_subtitle_home_screen => 'Privacy notice number:';
	String get alert_bottom_title_home_screen => 'Notice of Privacy';
	String get button_register_screen => 'Create Account';
	String get calculator_title_home_screen => 'Calculator';
	String get dont_have_account_subtitle_home_screen => 'here';
	String get dont_have_account_title_home_screen => 'Don\'t have an account? Create one ';
	String get hint_text_confirm_password_register_screen => 'confirm password';
	String get hint_text_country_register_screen => 'Parents';
	String get hint_text_email_register_screen => 'E-mail';
	String get hint_text_name_register_screen => 'Full name';
	String get hint_text_password_register_screen => 'Password';
	late final _TranslationsLoginEs login = _TranslationsLoginEs._(_root);
	String get login_title_home_screen => 'Log in';
	String get subtitle_accept_register_screen => 'terms and Conditions';
	String get subtitle_welcome_register_screen => 'Create your account in one step, enter your data';
	String get title_accept_register_screen => 'I agree';
	String get title_app_bar_register_screen => 'Create an account';
	String get title_welcome_register_screen => 'WELCOME!';
}

// Path: login
class _TranslationsLoginEs {
	_TranslationsLoginEs._(this._root);

	// ignore: unused_field
	final _TranslationsEs _root;

	// Translations
	String get fail => 'Logged in failed';
	String get success => 'Logged in successfully';
}

// Path: <root>
class _TranslationsPt extends _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsPt.build()
		: super.build();

	// ignore: unused_field
	@override late final _TranslationsPt _root = this;

	// Translations
	@override String get alert_bottom_subtitle_home_screen => 'Nº do Aviso de Privacidade:';
	@override String get alert_bottom_title_home_screen => 'Aviso de privacidade';
	@override String get button_register_screen => 'Criar uma ';
	@override String get calculator_title_home_screen => 'Calculadora';
	@override String get dont_have_account_subtitle_home_screen => 'aqui';
	@override String get dont_have_account_title_home_screen => 'Não possui uma conta? Crie um';
	@override String get hint_text_confirm_password_register_screen => 'confirmar senha';
	@override String get hint_text_country_register_screen => 'País';
	@override String get hint_text_email_register_screen => 'Correio eletrônico';
	@override String get hint_text_name_register_screen => 'Nome completo';
	@override String get hint_text_password_register_screen => 'Senha';
	@override late final _TranslationsLoginPt login = _TranslationsLoginPt._(_root);
	@override String get login_title_home_screen => 'Iniciar sessão';
	@override String get subtitle_accept_register_screen => 'termos e Condições';
	@override String get subtitle_welcome_register_screen => 'Crie sua conta com uma única etapa, insira seus dados';
	@override String get title_accept_register_screen => 'Eu concordo';
	@override String get title_app_bar_register_screen => 'Criar uma conta';
	@override String get title_welcome_register_screen => 'BEM-VINDO!';
}

// Path: login
class _TranslationsLoginPt extends _TranslationsLoginEs {
	_TranslationsLoginPt._(_TranslationsPt root) : this._root = root, super._(root);

	// ignore: unused_field
	@override final _TranslationsPt _root;

	// Translations
	@override String get fail => 'Login fehlgeschlagen';
	@override String get success => 'Login erfolgreich';
}
