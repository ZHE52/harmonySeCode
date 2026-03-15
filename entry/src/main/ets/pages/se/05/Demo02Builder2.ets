import { globalItemBuilder } from './Demo01Builder';

@Entry
@Component
struct Demo02Builder2 {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 30 }) {
      globalItemBuilder('A. 吕布')
      globalItemBuilder('B. 张飞')
      globalItemBuilder('C. 貂蝉')
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}