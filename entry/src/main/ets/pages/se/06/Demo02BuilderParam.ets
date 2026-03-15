@Entry
@ComponentV2
struct Demo02BuilderParam {
  // 当自定义组件只有一个BuilderParam时, 此时可以用尾随闭包语法 { }
  build() {
    Column({ space: 20 }) {
      HmPanel({ leftText: '低电量模式' }) {
        Toggle({
          type: ToggleType.Switch,
          isOn: true
        })
      }

      HmPanel() {}

      // HmPanel({
      //   rightContent: (参数: 参数类型) => {
      //     this.xxxBuilder(参数)
      //   }
      // })
    }
    .padding(10)
  }
}

@ComponentV2
struct HmPanel {
  @Param leftText: string = '左侧标题'

  @BuilderParam
  rightContent: () => void = this.defaultRender
  @Builder
  defaultRender () {
    Text('更多 >')
  }
  build() {
    Row() {
      Text(this.leftText)
      this.rightContent()
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#ccc')
    .borderRadius(8)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

