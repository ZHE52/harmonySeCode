@Entry
@ComponentV2
struct ComponentQuestionCase1 {
  @Provider('totalMoney') money: number = 30000
  build() {
    Column() {
      Text('father: ' + this.money)
      Button('存100块')
        .onClick(() => {
          this.money += 100
        })
      CompChild()
        .margin({ top: 20 })
    }
    .padding(20)
    .margin(30)
    .border({ width: 2 })
    .width('80%')
  }
}

@ComponentV2
struct CompChild {
  @Consumer('totalMoney') money: number = 0
  build() {
    Column() {
      Text('child儿子: ' + this.money)
      Button('花100块')
        .onClick(() => {

        })
      ChildChild()
        .margin({ top: 20 })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}

@ComponentV2
struct ChildChild {
  @Consumer('totalMoney') money: number = 0
  build() {
    Column() {
      Text('ChildChild孙子: ' + this.money)
      Button('花100块')
        .onClick(() => {
          this.money -= 100
        })
    }
    .padding(20)
    .backgroundColor(Color.Orange)
  }
}
