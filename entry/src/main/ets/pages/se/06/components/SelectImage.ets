@ComponentV2
struct SelectImage {
  @Param imageList:ResourceStr[] = []
  build() {
    Column() {
      Row() {
        Text('取消')
        Text('已选中 0/9 张')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定')
      }.width('100%').padding(20)
      Grid() {
        ForEach(this.imageList, (item: ResourceStr) => {
          GridItem() {
            Image(item)
          }.aspectRatio(1)
        })
      }
      .padding(20)
      .layoutWeight(1)
      .rowsGap(10)
      .columnsGap(10)
      .columnsTemplate('1fr 1fr 1fr')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7f8')
  }
}
export { SelectImage }