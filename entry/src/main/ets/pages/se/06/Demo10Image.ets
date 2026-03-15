import { SelectImageIcon } from './builders/SelectImageIcon'
import { SelectImage } from './components/SelectImage'

@Entry
@ComponentV2
struct ImageSelectCase {
  @Local showDialog: boolean = false
  @Local imageList: ResourceStr[] = [
    "assets/1.webp",
    "assets/2.webp",
    "assets/3.webp",
    "assets/4.webp",
    "assets/5.webp",
    "assets/6.webp",
    "assets/7.webp",
    "assets/8.webp",
    "assets/9.webp",
    "assets/10.webp"
  ]
  @Builder showSheet () {
    // 大坑: 外层必须套一个容器组件
    Column() {
      SelectImage({
        imageList: this.imageList
      })
    }
  }
  build() {
    Grid() {
      GridItem() {
        SelectImageIcon()
      }
      .aspectRatio(1)
      .onClick(() => {
        this.showDialog = true
      })
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr')
    // 半模态弹层
    .bindSheet($$this.showDialog, this.showSheet(), {
      height: '80%',
      showClose: false
    })
  }
}
