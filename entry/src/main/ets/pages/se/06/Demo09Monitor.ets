import { promptAction } from '@kit.ArkUI'

@ObservedV2
class Info {
  @Trace name: string = ''
  @Trace age: number = 0
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  // @Monitor('name')
  // onNameChange() {
  //   promptAction.showDialog({
  //     message: this.name
  //   })
  // }
  // // 此时就监听不到, 因为没有用@Trace监视
  // @Monitor('age')
  // onAgeChange() {
  //   promptAction.showDialog({
  //     message: this.age.toString()
  //   })
  // }
}

@Entry
@ComponentV2
struct Demo09Monitor {
  @Local info: Info = new Info('貂蝉', 18)
  @Monitor('info.name')
  onNameChange () {
    promptAction.showDialog({
      message: this.info.name
    })
  }

  build() {
    Column() {
      Text(this.info.name)
      Text(this.info.age.toString())
      Button('改名字').onClick(() => {
        this.info.name += '666'
      })
      Button('改年纪').onClick(() => {
        this.info.age++
      })
    }
    .width('100%')
  }
}