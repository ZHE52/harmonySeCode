@Entry
@ComponentV2
struct Demo03BuilderExm {
  @Local msg: string = '测试文本'

  @Builder CellContent(leftText: string, rightText: string) {
    Row() {
      Text(leftText)
      Text(rightText)
      // Text(this.msg).onClick(() => {
      //   this.msg = '嘎嘎'
      // })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .padding(20)
    .borderRadius(5)
  }

  @Builder cellContent123(left:string,right:string){
    Row(){
      Text(left)
      Text(right)
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
      this.CellContent('异常位置', '回龙观')
      this.CellContent('异常类型', '漏油')

      this.cellContent123('123','321')
    }
    .padding(10)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}