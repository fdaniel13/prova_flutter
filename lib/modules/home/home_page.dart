import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prova_flutter/core/models/text_data.dart';
import 'package:prova_flutter/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final controller = Modular.get<HomeController>();
  Future? data;
  @override
  void initState() {
    controller.editTextId = null;
    data = controller.crud.initTextList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 14, 59, 52),
                    Color.fromARGB(255, 35, 137, 122),
                  ],
                )),
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 14, 59, 52),
                    Color.fromARGB(255, 35, 137, 122),
                  ],
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Observer(builder: (context) {
                          return ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (_, i) {
                                return _cardText(
                                    value: controller.crud.listText[i]);
                              },
                              separatorBuilder: (_, j) {
                                return const SizedBox();
                              },
                              itemCount: controller.crud.listText.length);
                        })),
                    const SizedBox(
                      height: 32,
                    ),
                    Form(
                        child: TextFormField(
                      controller: textController,
                      onFieldSubmitted: (text) async {
                        if (controller.editTextId == null) {
                          controller.crud.addText(text: text);
                        } else {
                          controller.crud.editText(
                            id: controller.editTextId!,
                            value: text,
                          );
                          controller.editTextId = null;
                        }
                        await controller.saveText(text: text);
                        textController.clear();
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "Digite seu texto",
                          alignLabelWithHint: true,
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder()),
                    )),
                    const SizedBox(
                      height: 64,
                    ),
                    TextButton(
                        onPressed: () {
                          Modular.to.pushNamed("webPage");
                        },
                        child: Text(
                          "Política de Privacidade",
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _cardText({required TextData value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    value.text!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        textController.text = value.text!;
                        controller.editTextId = value.id;
                      },
                      icon: Icon(
                        Icons.border_color,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text(
                                    "Deseja mesmo excluir o texto?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  actions: [
                                    OutlinedButton(
                                      onPressed: () async {
                                        controller.crud
                                            .removeText(id: value.id!);
                                        await controller
                                            .saveText(text: value.text)
                                            .whenComplete(() => Navigator.of(
                                                    context,
                                                    rootNavigator: true)
                                                .pop());
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 48)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.red),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ))),
                                      child: Text(
                                        "sim",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                                  horizontal: 48)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color.fromARGB(
                                                      255, 47, 189, 109)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ))),
                                      child: Text(
                                        "não",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
