@Entry
@ComponentV2
struct ComponentQuestionCase {
  @Local money: number = 9999
  build() {
    Column() {
      Text('father:' + this.money)
      Button('父亲搬砖:存100块')
        .onClick(()=>{
          this.money += 100
        })
      CompQsChild({
        money: this.money,
        payMoney: () => {
          this.money -= 100
        }
      })
      .margin({ bottom: 30 })

      CompQsChild({
        money: this.money,
        payMoney: (money: number) => {
          this.money -= money
        }
      })
    }
    .padding(20)
    .width('80%')
    .margin(30)
    .border({ width: 2 })
  }
}

@ComponentV2
struct CompQsChild {
  // 希望money就是从外部传过来的, 必须传
  // @Require 修饰了 @Param 表示该参数是必须传递的
  @Require @Param money: number
  @Event payMoney: (money: number) => void = () => {}
  build() {
    Column() {
      Text('child: ' + this.money )
      Button('花100块')
        .onClick(()=>{
          // @Param 外部传递过来的数据, 不是自己的数据, 不能直接改
          // this.money -= 100
          // 如果想改, 需要通过 event 提交事件, 通知老爹改
          this.payMoney(50)
        })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}