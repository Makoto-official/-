import { promptAction } from '@kit.ArkUI';
import { WatchChildPage } from './WatchChildPage';

@Entry
@Component
struct WatchParentPage {
  @Watch('updateNum') @State num : number = 0;
  build() {
    Column({space: 20}) {
      Text('父组件${this.num}')

      Button('修改num变量')
        .onClick(()=>{
          this.num ++;
        });

      WatchChildPage({numb: this.num})
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#efefef')
  }
  //监听number的变化
  updateNum(){
    promptAction.showToast({message: '父亲的num值发生变化了${this.num}', duration: 3000, bottom: 20})
  }
}
