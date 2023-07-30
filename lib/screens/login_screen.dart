import 'package:fitness/provider/auth_provider.dart';
import 'package:fitness/utils/utility.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/buttons.dart';
import 'package:fitness/widgets/rounded_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _mobileKey = GlobalKey<FormFieldState>();

  _signIn() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      await context.read<AuthProvider>().signIn();
    }
  }

  @override
  void initState() {
    context.read<AuthProvider>().init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 60),
                      child: Text(
                        'ورود | ثبت نام',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: MainColors.grayDarkest,
                        ),
                      ),
                    ),
                    RoundedTextFormField(
                      fieldKey: _mobileKey,
                      hint: 'شماره موبایل',
                      onSaved: (e) => context.read<AuthProvider>().signInMobile = e!,
                      inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      validator: (value) => Utility.phoneNumberValidator(value!),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
            FilledRoundedButton(
              label: 'ورود',
              onTap: () {
                _signIn();
              }
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'ورود/ثبت نام به منزله پذیرش\n',
                    style: const TextStyle(
                      color: MainColors.grayDarkest,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Shabnam',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'شرایط استفاده',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(fontWeight: FontWeight.w700, color: MainColors.primaryColor),
                      ),
                      const TextSpan(text: ' و '),
                      TextSpan(
                        text: 'حریم خصوصی',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(fontWeight: FontWeight.w700, color: MainColors.primaryColor),
                      ),
                      const TextSpan(text: ' است'),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}