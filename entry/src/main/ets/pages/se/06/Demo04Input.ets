import { HmInput } from './components/HmInput'

@Entry
@ComponentV2
struct Demo04Input {
  @Local username: string = ''
  build() {
    Column({ space: 20 }) {
      // 诉求: 希望username和输入框的值双向绑定
      HmInput({
        placeHolder: '请输入用户名',
        text: this.username!!
        // $text: (val: string) => {
        //   this.username = val
        // }
      })


      Text('用户名: ' + this.username)
    }
    .padding(20)
  }
}

