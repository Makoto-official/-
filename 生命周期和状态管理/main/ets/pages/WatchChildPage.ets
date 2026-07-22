import { promptAction } from '@kit.ArkUI';

@Entry
@Component
export struct WatchChildPage {
  @Watch('updateChildNum') @Link numb : number;

  build() {
    Column({space: 20}) {
      Text(`子组件 ${this.numb}`);

      Button('修改子组件numb的值')
        .onClick(()=>{
        this.numb ++;
      })
    }
    .height('100%')
    .width('100%')
  }

  updateChildNum(){
    promptAction.showToast({message: '子组件的numb发生了变化'});
  }
}
