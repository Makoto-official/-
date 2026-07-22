@Component
export struct ConsumeChildPage {
  @Consume money: number

  build() {
    Column() {
      Row({space: 10}){  //孙子的钱包
        Text('孙子组件： ' + this.money);
        Button('+1').onClick(()=>{
          this.money ++;
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}