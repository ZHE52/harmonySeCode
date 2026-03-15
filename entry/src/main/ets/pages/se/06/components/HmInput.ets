@ComponentV2
struct HmInput {
  @Param text: string = ''
  @Param placeHolder: string = ''
  @Event $text: (val: string) => void = (val: string) => {}
  build() {
    TextInput({
      text: this.text,
      placeholder: this.placeHolder
    })
    .border({ width: 2, color: Color.Blue })
    .borderRadius(0)
    .onChange(value => {
      // 需要通过 event 通知到老爹修改
      // 如果想让父组件, 可以直接 !! 双向绑定, 事件名: $变量名
      this.$text(value)
    })
  }
}

export { HmInput }