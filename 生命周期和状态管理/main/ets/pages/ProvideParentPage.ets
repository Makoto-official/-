import { ConsumeChildPage } from "./ConsumeChildPage";

@Component
export  struct ProvideParentPage {
  @Consume money: number

  build() {
    Column({space: 20}) {
      Row({space: 10}){  //爸爸的钱包
        Text('爸爸组件： ' + this.money);
        Button('+1').onClick(()=>{
          this.money ++;
        })
      }

      Row(){  //孙子的钱包
        ConsumeChildPage()
      }
    }
    .height('100%')
    .width('100%')
  }
}