import 'package:flutter/material.dart';
import 'package:techify_assesment/bloc/setting_bloc.dart';
import 'package:techify_assesment/constant/color_constant.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SettingBloc _settingBloc;

  @override
  void initState() {
    super.initState();
    _settingBloc = SettingBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: ColorConst.black,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: ColorConst.tabColor,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "D",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Michel Faradey",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(
                      "michelfaradey@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "SignOut",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConst.tabColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          StreamBuilder<bool>(
              initialData: false,
              stream: _settingBloc.isDark,
              builder: (context, snapshot) {
                return Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        getTileCard(
                          label: "Dark",
                          switchValue: snapshot.data!,
                          onClick: (value) => _settingBloc.switchToDark(value ?? false),
                        ),
                        getTileCard(
                          label: "Notification",
                          switchValue: false,
                          onClick: (p0) {},
                        )
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(height: 25),
          const Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  getTileCard(
                    label: "Edit",
                    onClick: (p0) {},
                  ),
                  getTileCard(
                    label: "Change Password",
                    onClick: (p0) {},
                  ),
                  getTileCard(
                    label: "Language",
                    onClick: (p0) {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Privacy and Security",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  getTileCard(
                    label: "Private Account",
                    switchValue: false,
                    onClick: (p0) {},
                  ),
                  getTileCard(
                    label: "Privacy and security help",
                    onClick: (p0) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTileCard({bool? switchValue, required String label, required Function(bool?) onClick}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        if (switchValue != null)
          Switch(
            value: switchValue,
            onChanged: (value) => onClick.call(value),
            activeColor: ColorConst.tabColor,
          )
        else
          IconButton(
            onPressed: () => onClick.call(null),
            icon: const Icon(
              Icons.arrow_right_sharp,
              size: 30,
            ),
          )
      ],
    );
  }
}
