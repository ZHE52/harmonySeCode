interface TabInterface {
  name: string
  icon: ResourceStr  // Resrouce | string
  selectIcon: ResourceStr
  title: string
}

@Entry
@ComponentV2
struct Demo06TabForEach {
  @Local currentIndex: number = 0
  @Local list: TabInterface[] = [{
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '微信',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]

  @Builder tabBarItem (item: TabInterface) {
    Column({ space: 5 }) {
      Image(this.list[this.currentIndex].name === item.name ? item.selectIcon : item.icon)
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .fontColor(this.list[this.currentIndex].name === item.name ? '#51aa38': '#404040')
    }
  }

  build() {
    Tabs({ index: $$this.currentIndex }) {
      ForEach(this.list, (item: TabInterface) => {
        TabContent() {
          if (item.name === 'wechat') {
            WeChat() // 这是一个WeChat自定义组件
          }
          else if (item.name === 'connect') {
            Connect()
          }
          else {
            Text(item.name)
          }
        }
        .tabBar(this.tabBarItem(item))
      })

    }
    .barPosition(BarPosition.End)
    .animationDuration(0) // 动画时间, 可以调整为0
    .vertical(false)
  }
}

@ComponentV2
struct WeChat {
  build() {
    Column() {
      Text('我是微信首页')
      Button('我是按钮')
    }
  }
}

@ComponentV2
struct Connect {
  build() {
    Column() {
      Text('我是联系人')
    }
  }
}