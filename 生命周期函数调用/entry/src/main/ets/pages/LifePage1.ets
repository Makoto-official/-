import {router} from '@kit.ArkUI';

@Entry
@Component
struct LifePage1 {
  build() {
    RelativeContainer() {
      Button('跳转到下一页')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          router.pushUrl({url: 'pages/LifePage2'});
        })
    }
    .height('100%')
    .width('100%')
  }
  //写生命周期方法
  aboutToAppear(): void {
    console.info('aaa call about to appear method.');
  }
  onDidBuild(): void {
    console.info('aaa call on page build method.');
  }
  onPageShow(): void {
    console.info('aaa call on page show method.');
  }
  aboutToDisappear(): void {
    console.info('aaa call on page disappear method.');
  }
  onPageHide(): void {
    console.info('aaa call on page hide method.');
  }
  onBackPress(): boolean | void {
    console.info('aaa call on back press method.');
  }
}