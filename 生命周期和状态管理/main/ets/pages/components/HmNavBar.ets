@Component
export struct HmNavBar {
  build() {
    Stack(){
      Row(){
        Text('评论回复');
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
        .fillColor('#999')
        .height(24)
        .width(24)
    }
    .height(50)
    .alignContent(Alignment.Start)
  }
}