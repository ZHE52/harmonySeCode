interface IContent {
  leftText: string
  rightText: string
}


interface IContentCity{
  left:string
  right:string
}

@Entry
@ComponentV2
struct Demo03BuilderExm {
  // @Local修饰后, 一旦状态变化, 会通知到所有用到 area 的地方去更新
  @Local area: string = '北京-回龙观'

  @Builder CellContent(leftText: string, rightText: string) {
    Row() {
      Text(leftText)
      Text(rightText)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .padding(20)
    .borderRadius(5)
  }

  @Builder CellContentObj(obj: IContent) {
    Row() {
      Text(obj.leftText)
      Text(obj.rightText)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .padding(20)
    .borderRadius(5)
  }

  @Builder cellCity(obj:IContentCity){
    Row(){
      Text(obj.left)
      Text(obj.right)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .padding(20)
    .borderRadius(5)

  }

  build() {
    Column({ space: 20 }) {
      this.CellContent('异常时间', '2023-12-12')
      this.CellContent('异常位置', this.area)
      this.CellContent('异常类型', '漏油')

      Divider()

      // 当传入builder的是字面量对象, 是引用类型
      // 他上面关联的状态变量属性, 一旦变化, 会通知到更新的
      this.CellContentObj({
        leftText: '异常位置',
        rightText: this.area
      })
      Button('修改位置').onClick(() => {
        this.area = '上海-迪士尼'
      })

      this.cellCity({
        left:'异常位置',
        right:this.area
      })
        Button('河南修改位置')
          .onClick(()=>{
            this.area='长沙'
          })

    }
    .padding(10)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}