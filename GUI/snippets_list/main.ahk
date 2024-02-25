#include aws.ahk
#include mysql.ahk
#include powershell.ahk

class TargetSelector {
  __init() {
    this.targets := [
      "MySQL",
      "AWS",
      "PowerShell"
    ],
    this.snippet_selectors := [
      MysqlSnippetSelector(),
      AwsSnippetSelector(),
      PowerShellSnippetSelector(),
    ]
    this.window := Gui()
    this.Window.Opt("-Border")
    this.list := this.window.AddListBox("r5 w200", this.targets)
    this.button := this.window.AddButton("default w200", "OK")
    this.button.parent := this
    this.button.OnEvent("Click", this.select)
  }

  show() {
    this.window.show()
  }

  hide() {
    this.window.hide()
  }

  select(_) {
    this.parent.snippet_selectors[this.parent.list.value].show()
    this.parent.window.hide()
  }
}

target_selector := TargetSelector()