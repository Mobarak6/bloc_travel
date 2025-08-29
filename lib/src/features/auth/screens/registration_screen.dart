import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/l10n/l10n.dart';
import 'package:travel_app/src/shared/utils/styles.dart';
import 'package:travel_app/src/shared/widgets/custom_app_bar.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();

  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n.registration),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Center(
          child: Form(
            key: signUpKey,
            child: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

                Text('welcome'.tr, style: robotoBold.copyWith(
                  fontSize: Dimensions.fontSizeOverLarge, color: Theme.of(context).primaryColor,
                )),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                Text('sign_up_to_access_your_account'.tr, style: robotoRegular.copyWith(
                  fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor,
                )),


                SizedBox(height: Get.height * 0.07),

                CustomTextFieldWidget(
                  labelText: 'full_name'.tr,
                  hintText: 'enter_full_name'.tr,
                  controller: _nameController,
                  focusNode: _nameFocus,
                  required: true,
                  nextFocus: _phoneFocus,
                  inputType: TextInputType.text,
                  prefixIcon:  Icons.person,
                  validator: (String? value){
                    return ValidateCheck.validateEmptyText(value, null);
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  countryDialCode: authController.countryCode,
                  labelText: 'phone_number'.tr,
                  hintText: 'enter_phone_number'.tr,
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  required: true,
                  nextFocus: _passwordFocus,
                  inputType: TextInputType.phone,
                  prefixIcon:  Icons.phone,
                  validator: (String? value){
                    if( ValidateCheck.getValidPhone(value!,authController.countryCode) == ""){
                      return "enter_valid_phone_number".tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  hintText: '8_character'.tr,
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  nextFocus: _confirmPasswordFocus,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  labelText: 'password'.tr,
                  required: true,
                  validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_password".tr),
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomTextFieldWidget(
                  hintText: '8_character'.tr,
                  controller: _conformPasswordController,
                  focusNode: _confirmPasswordFocus,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  labelText: 'confirm_password'.tr,
                  required: true,
                  validator: (value) => ValidateCheck.validateConfirmPassword(value, _passwordController.text.trim()),
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                CustomButton(
                  buttonText: "sign_up".tr,
                  radius: Dimensions.radiusSizeDefault,
                  isLoading: authController.isLoading,
                  onPressed: (){
                    if(signUpKey.currentState!.validate()){
                      _signUp(authController: authController);
                    }
                  },
                ),

                const SizedBox(height: Dimensions.paddingSizeSmall),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Get.toNamed(RouteHelper.getSignInRoute());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, spacing: 5,
                    children: [
                      Text('already_member'.tr,
                        style: robotoRegular.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                        ),
                      ),
                      Text('login_here'.tr,
                        style: robotoRegular.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Get.height * 0.1)

              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp({required AuthController authController}){

    String fullName = _nameController.text.trim();
    String phone = ValidateCheck.getValidPhone( _phoneController.text.trim(), authController.countryCode);
    String password = _passwordController.text.trim();

    authController.register(name: fullName, phone: phone, password: password);

  }
}

