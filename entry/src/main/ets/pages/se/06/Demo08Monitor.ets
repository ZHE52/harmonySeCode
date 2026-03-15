// 新建page, 和直接复制的区别:
// 新建page会帮我们自己注册页面, 将来模拟器里面可以运行加载
// 直接复制的页面, 模拟器/真机中, 无法渲染, 白屏
import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Demo08Monitor {
  // 暗恋的对象
  @Local username: string = '小花'
  // 希望小花20岁, 我就求婚
  @Local age: number = 17

  // 监视任何状态变量的变化, 提供对应的逻辑
  // @Monitor('age')
  // onAgeChange (monitor: IMonitor) {
  //   console.log(JSON.stringify(monitor.dirty))
  //   console.log(`${monitor.value('age')?.before}`)
  //   console.log(`${monitor.value('age')?.now}`)
  //
  //   promptAction.showDialog({
  //     message: '年纪变了:' + this.age
  //   })
  //   if (this.age === 20) {
  //     promptAction.showDialog({
  //       message: '花, 我知道你20了, 嫁给我吧'
  //     })
  //   }
  // }


  // 监视任何状态变量的变化, 提供对应的逻辑
  // 支持同时监视多个状态变量, 任何一个变化, 都会触发回调
  @Monitor('age', 'username')
  onInfoChange (monitor: IMonitor) {
    // console.log(JSON.stringify(monitor.dirty))
    monitor.dirty.forEach((path: string) => {
      console.log(`${monitor.value(path)?.before}`)
      console.log(`${monitor.value(path)?.now}`)
    })
  }
  build() {
    Column() {
      Text('姓名: ' + this.username)
      Text('年纪: ' + this.age)
      Button('过了一年后').onClick(() => {
        this.age++
        this.username = '大花'
      })
    }
    .width('100%')
  }
}