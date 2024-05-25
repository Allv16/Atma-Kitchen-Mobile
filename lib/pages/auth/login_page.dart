import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:atma_kitchen/core/routes/routes.dart';
import 'package:atma_kitchen/pages/auth/controllers/login_controller.dart';
import 'package:atma_kitchen/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryLight,
                      borderRadius: const BorderRadius.only(
                          bottomRight:
                              Radius.circular(RadiusConstants.RADIUS_6XL),
                          bottomLeft:
                              Radius.circular(RadiusConstants.RADIUS_6XL))),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: PaddingConstants.PADDING_DEFAULT),
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset('assets/images/auth/ic_login.png',
                            fit: BoxFit.fitHeight)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.PADDING_DEFAULT),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',
                          style: GoogleFonts.cormorant(
                            fontSize: TextConstants.TEXT_3XL,
                            fontWeight: FontWeight.bold,
                          )),
                      const Text('ready to begin the order?',
                          style: TextStyle(
                              fontSize: TextConstants.TEXT_SMALL,
                              color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(
                    height: PaddingConstants.PADDING_MEDIUM,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextFormField(
                              controller: controller.usernameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Username',
                                prefixIcon: Icon(Icons.person_outline),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: PaddingConstants.PADDING_DEFAULT,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextFormField(
                              controller: controller.passwordController,
                              obscureText: controller.obscureText.value,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.obscureText.value =
                                          !controller.obscureText.value;
                                    },
                                    icon: Icon(controller.obscureText.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/forget-password');
                            },
                            child: Text('Forget Password?',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                          ),
                        ),
                        const SizedBox(
                          height: PaddingConstants.PADDING_LARGE,
                        ),
                        primaryFilledButton(
                            isLoading: controller.loading.value,
                            context: context,
                            text: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: PaddingConstants.PADDING_2XS,
                  ),
                  Align(
                    child: Text("Don't have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey)),
                  ),
                  const SizedBox(
                    height: PaddingConstants.PADDING_2XS,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(
                              double.infinity, HeightConstants.BUTTON_HEIGHT),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      onPressed: () {
                        Get.toNamed(RoutesName.register);
                      },
                      child: const Text('Register')),
                  const SizedBox(
                    height: PaddingConstants.PADDING_DEFAULT,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.home);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Continue as guest',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                          Icon(Icons.arrow_forward,
                              color: Theme.of(context).colorScheme.primary),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
