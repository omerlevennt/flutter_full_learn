part of './login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText;

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isComleted) {
          context.route.navigateToPage(const ImageLearn());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (_formLoginKey.currentState?.validate() ?? false) {
                  context.read<LoginCubit>().checkUser(
                      _emailController.text, _passwordController.text);
                }
              },
              child: Padding(
                padding: const MyPadding.all(),
                child: Text('$_loginText  -  ${state.model?.email ?? ''}'),
              ),
            );
          },
        );
      },
    );
  }
}

class _LoginFields extends StatelessWidget {
  const _LoginFields({
    required TextEditingController email,
    required TextEditingController password,
  })  : _email = email,
        _password = password;
  final TextEditingController _email;
  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.duration.durationLow,
            opacity: state ? 0.5 : 1,
            child: Column(
              children: [
                Padding(
                  padding: const MyPadding.bottom(),
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? data) =>
                        (data?.ext.isValidEmail ?? false) ? null : 'problem',
                  ),
                ),
                Padding(
                  padding: const MyPadding.bottom(),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Pasword'),
                    validator: (String? data) =>
                        ((data?.length ?? 0) > 5) ? null : 'problem',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
