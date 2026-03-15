@Entry
@ComponentV2
struct Demo07BuilderParam {
  @Builder
  LeftBuilder () {
    Image($r('sys.media.ohos_ic_compnent_titlebar_back_filled'))
      .width(20)
  }

  @Builder
  CenterBuilder () {
    Row() {
      Text('最新推荐')
      Text('🔥')
    }
  }

  build() {
    Column({ space: 20 }) {
      // 头部组件
      MyHead({
        leftContent: this.LeftBuilder,
        centerContent: this.CenterBuilder
      })
      MyHead()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}

// 前提:
// 1. 父子关系
// 2. BuilderParam往子组件放, 往子组件挖坑
//    挖坑: 这块结构不写死, 可以由调用者决定内容
@ComponentV2
struct MyHead {
  @Builder leftDefault () {
    Text('返回')
  }
  @BuilderParam leftContent: () => void = this.leftDefault

  @Builder centerDefault () {
    Text('默认标题')
      .fontSize(20)
  }
  @BuilderParam centerContent: () => void = this.centerDefault

  build() {
    Row() {
      this.leftContent()
      this.centerContent()
      Text('确定')
    }
    .padding(10)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(60)
    .backgroundColor(Color.Orange)
  }
}