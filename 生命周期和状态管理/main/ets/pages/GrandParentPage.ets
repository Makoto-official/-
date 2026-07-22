import { ProvideParentPage } from "./ProvideParentPage";
@Entry
@Component
export struct GrandParentPage {
  @Provide money: number = 0

  build() {
    Column({space: 20}) {
      Row({space: 10}){  //爷爷自己的钱包
          Text('爷爷组件： ' + this.money);
          Button('+1').onClick(()=>{
            this.money ++;
          })
      }

      Row(){  //爸爸的钱包
        ProvideParentPage()
      }

      Row(){  //孙子的钱包

      }
    }
    .height('100%')
    .width('100%')
  }
}