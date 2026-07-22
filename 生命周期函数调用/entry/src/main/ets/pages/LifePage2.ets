import {router} from '@kit.ArkUI';

@Entry
@Component
struct LifePage2 {
  build() {
    RelativeContainer() {
      Button('返回上一页')
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
        .onClick(() => {
          router.showAlertBeforeBackPage({
            message: '确认返回吗'
          });
        })
    }
    .height('100%')
    .width('100%')
  }
  //写生命周期方法
  aboutToAppear(): void {
    console.info('aaabbb call about to appear method.');
  }
  onDidBuild(): void {
    console.info('aaabbb call on page build method.');
  }
  onPageShow(): void {
    console.info('aaabbb call on page show method.');
  }
  aboutToDisappear(): void {
    console.info('aaabbb call on page disappear method.');
  }
  onPageHide(): void {
    console.info('aaabbb call on page hide method.');
  }
  onBackPress(): boolean | void {
    console.info('aaabbb call on back press method.');
  }
}