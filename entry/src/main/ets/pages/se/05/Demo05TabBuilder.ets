@Entry
@Component
struct Demo05TabBuilder {
  @Builder tabBarItem () {
    Column({ space: 5 }) {
      Image($r('app.media.ic_public_message'))
        .width(20)
        .height(20)
      Text('微信')
        .fontSize(12)
    }
  }

  build() {
    Tabs() {
      TabContent() {
        // 这里放的就是面板内容
        Text('面板1')
      }
      .tabBar(this.tabBarItem())

      TabContent() {
        // 这里放的就是面板内容
        Text('面板2')
      }
      .tabBar(this.tabBarItem())

      TabContent() {
        // 这里放的就是面板内容
        Text('面板3')
      }
      .tabBar(this.tabBarItem())
    }
    .barPosition(BarPosition.End)
    .animationDuration(0) // 动画时间, 可以调整为0
  }
}