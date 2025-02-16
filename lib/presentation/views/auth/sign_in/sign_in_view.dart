import 'package:bare_bones_flutter/core/constants/enums/router_enums.dart';
import 'package:bare_bones_flutter/presentation/design_system/widgets/bare_bones_loading_indicator.dart';
import 'package:bare_bones_flutter/presentation/design_system/widgets/bare_bones_scaffold.dart';
import 'package:bare_bones_flutter/presentation/view_models/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final String _emailPattern = r'^[^@]+@[^@]+\.[^@]+$';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonDisabled = true;

  void _validateForm() {
    final form = _formKey.currentState;

    if (form != null) {
      setState(() {
        _isButtonDisabled = !form.validate();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _validateForm();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (p, c) {
      if (p?.isLoading == false && c.isLoading == true) {
        BareBonesLoadingIndicator.of(context).show();
      }
      if (p?.isLoading == true && c.isLoading == false) {
        BareBonesLoadingIndicator.of(context).hide();
      }
      if (p?.isLoggedIn == false && c.isLoggedIn == true) {
        context.go(RouterEnums.dashboardView.routeName);
      }
    });

    return BareBonesScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.enterYourEmail;
                  } else if (!RegExp(_emailPattern).hasMatch(value)) {
                    return AppLocalizations.of(context)!.enterValidEmail;
                  }
                  return null;
                },
                onChanged: (_) => _validateForm(),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.password, errorMaxLines: 2),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.passwordRequired;
                  }
                  return null; // Password is valid.
                },
                onChanged: (_) => _validateForm(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _isButtonDisabled
                        ? null
                        : () {
                          ref
                              .read(authViewModelProvider.notifier)
                              .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        },
                child: Text(AppLocalizations.of(context)!.signIn),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  context.push(RouterEnums.signUpView.routeName);
                },
                child: Text(AppLocalizations.of(context)!.signUpInstead),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
