import 'package:html_editor_enhanced/html_editor.dart';

HtmlEditor getHtmlEditor(HtmlEditorController controller) {
  return HtmlEditor(
    controller: controller,
    htmlEditorOptions: HtmlEditorOptions(
      darkMode: false,
      hint: 'Text here...',
      shouldEnsureVisible: true,
      //initialText: "<p>text content initial, if any</p>",
    ),
    htmlToolbarOptions: HtmlToolbarOptions(
      defaultToolbarButtons: [
        // FontSettingButtons(),
        FontButtons(
          bold: true,
          italic: true,
          underline: true,
          strikethrough: false,
          superscript: false,
          subscript: false,
        ),

        ListButtons(
          listStyles: false,
        ),
        ParagraphButtons(
            lineHeight: false,
            textDirection: false,
            increaseIndent: false,
            decreaseIndent: false,
            caseConverter: false),

        // OtherButtons()
        // StyleButtons()
      ],
      customToolbarButtons: [],
      toolbarPosition: ToolbarPosition.aboveEditor, //by default
      toolbarType: ToolbarType.nativeScrollable, //by default
      onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
        return true;
      },
      onDropdownChanged: (DropdownType type, dynamic changed,
          Function(dynamic)? updateSelectedItem) {
        print("dropdown '\${describeEnum(type)}' changed to \$changed");
        return true;
      },
      mediaLinkInsertInterceptor: (String url, InsertFileType type) {
        print(url);
        return true;
      },
    ),
    otherOptions: OtherOptions(height: 550),
    callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
      print('html before change is \$currentHtml');
    }, onChangeContent: (String? changed) {
      print('content changed to \$changed');
    }, onChangeCodeview: (String? changed) {
      print('code changed to \$changed');
    }, onChangeSelection: (EditorSettings settings) {
      print('parent element is \${settings.parentElement}');
      print('font name is \${settings.fontName}');
    }, onDialogShown: () {
      print('dialog shown');
    }, onEnter: () {
      print('enter/return pressed');
    }, onFocus: () {
      print('editor focused');
    }, onBlur: () {
      print('editor unfocused');
    }, onBlurCodeview: () {
      print('codeview either focused or unfocused');
    }, onInit: () {
      print('init');
    }, onImageUploadError:
        (FileUpload? file, String? base64Str, UploadError error) {
      print(base64Str ?? '');
      if (file != null) {
        print(file.name);
        print(file.size);
        print(file.type);
      }
    }, onKeyDown: (int? keyCode) {
      print('\$keyCode key downed');
      print('current character count: \${controller.characterCount}');
    }, onKeyUp: (int? keyCode) {
      print('\$keyCode key released');
    }, onMouseDown: () {
      print('mouse downed');
    }, onMouseUp: () {
      print('mouse released');
    }, onNavigationRequestMobile: (String url) {
      print(url);
      return NavigationActionPolicy.ALLOW;
    }, onPaste: () {
      print('pasted into editor');
    }, onScroll: () {
      print('editor scrolled');
    }),
    plugins: [
      SummernoteAtMention(
          getSuggestionsMobile: (String value) {
            var mentions = <String>['test1', 'test2', 'test3'];
            return mentions
                .where((element) => element.contains(value))
                .toList();
          },
          mentionsWeb: ['test1', 'test2', 'test3'],
          onSelect: (String value) {
            print(value);
          }),
    ],
  );
}
