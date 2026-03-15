import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Parent {
  @Provider() onSubmit: (txt: string) => void = (txt: string) => {
    promptAction.showDialog({
      message: txt
    })
  }
  build() {
    Column() {
      Child()
    }
    .padding(20)
  }
}

@ComponentV2
struct Child {
  @Local txt: string = ''
  @Consumer() onSubmit:  (txt: string) => void   =  () => {}
  build() {
    Column() {
      TextInput({ text: $$this.txt })
        .onSubmit(() => {
          this.onSubmit(this.txt)
        })
        .border({ color: Color.Blue, width: 2 })
    }
  }
}