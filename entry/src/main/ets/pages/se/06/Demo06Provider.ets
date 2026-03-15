interface ICar {
  brand: string
  price: number
}

@ObservedV2
class Car {
  @Trace brand: string
  @Trace price: number
  constructor(obj: ICar) {
    this.brand = obj.brand
    this.price = obj.price
  }
}

@Entry
@ComponentV2
struct ComponentQuestionCase2 {
  @Provider('totalMoney') money: number = 30000
  // 默认只能监听到整个对象的修改, 监听到内部细节数据的修改, 需要配合@Trace
  @Provider('hmCar') car: Car = new Car({
    brand: '小米苏7',
    price: 200000
  })
  build() {
    Column() {
      Text('father: ' + this.money)
      Text(this.car.brand + '_' + this.car.price)
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
  @Consumer('hmCar') car: Car = new Car({} as ICar)
  build() {
    Column() {
      Text('ChildChild孙子: ' + this.money)
      Text(this.car.brand + '_' + this.car.price)
      Row() {
        Button('花100块')
          .onClick(() => {
            this.money -= 100
          })
        Button('修改数据')
          .onClick(() => {
            // this.car.brand = '小米奥抽'
            // this.car.price += 10000
            this.car = new Car({
              brand: '小黄车',
              price: 200
            })
          })
      }
    }
    .padding(20)
    .backgroundColor(Color.Orange)
  }
}
